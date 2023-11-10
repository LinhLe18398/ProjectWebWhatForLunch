$(document).ready(function () {
    $(".profile p").click(function () {
        $(".profile-div").toggle();

    });
    $(".noti-icon").click(function () {
        $(".notification-div").toggle();
    });

});



function listClick(id) {
    var idDiv = id;
    var myElement = document.getElementsByClassName("box");
    for (var i = 0; i < myElement.length; i++) {
        myElement[i].style.display = "none";
    }
    myElement = document.getElementsByClassName(idDiv + "b");
    for (var i = 0; i < myElement.length; i++) {
        myElement[i].style.display = "flex";
    }

}

function changeColor(buttonIndex) {
    var buttons = document.getElementsByClassName('group-button');
    for (var i = 0; i < buttons.length; i++) {
        buttons[i].classList.remove('active');
    }

    buttons[buttonIndex].classList.add('active');

    // Lấy thẻ tbody
    var tbody = document.querySelector("#table-order tbody");
    var rows = tbody.getElementsByTagName("tr");
    for (var i = 0; i < rows.length; i++) {
        var row = rows[i];
        row.style.display = "none";
    }

    var trList = document.querySelectorAll("#table-order tr");

    var sumOrder = trList.length-1;

    for (var i = 1; i < trList.length; i++) {
        var tr = trList[i];
        var td = tr.querySelector("#table-order tbody td:nth-child(5)");
        var cellValue = td.textContent;

        tr.style.display = "";


        if (buttonIndex == 0) {
            tr.style.display = "";
        }

        if (buttonIndex == 1 && cellValue !== "Chờ nhận hàng") {
            tr.style.display = "none";
            sumOrder --;
        }

        if (buttonIndex == 2 && cellValue !== "Đang chế biến") {
            tr.style.display = "none";
            sumOrder --;
        }

        if (buttonIndex == 3 && cellValue !== "Đã nhận món") {
            tr.style.display = "none";
            sumOrder --;
        }

        if (buttonIndex == 4 && cellValue !== "Đang giao") {
            tr.style.display = "none";
            sumOrder --;
        }

        if (buttonIndex == 5 && cellValue !== "Đã hoàn thành") {
            tr.style.display = "none";
            sumOrder --;
        }

        if (buttonIndex == 6 && cellValue !== "Huỷ") {
            tr.style.display = "none";
            sumOrder --;
        }

        document.getElementById("sum-order").textContent = sumOrder + " Đơn hàng";
    }


}


var statusCells = document.querySelectorAll("#table-order tbody td:nth-child(5)");
statusCells.forEach(function (cell) {
    var status = cell.textContent.trim();
    switch (status) {
        case "Chờ nhận hàng":
            cell.style.color = "brown";
            break;
        case "Đang chế biến":
            cell.style.color = "orange";
            break;
        case "Đã nhận món":
            cell.style.color = "purple";
            break;
        case "Đang giao":
            cell.style.color = "blue";
            break;
        case "Đã hoàn thành":
            cell.style.color = "green";
            break;
        case "Huỷ":
            cell.style.color = "red";
            break;
        default:
            break;
    }
});

function updatePlaceholder() {
    var selectElement = document.getElementById("value-select");
    var inputElement = document.getElementById("search-iput");
    selectElement.addEventListener("change", function() {
        var selectedOption = selectElement.options[selectElement.selectedIndex];
        var selectedText = selectedOption.text;

        inputElement.placeholder = "Tìm kiếm " + selectedText;
    });
}
