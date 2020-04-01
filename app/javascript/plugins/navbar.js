const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-seeql');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 20) {
        navbar.classList.add('navbar-seeql-black');
      } else {
        navbar.classList.remove('navbar-seeql-black');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
