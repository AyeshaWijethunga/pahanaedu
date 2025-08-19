document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("loginForm");
    form && form.addEventListener("submit", function(e) {
        e.preventDefault();
        const username = form.username.value;
        const password = form.password.value;
        fetch("http://localhost:8080/ayesha_backend/api/auth/login", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: `username=${encodeURIComponent(username)}&password=${encodeURIComponent(password)}`
        })
        .then(response => {
            if (response.ok) {
                window.location.href = "main.jsp"; // Redirect on success
            } else {
                document.getElementById("errorMsg").textContent = "Invalid credentials!";
            }
        });
    });
});