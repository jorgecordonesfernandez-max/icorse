(function () {
  var scrollTrigger = 36;

  function updateHeaderState() {
    if (window.scrollY > scrollTrigger) {
      document.body.classList.add('page-scrolled');
    } else {
      document.body.classList.remove('page-scrolled');
    }
  }

  window.addEventListener('scroll', updateHeaderState, { passive: true });
  window.addEventListener('resize', updateHeaderState);
  updateHeaderState();
})();
