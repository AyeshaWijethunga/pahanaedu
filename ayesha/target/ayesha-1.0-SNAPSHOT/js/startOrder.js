const backendUrl = "http://localhost:8080/ayesha_backend/api/items";

// Load items and render them
function fetchItems(search = "") {
    fetch(backendUrl + (search ? "?search=" + encodeURIComponent(search) : ""))
        .then(res => {
            if (!res.ok) throw new Error("Network error");
            return res.json();
        })
        .then(items => renderItemTable(items))
        .catch(err => {
            alert("Error fetching items: " + err.message);
        });
}

function renderItemTable(items) {
    const tbody = document.querySelector("#itemTable tbody");
    tbody.innerHTML = "";
    items.forEach(item => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${item.name}</td>
            <td>${item.price}</td>
            <td>${item.quantity}</td>
            <td>
                <button onclick="openAddToCartPopup(${item.id}, '${escapeQuotes(item.name)}', ${item.price}, ${item.quantity})">Add to Cart</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

document.getElementById("searchInput").oninput = function() {
    fetchItems(this.value);
};

function openAddToCartPopup(id, name, price, availableQty) {
    document.getElementById("popupItemId").value = id;
    document.getElementById("popupItemName").textContent = name;
    document.getElementById("popupPrice").textContent = price;
    document.getElementById("popupAvailableQty").textContent = availableQty;
    document.getElementById("popupQty").max = availableQty;
    document.getElementById("popupQty").value = 1;
    document.getElementById("addToCartPopup").style.display = "flex";
}

function closeAddToCartPopup() {
    document.getElementById("addToCartPopup").style.display = "none";
}

// Cart functions using localStorage
function getCart() {
    return JSON.parse(localStorage.getItem("cart") || "[]");
}

function setCart(cart) {
    localStorage.setItem("cart", JSON.stringify(cart));
}

document.getElementById("addToCartForm").onsubmit = function(e) {
    e.preventDefault();
    const id = parseInt(document.getElementById("popupItemId").value);
    const name = document.getElementById("popupItemName").textContent;
    const price = parseFloat(document.getElementById("popupPrice").textContent);
    const availableQty = parseInt(document.getElementById("popupAvailableQty").textContent);
    const qty = parseInt(document.getElementById("popupQty").value);

    if (qty < 1 || qty > availableQty) {
        alert("Invalid quantity. Must be between 1 and " + availableQty);
        return;
    }

    let cart = getCart();
    let existing = cart.find(i => i.id === id);
    if (existing) {
        if (existing.quantity + qty > availableQty) {
            alert("Total quantity in cart cannot exceed available quantity.");
            return;
        }
        existing.quantity += qty;
    } else {
        cart.push({ id, name, price, quantity: qty });
    }
    setCart(cart);
    closeAddToCartPopup();
    alert("Added to cart!");
};

function redirectToCart() {
    window.location.href = "cart.jsp";
}

function escapeQuotes(str) {
    return str.replace(/'/g, "\\'");
}

// Initial load
fetchItems();