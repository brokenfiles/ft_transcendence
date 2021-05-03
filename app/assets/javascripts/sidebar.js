const $navbar = document.getElementById('navbar')
const $sidebar = document.getElementById('sidebar')
const navHeight = $navbar.offsetHeight

$sidebar.style.top = `${navHeight}px`
