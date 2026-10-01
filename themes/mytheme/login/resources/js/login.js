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
      toggle.setAttribute("aria-label", isVisible ? "Ukryj hasło" : "Pokaż hasło");
    };

    toggle.addEventListener("click", () => updateToggle(password.type !== "text"));
  });
});
