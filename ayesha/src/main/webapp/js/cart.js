const backendUrlItems = "http://localhost:8080/ayesha_backend/api/items";
const backendUrlCustomer = "http://localhost:8080/ayesha_backend/api/customers";
const backendUrlOrder = "http://localhost:8080/ayesha_backend/api/orders";

let itemsMap = {}; // id -> item info (for quantity check)

function getCart() {
    return JSON.parse(localStorage.getItem("cart") || "[]");
}

function setCart(cart) {
    localStorage.setItem("cart", JSON.stringify(cart));
}

function renderCart() {
    fetch(backendUrlItems)
        .then(res => res.json())
        .then(items => {
            itemsMap = {};
            items.forEach(i => itemsMap[i.id] = i);

            const cart = getCart();
            if (cart.length === 0) {
                document.getElementById("cartList").innerHTML = "<p>Your cart is empty.</p>";
                document.getElementById("checkoutSection").innerHTML = "";
                return;
            }
            let html = "<table><tr><th>Name</th><th>Price</th><th>Quantity</th><th>Subtotal</th><th>Actions</th></tr>";
            let total = 0;
            cart.forEach((item, idx) => {
                let availableQty = itemsMap[item.id] ? itemsMap[item.id].quantity + item.quantity : item.quantity; // Add back what's in cart
                let maxQty = availableQty;
                if (item.quantity > maxQty) item.quantity = maxQty;
                let subtotal = item.price * item.quantity;
                total += subtotal;
                html += `<tr>
                    <td>${item.name}</td>
                    <td>${item.price}</td>
                    <td>
                        <input type="number" min="1" max="${maxQty}" value="${item.quantity}" onchange="changeQty(${item.id}, this.value)">
                    </td>
                    <td id="subtotal-${item.id}">${subtotal.toFixed(2)}</td>
                    <td>
                        <button onclick="removeFromCart(${item.id})">Remove</button>
                    </td>
                </tr>`;
            });
            html += `<tr><td colspan="3"><strong>Total</strong></td><td colspan="2" id="cartTotal"><strong>${total.toFixed(2)}</strong></td></tr></table>`;
            document.getElementById("cartList").innerHTML = html;
            renderCheckoutSection(total);
        });
}

window.changeQty = function(id, value) {
    let cart = getCart();
    let item = cart.find(i => i.id === id);
    let maxQty = itemsMap[id] ? itemsMap[id].quantity + item.quantity : item.quantity;
    let qty = parseInt(value);
    if (qty < 1) qty = 1;
    if (qty > maxQty) qty = maxQty;
    item.quantity = qty;
    setCart(cart);
    renderCart();
};

window.removeFromCart = function(id) {
    let cart = getCart().filter(i => i.id !== id);
    setCart(cart);
    renderCart();
};

function renderCheckoutSection(total) {
    let html = `
        <h3>Checkout</h3>
        <form id="checkoutForm">
            <label>Customer Phone:</label>
            <input type="text" id="customerPhone" required maxlength="20" />
            <button type="button" onclick="searchCustomer()">Check</button>
            <div id="customerInfo"></div>
            <button type="submit" id="checkoutBtn" disabled>Checkout</button>
        </form>
    `;
    document.getElementById("checkoutSection").innerHTML = html;
}

window.searchCustomer = function() {
    let phone = document.getElementById("customerPhone").value.trim();
    if (!phone) return;
    fetch(backendUrlCustomer + "/search?phone=" + encodeURIComponent(phone))
        .then(res => res.json())
        .then(customer => {
            if (customer && customer.id) {
                document.getElementById("customerInfo").innerHTML =
                    `<p>Customer: <strong>${customer.name}</strong></p>
                    <input type="hidden" id="customerId" value="${customer.id}">
                    <input type="hidden" id="customerName" value="${customer.name}">
                    <input type="hidden" id="customerContact" value="${customer.contact}">`;
            } else {
                document.getElementById("customerInfo").innerHTML =
                    `<p>New customer. Please enter name:</p>
                    <input type="text" id="newCustomerName" required placeholder="Customer Name">`;
            }
            document.getElementById("checkoutBtn").disabled = false;
        })
        .catch(() => {
            document.getElementById("customerInfo").innerHTML =
                `<p>New customer. Please enter name:</p>
                <input type="text" id="newCustomerName" required placeholder="Customer Name">`;
            document.getElementById("checkoutBtn").disabled = false;
        });
};

document.addEventListener("submit", function(e) {
    if (e.target && e.target.id === "checkoutForm") {
        e.preventDefault();
        let cart = getCart();
        if (cart.length === 0) {
            alert("Cart is empty!");
            return;
        }
        let customerId = document.getElementById("customerId") ? parseInt(document.getElementById("customerId").value) : 0;
        let customerName = document.getElementById("customerName") ? document.getElementById("customerName").value : "";
        let customerContact = document.getElementById("customerContact") ? document.getElementById("customerContact").value : document.getElementById("customerPhone").value;
        if (!customerId) {
            customerName = document.getElementById("newCustomerName").value;
            if (!customerName) {
                alert("Please enter customer name");
                return;
            }
        }
        // Prepare order payload
        let order = {
            customerId,
            customerName,
            customerContact,
            items: cart.map(i => ({
                itemId: i.id,
                name: i.name,
                price: i.price,
                quantity: i.quantity
            }))
        };
        fetch(backendUrlOrder, {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify(order)
        })
        .then(res => {
            if (!res.ok) throw new Error("Order failed");
            return res.json();
        })
        .then(order => {
            // Show receipt
            showReceipt(order);
            setCart([]); // Empty cart
            renderCart();
        })
        .catch(err => {
            alert("Error placing order: " + err.message);
        });
    }
});

function showReceipt(order) {
    let html = `<h3>Order Receipt</h3>
        <p>Order ID: ${order.id}</p>
        <p>Customer: ${order.customerName} (${order.customerContact})</p>
        <p>Order Date: ${order.orderTime}</p>
        <table><tr><th>Name</th><th>Price</th><th>Quantity</th><th>Subtotal</th></tr>`;
    let total = 0;
    order.items.forEach(item => {
        let subtotal = item.price * item.quantity;
        total += subtotal;
        html += `<tr>
            <td>${item.name}</td>
            <td>${item.price}</td>
            <td>${item.quantity}</td>
            <td>${subtotal.toFixed(2)}</td>
        </tr>`;
    });
    html += `<tr><td colspan="3"><strong>Total</strong></td><td><strong>${total.toFixed(2)}</strong></td></tr></table>
        <button onclick="closeReceiptPopup()">Close</button>`;
    document.getElementById("receiptContent").innerHTML = html;
    document.getElementById("receiptPopup").style.display = "flex";
}

window.closeReceiptPopup = function() {
    document.getElementById("receiptPopup").style.display = "none";
};

// Initial render
renderCart();