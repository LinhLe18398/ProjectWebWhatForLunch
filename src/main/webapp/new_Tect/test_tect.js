function listClick(id) {
    var idDiv = id;
    var myElement = document.getElementsByClassName("item");
    var fullTyle = window.getComputedStyle(myElement[0]);

    for (var i = 0; i < myElement.length; i++) {
        myElement[i].style.display = "none";
    }

    myElement = document.getElementsByClassName(idDiv + "b");
    var displayValue = fullTyle.getPropertyValue("display");

    if (displayValue == "none")
        for (var i = 0; i < myElement.length; i++) {
            myElement[i].style.display = "flex";
        }
    else {
        for (var i = 0; i < myElement.length; i++) {
            myElement[i].style.display = "none";
        }
    }
}
