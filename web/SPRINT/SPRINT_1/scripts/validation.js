function signUpValidation() {
    let email = document.getElementById("signup_email").value;
    let password = document.getElementById("signup_password").value;
    let repeat = document.getElementById("signup_password_repeat").value;
    let fullName = document.getElementById("signup_fullName").value;

    if (emailIsValid(email) && passwordIsValid(password)
        && passwordMatchingIsCorrect(password, repeat) && fullNameIsValid(fullName))
        document.getElementById("signInButton").removeAttribute("disabled");
}

function emailIsValid(input) {
    let regex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
    if (!regex.test(input)) {
        document.getElementById("emailHelp").innerText = "Invalid email, try again";
        return false;
    } else {
        document.getElementById("emailHelp").innerText = "";
        return true;
    }
}

function passwordIsValid(input) {
    let regex = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8})$/;
    if (!regex.test(input)) {
        document.getElementById("passwordHelp").innerText = "Invalid password! The password should contain " +
            "minimum eight characters, at least one letter, one number and one special character:";
        return false;
    } else {
        document.getElementById("passwordHelp").innerText = "";
        return true;
    }
}

function passwordMatchingIsCorrect(input, repeat) {
    if (!input === repeat) {
        document.getElementById("passwordRepeatHelp").innerText = "Passwords are not same, try again";
        return false;
    } else {
        document.getElementById("passwordRepeatHelp").innerText = "";
        return true;
    }
}

function fullNameIsValid(input) {
    let regex = /^[a-zA-Z]+ [a-zA-Z]+$/;
    if (!regex.test(input)) {
        document.getElementById("fullNameHelp").innerText = "Invalid full name, try again";
        return false;
    } else {
        document.getElementById("fullNameHelp").innerText = "";
        return true;
    }
}