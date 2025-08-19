const backendUrl = "http://localhost:8080/ayesha_backend/api/customers";

function fetchCustomers(search = "") {
    fetch(backendUrl + (search ? "?search=" + encodeURIComponent(search) : ""))
        .then(res => res.json())
        .then(customers => renderCustomerTable(customers));
}

function renderCustomerTable(customers) {
    const tbody = document.querySelector("#customerTable tbody");
    tbody.innerHTML = "";
    customers.forEach(c => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${c.name}</td>
            <td>${c.contact}</td>
            <td>
                <button onclick="openEditPopup(${c.id}, '${c.name}', '${c.contact}')">Edit</button>
                <button onclick="deleteCustomer(${c.id})">Delete</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

document.getElementById("addCustomerForm").onsubmit = function(e) {
    e.preventDefault();
    const name = this.name.value;
    const contact = this.contact.value;
    fetch(backendUrl, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({ name, contact })
    })
    .then(res => res.json())
    .then(() => {
        this.reset();
        fetchCustomers();
    });
};

document.getElementById("searchInput").oninput = function() {
    fetchCustomers(this.value);
};

function openEditPopup(id, name, contact) {
    document.getElementById("editId").value = id;
    document.getElementById("editName").value = name;
    document.getElementById("editContact").value = contact;
    document.getElementById("editPopup").style.display = "block";
}

function closeEditPopup() {
    document.getElementById("editPopup").style.display = "none";
}

document.getElementById("editCustomerForm").onsubmit = function(e) {
    e.preventDefault();
    const id = document.getElementById("editId").value;
    const name = document.getElementById("editName").value;
    const contact = document.getElementById("editContact").value;
    fetch(backendUrl + "/" + id, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({ name, contact })
    })
    .then(res => res.json())
    .then(() => {
        closeEditPopup();
        fetchCustomers();
    });
};

function deleteCustomer(id) {
    if (confirm("Delete this customer?")) {
        fetch(backendUrl + "/" + id, { method: "DELETE" })
            .then(() => fetchCustomers());
    }
}

// Initial load
fetchCustomers();