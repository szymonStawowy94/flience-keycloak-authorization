document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("[data-registration-variant]");
  if (!(form instanceof HTMLFormElement)) return;
  const params = new URLSearchParams(window.location.search);
  const isOrganization = params.get("registrationType") === "organization";
  const organizationSection = document.querySelector("[data-registration-organization]");
  form.dataset.registrationVariant = isOrganization ? "organization" : "personal";
  if (organizationSection instanceof HTMLElement) {
    organizationSection.hidden = !isOrganization;
    organizationSection.querySelectorAll("input, select, textarea").forEach((field) => { field.disabled = !isOrganization; });
  }
  const copy = isOrganization ? { context: "Zakładasz konto organizacji.", submit: "Utwórz organizację" } : { context: "Zakładasz konto osobiste.", submit: "Utwórz konto" };
  document.querySelectorAll("[data-registration-context]").forEach((element) => { element.textContent = copy.context; });
  document.querySelectorAll("[data-registration-submit]").forEach((element) => { element.textContent = copy.submit; });
  document.querySelectorAll("[data-registration-switch]").forEach((link) => { link.addEventListener("click", (event) => { event.preventDefault(); params.set("registrationType", isOrganization ? "personal" : "organization"); window.location.search = params.toString(); }); });
});
