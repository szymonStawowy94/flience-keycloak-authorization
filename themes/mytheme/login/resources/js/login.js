document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("[data-password-toggle]").forEach((toggle) => {
    if (!(toggle instanceof HTMLButtonElement)) return;

    const passwordId = toggle.getAttribute("aria-controls");
    const password = passwordId ? document.getElementById(passwordId) : null;
    const icon = toggle.querySelector("[data-password-toggle-icon]");
    if (!(password instanceof HTMLInputElement) || !(icon instanceof HTMLImageElement)) return;

    const updateToggle = (isVisible) => {
      password.type = isVisible ? "text" : "password";
      icon.src = isVisible ? icon.dataset.visibleSrc : icon.dataset.hiddenSrc;
      toggle.setAttribute("aria-label", isVisible ? document.body.dataset.hidePasswordLabel : document.body.dataset.showPasswordLabel);
    };

    toggle.addEventListener("click", () => updateToggle(password.type !== "text"));
  });
});

document.addEventListener("DOMContentLoaded", () => {
  const messages = document.body.dataset;
  const getFieldContainer = (field) =>
    field.closest(".flience-field") || field.closest(".flience-consent")?.parentElement || field.parentElement;

  const getClientErrorContainer = (field) =>
    field.closest(".flience-password-control") || getFieldContainer(field);

  const getErrorId = (field) => `client-error-${field.id || field.name}`;

  const setDescribedBy = (field, errorId, shouldDescribe) => {
    const ids = (field.getAttribute("aria-describedby") || "").split(/\s+/).filter(Boolean);
    const nextIds = shouldDescribe ? [...new Set([...ids, errorId])] : ids.filter((id) => id !== errorId);

    if (nextIds.length) field.setAttribute("aria-describedby", nextIds.join(" "));
    else field.removeAttribute("aria-describedby");
  };

  const hasServerError = (field) => Boolean(getFieldContainer(field)?.querySelector(".flience-field-error:not([data-client-error])"));

  const clearClientError = (field) => {
    const errorId = getErrorId(field);
    document.getElementById(errorId)?.remove();
    setDescribedBy(field, errorId, false);
    field.setAttribute("aria-invalid", hasServerError(field) ? "true" : "false");
  };

  const getMessage = (field) => {
    if (field.validity.valueMissing) return messages.validationRequired;
    if (field.validity.typeMismatch && field.type === "email") return messages.validationEmail;
    if (field.validity.tooShort) return messages.validationTooShort.replace("{0}", field.minLength);
    return field.validationMessage || messages.validationGeneric;
  };

  const isValidPolishNip = (value) => {
    const nip = value.replace(/[\s-]/g, "");
    if (!/^\d{10}$/.test(nip)) return false;

    const weights = [6, 5, 7, 2, 3, 4, 5, 6, 7];
    const checksum = weights.reduce((sum, weight, index) => sum + Number(nip[index]) * weight, 0) % 11;

    return checksum !== 10 && checksum === Number(nip[9]);
  };

  const isValidPolishRegon = (value) => {
    const regon = value.replace(/[\s-]/g, "");
    if (!/^\d{9}(\d{5})?$/.test(regon)) return false;

    const hasValidChecksum = (digits, weights) => {
      const checksum = weights.reduce((sum, weight, index) => sum + Number(digits[index]) * weight, 0) % 11;
      return (checksum === 10 ? 0 : checksum) === Number(digits[weights.length]);
    };

    return hasValidChecksum(regon, [8, 9, 2, 3, 4, 5, 6, 7])
      && (regon.length === 9 || hasValidChecksum(regon, [2, 4, 8, 5, 0, 9, 7, 3, 6, 1, 2, 4, 8]));
  };

  const validateField = (field) => {
    if (field.disabled || field.type === "hidden") return true;

    if (field.name === "password-confirm") {
      const password = field.form?.querySelector('input[name="password"], input[name="password-new"]');
      field.setCustomValidity(password instanceof HTMLInputElement && field.value && password.value !== field.value ? messages.validationPasswordMismatch : "");
    }

    if (field.name === "organizationTaxId") {
      field.setCustomValidity(field.value && !isValidPolishNip(field.value) ? messages.validationNip : "");
    }

    if (field.name === "organizationRegon") {
      field.setCustomValidity(field.value && !isValidPolishRegon(field.value) ? messages.validationRegon : "");
    }

    if (field.checkValidity()) {
      clearClientError(field);
      return true;
    }

    const errorId = getErrorId(field);
    const container = getClientErrorContainer(field);
    let error = document.getElementById(errorId);

    if (!error && container) {
      error = document.createElement("span");
      error.id = errorId;
      error.className = "flience-field-error";
      error.dataset.clientError = "";
      error.setAttribute("role", "alert");
      container.append(error);
    }

    if (error) error.textContent = getMessage(field);
    field.setAttribute("aria-invalid", "true");
    setDescribedBy(field, errorId, true);
    return false;
  };

  document.querySelectorAll("form").forEach((form) => {
    if (!(form instanceof HTMLFormElement)) return;

    const fields = Array.from(form.querySelectorAll("input, select, textarea")).filter(
      (field) => field instanceof HTMLInputElement || field instanceof HTMLSelectElement || field instanceof HTMLTextAreaElement,
    );

    form.noValidate = true;
    fields.forEach((field) => {
      field.addEventListener("blur", () => {
        field.dataset.validationTouched = "true";
        validateField(field);
      });
      field.addEventListener("change", () => {
        if (field.type === "checkbox" || field instanceof HTMLSelectElement) validateField(field);
      });
      field.addEventListener("input", () => {
        if (field.dataset.validationTouched === "true") validateField(field);

        if (field.name === "password" || field.name === "password-new") {
          const confirmation = form.querySelector('input[name="password-confirm"]');
          if (confirmation instanceof HTMLInputElement && confirmation.dataset.validationTouched === "true") validateField(confirmation);
        }
      });
    });

    form.addEventListener("submit", (event) => {
      const invalidField = fields.find((field) => !validateField(field));
      if (!invalidField) return;

      event.preventDefault();
      invalidField.focus();
    });
  });
});
