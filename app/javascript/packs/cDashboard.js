window.onload = startTime();

function startTime() {

    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    m = checkTime(m);
    if (h >= 12) {
        var s = " PM ";
    } else {
        var s = " AM ";
    }
    document.getElementById('time').innerHTML =
        h % 12 + " : " + m + s;
    var t = setTimeout(startTime, 500);
}

function checkTime(i) {
    if (i < 10) {
        i = "0" + i
    }; // add zero in front of numbers < 10
    return i;
}


let clerkBtn = document.querySelectorAll('.clerk-sec-list-btn');
let clerkSec = document.querySelectorAll('.clerk-sec-pennding-orders');

for (let i = 0; i < clerkBtn.length; i++) {
    clerkBtn[i].addEventListener('click', () => {
        borderBtn = document.querySelector('.border-bottom');
        visibleBtn = document.querySelector('.visible');
        borderBtn.classList.remove('border-bottom');
        visibleBtn.classList.remove('visible');
        clerkBtn[i].classList.add('border-bottom');
        clerkSec[i].classList.add('visible');
    })
}

let order_list = document.querySelectorAll('.clerk-sec-pennding-orders-order');
let order_box = document.querySelector('.order-list-sec');
let close_btn = document.querySelector('.order-list-closeBtn');
let dash_container = document.querySelector('.clerk-Dashboard');

close_btn.addEventListener('click', () => {
    order_box.classList.remove("zoomIn");
    order_box.classList.add("zoomOut");
    order_box.classList.remove("visible");
    order_box.classList.add("invisible");
    dash_container.classList.remove("blur");
})

for (let i = 0; i < order_list.length; i++) {
    order_list[i].addEventListener('click', () => {
        order_box.classList.remove("invisible");
        order_box.classList.add("visible");
        order_box.classList.remove("zoomOut");
        order_box.classList.add("zoomIn");
        dash_container.classList.add("blur");
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                var order_json = JSON.parse(this.responseText);
                orderitems(order_json);
            }
        };
        xhttp.open("GET", "/cart/" + order_list[i].id, true);
        xhttp.send();


    })

}




function orderitems(order_json) {
    let total = 0;
    let list = document.querySelector('.order-list-items');
    list.innerHTML = '';
    Object.values(order_json).map(order => {
        total += parseInt(order.incart) * parseInt(order.item_price);
        list.innerHTML += `<p class="order-list-items-para"> ${order.item_name}(x${order.incart})</p>`
    })
    document.querySelector('.order-list-price').innerHTML = total;
}