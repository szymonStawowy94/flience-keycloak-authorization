document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.querySelector("[data-password-toggle]");
  const password = document.querySelector("#password");

  if (!(toggle instanceof HTMLButtonElement) || !(password instanceof HTMLInputElement)) return;

  toggle.addEventListener("click", () => {
    const isVisible = password.type === "text";
    password.type = isVisible ? "password" : "text";
    toggle.setAttribute("aria-label", isVisible ? "Pokaż hasło" : "Ukryj hasło");
  });
});
