function dosmth() {
    alert('hello');
}

document.addEventListener('turbolinks:render', () => {
    const clickButton = document.getElementById("button-click");

    clickButton.addEventListener("click", dosmth);

    /*const listen = document.getElementById("password1");
    listen.addEventListener("keydown",dosmth());*/
});

