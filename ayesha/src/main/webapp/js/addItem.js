const backendUrl = "http://localhost:8080/ayesha_backend/api/items";

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
                <button onclick="openEditPopup(${item.id}, '${escapeQuotes(item.name)}', ${item.price}, ${item.quantity})">Edit</button>
                <button onclick="deleteItem(${item.id})">Delete</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

document.getElementById("addItemForm").onsubmit = function(e) {
    e.preventDefault();
    const name = this.name.value;
    const price = parseFloat(this.price.value);
    const quantity = parseInt(this.quantity.value);
    fetch(backendUrl, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({ name, price, quantity })
    })
    .then(res => {
        if (!res.ok) throw new Error("Network error");
        return res.json();
    })
    .then(() => {
        this.reset();
        fetchItems();
    })
    .catch(err => {
        alert("Error adding item: " + err.message);
    });
};

document.getElementById("searchInput").oninput = function() {
    fetchItems(this.value);
};

function openEditPopup(id, name, price, quantity) {
    document.getElementById("editId").value = id;
    document.getElementById("editName").value = name;
    document.getElementById("editPrice").value = price;
    document.getElementById("editQuantity").value = quantity;
    document.getElementById("editPopup").style.display = "flex";
}

function closeEditPopup() {
    document.getElementById("editPopup").style.display = "none";
}

document.getElementById("editItemForm").onsubmit = function(e) {
    e.preventDefault();
    const id = document.getElementById("editId").value;
    const name = document.getElementById("editName").value;
    const price = parseFloat(document.getElementById("editPrice").value);
    const quantity = parseInt(document.getElementById("editQuantity").value);
    fetch(backendUrl + "/" + id, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({ name, price, quantity })
    })
    .then(res => {
        if (!res.ok) throw new Error("Network error");
        return res.json();
    })
    .then(() => {
        closeEditPopup();
        fetchItems();
    })
    .catch(err => {
        alert("Error updating item: " + err.message);
    });
};

function deleteItem(id) {
    if (confirm("Delete this item?")) {
        fetch(backendUrl + "/" + id, { method: "DELETE" })
            .then(res => {
                if (!res.ok) throw new Error("Network error");
                fetchItems();
            })
            .catch(err => {
                alert("Error deleting item: " + err.message);
            });
    }
}

function escapeQuotes(str) {
    return str.replace(/'/g, "\\'");
}

// Initial load
fetchItems();