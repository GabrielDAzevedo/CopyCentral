// Scroll suave para as seções e logo
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const targetId = this.getAttribute('href');
        
        // Fecha o menu mobile se estiver aberto
        const navbarToggler = document.querySelector('.navbar-toggler');
        const navbarCollapse = document.querySelector('.navbar-collapse');
        if (navbarCollapse.classList.contains('show')) {
            navbarToggler.click();
        }
        
        // Verifica se o elemento existe
        const targetSection = document.querySelector(targetId);
        if (targetSection) {
            // Obtém a altura da navbar fixa
            const navbarHeight = document.querySelector('.navbar').offsetHeight;
            
            // Calcula a posição da seção
            const targetPosition = targetSection.offsetTop - navbarHeight;
            
            // Rola até a seção
            window.scrollTo({
                top: targetPosition,
                behavior: 'smooth'
            });
        }
    });
});

// Adiciona scroll suave para a logo
document.querySelector('.navbar-brand').addEventListener('click', function(e) {
    e.preventDefault();
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
    
    // Fecha o menu mobile se estiver aberto
    const navbarCollapse = document.querySelector('.navbar-collapse');
    if (navbarCollapse.classList.contains('show')) {
        document.querySelector('.navbar-toggler').click();
    }
});

// Adiciona classe 'scrolled' na navbar quando rolar a página
window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
    } else {
        navbar.classList.remove('scrolled');
    }
});

// Fecha o menu mobile ao clicar fora
document.addEventListener('click', function(e) {
    const navbarCollapse = document.querySelector('.navbar-collapse');
    const navbarToggler = document.querySelector('.navbar-toggler');
    
    // Verifica se o menu está aberto e se o clique não foi no menu ou no botão do menu
    if (navbarCollapse.classList.contains('show') && 
        !navbarCollapse.contains(e.target) && 
        !navbarToggler.contains(e.target)) {
        navbarToggler.click();
    }
}); 