document.addEventListener("DOMContentLoaded", () => {
  const revealDelay = 180;
  const container = document.querySelector("[data-kiwi-animation]");
  const prefersReducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  if (!(container instanceof HTMLElement) || prefersReducedMotion || !window.lottie) return;

  const path = container.dataset.lottieAnimation;
  if (!path) return;

  const animation = window.lottie.loadAnimation({
    container,
    renderer: "svg",
    loop: true,
    autoplay: false,
    path,
    rendererSettings: { preserveAspectRatio: "xMidYMid meet" },
  });

  animation.addEventListener("DOMLoaded", () => {
    window.setTimeout(() => {
      animation.play();
      container.setAttribute("data-lottie-ready", "");
    }, revealDelay);
  });
});
