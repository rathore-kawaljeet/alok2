const form = document.getElementById("form");

form.addEventListener("submit", (e) => {
  e.preventDefault();

  const fullName = form["fullname"].value;
  const userName = form["username"].value;
  const email = form["email"].value;
  const password = form["password"].value;
  const cpassword = form["confirm-password"].value;

  const isValidEmail = (email) => {
    const re =
      /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
  };

  if (fullName === "") {
    addError("fullname", "Name can not be empty");
  } else {
    removeError("fullname");
  }

  if (userName === "") {
    addError("username", "User Name can not be empty");
  } else {
    removeError("username");
  }

  if (email === "") {
    addError("email", "Email can not be empty");
  } else if (!isValidEmail(email)) {
    addError("email", "Provide a valid email address");
  } else {
    removeError("email");
  }

  if (password === "") {
    addError("password", "Password can not be empty");
  } else if (password.length < 8) {
    addError("password", "Password must be at least 8 character");
  } else {
    removeError("password");
  }

  if (cpassword === "") {
    addError("confirm-password", "Password can not be empty");
  } else if (cpassword !== password) {
    addError("confirm-password", "Password does not match");
  } else {
    removeError("confirm-password");
  }
});

function addError(name, message) {
  const i = form[name].parentNode.querySelector("i");
  i.innerText = message;
  i.style.display = "inline";

  form[name].parentNode.querySelector("img").style.display = "block";
  form[name].parentNode.querySelector("input").style.border =
    "2px solid hsl(0, 100%, 74%)";
  form[name].parentNode.style.marginBottom = "3.5rem";
}

function removeError(name) {
  const i = form[name].parentNode.querySelector("i");
  i.innerText = "";
  i.style.display = "none";

  form[name].parentNode.querySelector("img").style.display = "none";
  form[name].parentNode.querySelector("input").style.border =
    "1px solid lightgray";
  form[name].parentNode.style.marginBottom = "2rem";
}
