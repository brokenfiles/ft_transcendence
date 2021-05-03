const $icon = document.getElementById('dropdown-icon')

function rotateIcon($icon, open) {
    $icon.style.transform = `rotate(${open ? '0' : '180'}deg)`
}

/**
 * Adding event listener to dropdown-button
 */
document.getElementById('dropdown-button')
    .addEventListener('click', function () {
        const $button = this
        const targetID = $button.getAttribute('target')
        const $target = document.getElementById(targetID)
        if ($target !== null) {
            const containsHidden = $target.classList.contains('hidden')
            if (containsHidden) {
                const navHeight = document.getElementById('navbar').offsetHeight
                $target.style.top = `${navHeight}px`
                $target.classList.remove('hidden')
                $target.focus()
            } else {
                $target.classList.add('hidden')
            }
            rotateIcon($icon, !containsHidden)
        }
    })

let onDropdown = false

document.getElementById('dropdown-button')
    .addEventListener('mouseenter', function () {
        onDropdown = true
    })

document.getElementById('dropdown-button')
    .addEventListener('mouseleave', function () {
        onDropdown = false
    })

document.getElementById('dropdown-menu')
    .addEventListener('blur', function () {
        if (!this.classList.contains('hidden') && onDropdown === false) {
            this.classList.add('hidden')
            rotateIcon($icon, true)
        }
    })
