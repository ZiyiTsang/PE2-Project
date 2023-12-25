
function calculateTotalPrice() {
    var checkboxes = document.getElementsByClassName('cart_item_checkbox');
    var totalPrice = 0;

    Array.from(checkboxes).forEach(function (checkbox) {
        if (checkbox.checked) {
            var itemPrice = checkbox.parentElement.parentElement.nextElementSibling.firstElementChild.innerText;
            totalPrice += parseFloat(itemPrice);
        }
    });

    document.getElementById('MainContent_TotalPrice').innerText = totalPrice.toFixed(0);
}