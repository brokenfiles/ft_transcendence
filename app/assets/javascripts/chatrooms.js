/**
 * Add open and close on chatrooms
 */
document.getElementById('chat-header')
    .addEventListener('click', function () {
        const $target = this.parentElement
        if ($target.classList.contains('open')) {
            $target.classList.remove('open')
            $target.classList.add('closed')
        } else {
            $target.classList.add('open')
            $target.classList.remove('closed')
        }
    })
