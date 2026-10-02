document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("[data-registration-variant]");
  if (!(form instanceof HTMLFormElement)) return;
  const params = new URLSearchParams(window.location.search);
  const isOrganization = params.get("registrationType") === "organization";
  const organizationSection = document.querySelector("[data-registration-organization]");
  const email = document.querySelector("[data-registration-email]");
  const username = document.querySelector("[data-registration-username]");
  form.dataset.registrationVariant = isOrganization ? "organization" : "personal";
  if (organizationSection instanceof HTMLElement) {
    organizationSection.hidden = !isOrganization;
    organizationSection.querySelectorAll("input, select, textarea").forEach((field) => { field.disabled = !isOrganization; });
  }
  const copy = isOrganization
    ? { context: form.dataset.registrationOrganizationContext, submit: form.dataset.registrationOrganizationSubmit }
    : { context: form.dataset.registrationPersonalContext, submit: form.dataset.registrationPersonalSubmit };
  document.querySelectorAll("[data-registration-context]").forEach((element) => { element.textContent = copy.context; });
  document.querySelectorAll("[data-registration-submit]").forEach((element) => { element.textContent = copy.submit; });
  if (email instanceof HTMLInputElement && username instanceof HTMLInputElement) {
    const syncUsername = () => { username.value = email.value; };
    syncUsername();
    email.addEventListener("input", syncUsername);
  }
  document.querySelectorAll("[data-select]").forEach((selectRoot) => {
    const nativeSelect = selectRoot.querySelector("[data-select-native]");
    const trigger = selectRoot.querySelector("[data-select-trigger]");
    const value = selectRoot.querySelector("[data-select-value]");
    const options = selectRoot.querySelector("[data-select-options]");
    const optionButtons = Array.from(selectRoot.querySelectorAll("[data-select-option]"));
    if (!(nativeSelect instanceof HTMLSelectElement) || !(trigger instanceof HTMLButtonElement) || !(value instanceof HTMLElement) || !(options instanceof HTMLElement)) return;

    const sync = () => {
      const selected = nativeSelect.options[nativeSelect.selectedIndex];
      const isFilled = Boolean(nativeSelect.value);
      value.textContent = selected ? selected.textContent : "";
      selectRoot.dataset.selectFilled = String(isFilled);
      optionButtons.forEach((option) => option.setAttribute("aria-selected", String(option instanceof HTMLElement && option.dataset.value === nativeSelect.value)));
      trigger.disabled = nativeSelect.disabled;
    };
    const close = () => {
      options.hidden = true;
      trigger.setAttribute("aria-expanded", "false");
      selectRoot.dataset.selectOpen = "false";
    };
    const open = () => {
      if (trigger.disabled) return;
      options.hidden = false;
      trigger.setAttribute("aria-expanded", "true");
      selectRoot.dataset.selectOpen = "true";
    };
    const choose = (selectedValue) => {
      nativeSelect.value = selectedValue;
      nativeSelect.dispatchEvent(new Event("change", { bubbles: true }));
      sync();
      close();
      trigger.focus();
    };

    sync();
    nativeSelect.addEventListener("change", sync);
    trigger.addEventListener("click", () => options.hidden ? open() : close());
    trigger.addEventListener("keydown", (event) => {
      if (["ArrowDown", "ArrowUp", "Enter", " "].includes(event.key)) {
        event.preventDefault();
        open();
        const selectedIndex = optionButtons.findIndex((option) => option.getAttribute("aria-selected") === "true");
        (optionButtons[selectedIndex < 0 ? 0 : selectedIndex] || optionButtons[0]).focus();
      }
    });
    optionButtons.forEach((option, index) => {
      option.addEventListener("click", () => choose(option.dataset.value || ""));
      option.addEventListener("keydown", (event) => {
        if (event.key === "Escape") { event.preventDefault(); close(); trigger.focus(); }
        if (event.key === "ArrowDown" || event.key === "ArrowUp") {
          event.preventDefault();
          const nextIndex = (index + (event.key === "ArrowDown" ? 1 : -1) + optionButtons.length) % optionButtons.length;
          optionButtons[nextIndex].focus();
        }
        if (event.key === "Enter" || event.key === " ") { event.preventDefault(); choose(option.dataset.value || ""); }
      });
    });
    document.addEventListener("click", (event) => { if (!selectRoot.contains(event.target)) close(); });
  });
  document.querySelectorAll("[data-registration-switch]").forEach((link) => { link.addEventListener("click", (event) => { event.preventDefault(); params.set("registrationType", isOrganization ? "personal" : "organization"); window.location.search = params.toString(); }); });
});
