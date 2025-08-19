function getCart() {
    return JSON.parse(localStorage.getItem("cart") || "[]");
}

function renderCart() {
    const cart = getCart();
    if (cart.length === 0) {
        document.getElementById("cartList").innerHTML = "<p>Your cart is empty.</p>";
        return;
    }
    let html = "<table><tr><th>Name</th><th>Price Per Unit</th><th>Quantity</th><th>Subtotal</th></tr>";
    let total = 0;
    cart.forEach(item => {
        let subtotal = item.price * item.quantity;
        total += subtotal;
        html += `<tr>
            <td>${item.name}</td>
            <td>${item.price}</td>
            <td>${item.quantity}</td>
            <td>${subtotal.toFixed(2)}</td>
        </tr>`;
    });
    html += `<tr><td colspan="3"><strong>Total</strong></td><td><strong>${total.toFixed(2)}</strong></td></tr></table>`;
    document.getElementById("cartList").innerHTML = html;
}

renderCart();