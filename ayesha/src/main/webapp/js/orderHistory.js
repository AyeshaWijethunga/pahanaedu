const backendUrl = "http://localhost:8080/ayesha_backend/api/order_history";

function fetchOrders(customer = "", from = "", to = "") {
    let url = backendUrl + "?customer=" + encodeURIComponent(customer)
        + "&from=" + encodeURIComponent(from)
        + "&to=" + encodeURIComponent(to);
    fetch(url)
        .then(res => res.json())
        .then(orders => renderOrderTable(orders))
        .catch(err => {
            alert("Error fetching orders: " + err.message);
        });
}

function renderOrderTable(orders) {
    const tbody = document.querySelector("#orderTable tbody");
    tbody.innerHTML = "";
    orders.forEach(order => {
        let itemsHtml = "<ul>";
        order.items.forEach(item => {
            itemsHtml += `<li>${item.name} (${item.quantity} x ${item.price})</li>`;
        });
        itemsHtml += "</ul>";
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${order.id}</td>
            <td>${order.customerName}</td>
            <td>${order.customerContact}</td>
            <td>${order.orderTime}</td>
            <td>${itemsHtml}</td>
            <td>
                <button onclick="deleteOrder(${order.id})">Delete</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

document.getElementById("filterForm").onsubmit = function(e) {
    e.preventDefault();
    const customer = document.getElementById("customerSearch").value;
    const from = document.getElementById("fromDate").value;
    const to = document.getElementById("toDate").value;
    fetchOrders(customer, from, to);
};

window.deleteOrder = function(id) {
    if (confirm("Delete this order?")) {
        fetch(backendUrl + "/" + id, { method: "DELETE" })
            .then(res => {
                if (!res.ok) throw new Error("Network error");
                fetchOrders();
            })
            .catch(err => {
                alert("Error deleting order: " + err.message);
            });
    }
};

// Initial load
fetchOrders();