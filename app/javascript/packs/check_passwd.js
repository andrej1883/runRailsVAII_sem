window.passwordChanged = function() {
    var strength = document.getElementById('strength');
    var strongRegex = new RegExp("^(?=.{14,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
    var mediumRegex = new RegExp("^(?=.{10,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
    var enoughRegex = new RegExp("(?=.{8,}).*", "g");

    var pwd = document.getElementById("password1");
    const indicator = document.querySelector(".indicator")
    const weak = document.querySelector(".weak")
    const ok = document.querySelector(".ok")
    const strong = document.querySelector(".strong")

    if (pwd.value.length == 0) {
        indicator.style.display = "none";
        indicator.style.display = "none";
        strength.innerHTML = 'Type Password';
        strong.classList.remove("active");
        weak.classList.remove("active");
        ok.classList.remove("active");
    } else if (false == enoughRegex.test(pwd.value)) {
        indicator.style.display = "block";
        indicator.style.display = "flex";
        weak.classList.remove("active");
        strength.innerHTML = 'More Characters';
    } else if (strongRegex.test(pwd.value)) {
        strong.classList.add("active");
        strength.innerHTML = '<span style="color:green">Strong!</span>';
    } else if (mediumRegex.test(pwd.value)) {
        ok.classList.add("active");
        strong.classList.remove("active");
        strength.innerHTML = '<span style="color:orange">Medium!</span>';
    } else {
        ok.classList.remove("active");
        weak.classList.add("active");
        strength.innerHTML = '<span style="color:red">Weak!</span>';
    }
}