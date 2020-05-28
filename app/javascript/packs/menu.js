let add_cart = document.querySelectorAll('.add-cart');

for (let i = 0; i < add_cart.length; i++) {
    add_cart[i].addEventListener('click', () => {
        add_cart[i].innerHTML = "Add Again !";
    })
}


function get_menu_json() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var menu_json = JSON.parse(this.responseText);
            addcart(menu_json);
        }
    };
    xhttp.open("GET", "/menus/new", true);
    xhttp.send();
}

function addcart(menu_json) {
    let add_cart = document.querySelectorAll('.add-cart');
    for (let i = 0; i < add_cart.length; i++) {
        add_cart[i].addEventListener('click', () => {
            cartNumber(menu_json[i]);
        })
    }
}

function cartNumber(item) {

    let itemNumber = localStorage.getItem('cartNumber');
    itemNumber = parseInt(itemNumber);

    if (itemNumber) {
        localStorage.setItem('cartNumber', itemNumber + 1);
        document.querySelector('.cart-number').innerHTML = itemNumber + 1;
    } else {
        localStorage.setItem('cartNumber', 1);
        document.querySelector('.cart-number').innerHTML = 1;
    }
    itemList(item);
}


function itemList(item) {
    let item_list = localStorage.getItem('itemList');
    if (item_list) {
        var incartNumber = 0;
        item_list = JSON.parse(item_list);
        for (let i = 0; i < item_list.length; i++) {
            if (item_list[i].id === item.id) {
                item_list[i].incart += 1;
                incartNumber = 1;
            }
        }
        if (incartNumber === 0) {
            item.incart = 1;
            item_list.push(item);
        }
        console.log(item_list);
        localStorage.setItem('itemList', JSON.stringify(item_list));

    } else {
        var items = [];
        item["incart"] = 1;
        items.push(item);
        localStorage.setItem('itemList', JSON.stringify(items));
    }
}


let items = JSON.parse(localStorage.getItem('itemList'));

function onloadcartNumber() {
    let itemNumber = parseInt(localStorage.getItem('cartNumber'));
    let cartNumberContainer = document.querySelector('.cart-number')
    if (itemNumber && cartNumberContainer) {
        let sum = 0;
        for (let i = 0; i < items.length; i++) {
            sum += items[i].incart;
        }
        localStorage.setItem('cartNumber', sum);
        if (sum === 0)
            cartNumberContainer.innerHTML = '';
        else
            cartNumberContainer.innerHTML = sum;
    }
}

function btnEvent() {
    var plusBtn = document.querySelectorAll('.btn-plus');
    var minusBtn = document.querySelectorAll('.btn-minus');
    var delBtn = document.querySelectorAll('.btn-delete');
    for (let i = 0; i < plusBtn.length; i++) {
        plusBtn[i].addEventListener('click', () => {
            items[i].incart += 1;
            document.querySelectorAll('.cart-box-item-quantity-number')[i].innerHTML = items[i].incart;
            document.querySelectorAll('.cart-box-item-total')[i].innerHTML = items[i].incart * items[i].price;
            totalCost();
        })
        minusBtn[i].addEventListener('click', () => {
            items[i].incart -= 1;
            if (items[i].incart) {
                document.querySelectorAll('.cart-box-item-quantity-number')[i].innerHTML = items[i].incart;
                document.querySelectorAll('.cart-box-item-total')[i].innerHTML = items[i].incart * items[i].price;

                totalCost();
            } else {
                items = items.slice(0, i).concat(items.slice(i + 1, items.length));
                localStorage.setItem('itemList', JSON.stringify(items));
                displayItems();
            }

        })
        delBtn[i].addEventListener('click', () => {
            items = items.slice(0, i).concat(items.slice(i + 1, items.length));
            localStorage.setItem('itemList', JSON.stringify(items));
            displayItems();
        })
    }
}

function totalCost() {
    var cost = 0;
    for (let i = 0; i < items.length; i++) {
        cost += items[i].price * items[i].incart;
    }
    onloadcartNumber();
    localStorage.setItem('total', cost);
    document.querySelector('.cart-box-total-price').innerHTML = cost;
}

function displayItems() {
    let items = JSON.parse(localStorage.getItem('itemList'));
    let itemContainer = document.querySelector('.cart-box-items');
    let cartContainer = document.querySelector('.cart-box')
    if (items[0] && itemContainer) {
        itemContainer.innerHTML = '';
        Object.values(items).map(item => {
            itemContainer.innerHTML += `
            <div class="cart-box-item-sec">
            <button class="cancel-icon btn-delete"><i class="far fa-times-circle "></i></button>
            <p class="cart-box-item-para" >${item.name}</p>
            <p class="cart-box-item-price"><i class="fas fa-rupee-sign"></i> ${item.price}</p>
            <div class="cart-box-item-quantity">
              <button class="quantity-icon btn-minus"><i class="fas fa-minus-circle"></i></button>
              <p class="cart-box-item-quantity-number">${item.incart}</p>
              <button class="quantity-icon btn-plus"><i class="fas fa-plus-circle"></i></button>
            </div>
            <p class="cart-box-item-total">${item.price * item.incart}</p>
          </div>
          `
        })
        if (document.querySelector('.cart-box-total')) {
            document.querySelector('.cart-box-total').remove();
        }
        cartContainer.innerHTML += `<div class="cart-box-total">
        <a class="cart-box-confirm-link" href="/cart/new">Confirm Order</a>
        <h4 class="cart-box-pay">You Pay :</h4>
        <h4><i class="fas fa-rupee-sign"></i> </h4>
        <h4 class="cart-box-total-price"></h4>
      </div>`
    }
    if (!items[0] || !items && itemContainer) {
        itemContainer.innerHTML = '';
        document.querySelector('.cart-box-total').innerHTML = '';
        itemContainer.innerHTML += `
        <div class="cart-empty">
        <p  class="cart-box-empty">Your cart is empty. Are you not Hungry?</p>
          <a class="cart-box-empty-link" href="/menus">See Menu</a>
          </div>
        `
    }
    document.querySelector('.cart-box-confirm-link').addEventListener('click', () => {
        items = JSON.stringify(items);
        localStorage.setItem('itemList', items);
        document.cookie = "items=" + items;
        document.cookie = "cost=" + localStorage.getItem('total');
        localStorage.clear();

    })
    totalCost();
    btnEvent();
}

get_menu_json()
onloadcartNumber()
displayItems()