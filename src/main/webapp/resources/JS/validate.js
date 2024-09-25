document.addEventListener('DOMContentLoaded', function() {
    const form = document.forms['frm'];

    form.addEventListener('submit', function(event) {
        let isValid = true;

        // Clear previous error messages
        clearErrors();

        // Validate Username
        const username = form['username'].value;
        if (username.trim() === '') {
            showError('username', 'Username is required.');
            isValid = false;
        }

        // Validate Password
        const password = form['password'].value;
        if (password.trim() === '') {
            showError('password', 'Password is required.');
            isValid = false;
        } else if (password.length < 6) {
            showError('password', 'Password must be at least 6 characters.');
            isValid = false;
        }

        // Validate Email
        const email = form['mail'].value;
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email.trim() === '') {
            showError('mail', 'Email is required.');
            isValid = false;
        } else if (!emailPattern.test(email)) {
            showError('mail', 'Please enter a valid email address.');
            isValid = false;
        }

        // Validate Contact Number
        const contact = form['contact'].value;
        const contactPattern = /^[0-9]{10}$/; // Example: 10-digit number
        if (contact.trim() === '') {
            showError('contact', 'Contact number is required.');
            isValid = false;
        } else if (!contactPattern.test(contact)) {
            showError('contact', 'Please enter a valid 10-digit contact number.');
            isValid = false;
        }

        if (!isValid) {
            event.preventDefault();
        }
    });

    function showError(fieldId, message) {
        const field = document.getElementById(fieldId);
        const errorSpan = document.createElement('span');
        errorSpan.classList.add('text-danger');
        errorSpan.innerText = message;
        field.parentElement.appendChild(errorSpan);
    }

    function clearErrors() {
        const errorSpans = document.querySelectorAll('.text-danger');
        errorSpans.forEach(span => span.remove());
    }
});
