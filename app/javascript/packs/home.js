window.onscroll = () => {
    const nav = document.querySelector('.navbar');
    if (window.scrollY >= 200)
        nav.classList.add("nav-scrolled");
    else
        nav.classList.remove("nav-scrolled");
}


let flash = document.querySelector('.falsh-message ');
let flashBtn = document.querySelector('.flash-closeBtn');

if (flashBtn) {
    flashBtn.addEventListener('click', () => {
        flash.classList.remove("zoomIn");
        flash.classList.add("zoomOut");
        flash.classList.add('invisible');
        flash.classList.remove("visible");
    })

}

if (flash) {
    flash.classList.remove('invisible');
    flash.classList.add("visible");
    flash.classList.remove("zoomOut");
    flash.classList.add("zoomIn");
}


const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');
const main = document.getElementById('main-section');


signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});

let add_cart_sign = document.querySelectorAll('.add-cart-sign');

for (let i = 0; i < add_cart_sign.length; i++) {
    add_cart_sign[i].addEventListener('click', popup, false);
}

function popup() {
    container.classList.add("visible");
    container.classList.remove("zoomOut");
    container.classList.add("zoomIn");
    main.classList.add("blur");
    const btn_right = document.getElementById('close-btn-right');
    const btn_left = document.getElementById('close-btn-left');
    if (btn_right || btn_left) {
        btn_right.addEventListener('click', () => {
            container.classList.remove("zoomIn");
            container.classList.add("zoomOut");
            main.classList.remove("blur");
            container.classList.remove("visible");
        });
        btn_left.addEventListener('click', () => {
            container.classList.remove("zoomIn");
            container.classList.add("zoomOut");
            main.classList.remove("blur");
            container.classList.remove("visible");
        });
    }
};

let navBtn = document.querySelectorAll('.nav-link');

for (let i = 0; i < navBtn.length; i++) {
    navBtn[i].addEventListener('click', () => {
        activeBtn = document.querySelector('.active');
        activeBtn.classList.remove('active');
        navBtn[i].classList.add('active');
    })
}

document.getElementById('sign-in-link').addEventListener('click', popup, false);