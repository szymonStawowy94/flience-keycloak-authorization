document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.querySelector("[data-password-toggle]");
  const password = document.querySelector("#password");
  const icon = document.querySelector("[data-password-toggle-icon]");

  if (!(toggle instanceof HTMLButtonElement) || !(password instanceof HTMLInputElement) || !(icon instanceof HTMLImageElement)) return;

  const updateToggle = (isVisible) => {
    password.type = isVisible ? "text" : "password";
    icon.src = isVisible ? icon.dataset.visibleSrc : icon.dataset.hiddenSrc;
    toggle.setAttribute("aria-label", isVisible ? "Ukryj hasło" : "Pokaż hasło");
  };

  toggle.addEventListener("click", () => {
    updateToggle(password.type !== "text");
  });
});
