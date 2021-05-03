//= require particles.min
//= require particles.json
//= require_self
//= require_tree .

const $navbar = document.getElementById('navbar')
const $sidebar = document.getElementById('sidebar')
const navHeight = $navbar.offsetHeight
const sideWidth = $sidebar.offsetWidth

const $app = document.getElementById('app')
$app.style['padding-top'] = `${navHeight}px`
$app.style['padding-left'] = `${sideWidth}px`

particlesJS.load('particles-js', 'assets/particles.json', function() {
    console.log('callback - particles.js config loaded');
});

