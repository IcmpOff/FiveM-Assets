QBOccasions = {}

$(document).ready(function(){
    $('.sell-container').hide();
    $('.buy-container').hide();
    $('.buy-container2').hide();
    $('.buy-container3').hide();

    window.addEventListener('message', function(event){
        var eventData = event.data;

        if (eventData.action == "sellVehicle") {
            $('.sell-container').fadeIn(150);
            QBOccasions.setupSellContract(eventData)
        }

        if (eventData.action == "buyVehicle") {
            $('.buy-container').fadeIn(150);
            QBOccasions.setupBuyContract(eventData, eventData.vehicleData)
        }

        if (eventData.action == "Craft2") {
            $('.buy-container2').fadeIn(150);
            QBOccasions.setupBuyContract2(eventData)
        }

        if (eventData.action == "buyVehicle3") {
            $('.buy-container3').fadeIn(150);
            QBOccasions.setupBuyContract3(eventData, eventData.vehicleData)
        }
    });
});

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27:
            $('.sell-container').fadeOut(100);
            $('.buy-container').fadeOut(100);
            $('.buy-container2').fadeOut(100);
            $('.buy-container3').fadeOut(100);
            $.post('http://qb-weaponcraft/close');
            break;
    }
});

$(document).on('click', '#sell-vehicle', function(){
    if ($('.vehicle-sell-price').val() != "") {
        if (!isNaN($('.vehicle-sell-price').val())) {
            $.post('http://qb-weaponcraft/sellVehicle', JSON.stringify({
                price: $('.vehicle-sell-price').val(),
                desc: $('.vehicle-description').val()
            }));
        
            $('.sell-container').fadeOut(100);
            $.post('http://qb-weaponcraft/close');
        } else {
            $.post('http://qb-weaponcraft/error', JSON.stringify({
                message: "Bedrag moet bestaan uit cijfers.."
            }))
        }
    } else {
        $.post('http://qb-weaponcraft/error', JSON.stringify({
            message: "Vul een bedrag in.."
        }))
    }
});

$(document).on('click', '#buy-vehicle', function(){
    $.post('http://qb-weaponcraft/craft');
    $('.buy-container').fadeOut(100);
    $('.buy-container2').fadeOut(100);
    $('.buy-container3').fadeOut(100);
    $.post('http://qb-weaponcraft/close');
});

$(document).on('click', '#buy-vehicle2', function(){
    $.post('http://qb-weaponcraft/craft2');
    $('.buy-container').fadeOut(100);
    $('.buy-container2').fadeOut(100);
    $('.buy-container3').fadeOut(100);
    $.post('http://qb-weaponcraft/close');
});
$(document).on('click', '#buy-vehicle3', function(){
    $.post('http://qb-weaponcraft/craft3');
    $('.buy-container').fadeOut(100);
    $('.buy-container2').fadeOut(100);
    $('.buy-container3').fadeOut(100);
    $.post('http://qb-weaponcraft/close');
});

QBOccasions.setupSellContract = function(data) {
    $("#seller-name").html(data.pData.charinfo.firstname + " " + data.pData.charinfo.lastname);
    $("#seller-banknr").html(data.pData.charinfo.account);
    $("#seller-telnr").html(data.pData.charinfo.phone);
    $("#vehicle-plate").html(data.plate);
}

QBOccasions.setupBuyContract = function(data, vData) {
    $("#buy-seller-name").html("data.sellerData.charinfo.firstname" + " " + "data.sellerData.charinfo.lastname");
    $("#buy-seller-banknr").html(data.sellerData.charinfo.account);
    $("#buy-seller-telnr").html(data.sellerData.charinfo.phone);
    $("#buy-vehicle-plate").html(vData.plate);
    $("#buy-vehicle-desc").html(vData.desc);
    $("#buy-price").html("&dollar;" + vData.price);
}

QBOccasions.setupBuyContract2 = function(data, vData) {
    $("#TitleC1a").html(data.TitleC1a);
    $("#TitleC2a").html(data.TitleC2a);
    $("#TitleC3a").html(data.TitleC3a);

    $("#NomeItem1a").html(data.ItemC1a + " x " + data.ItemQt1a + " pz. ");
    $("#NomeItem1b").html(data.ItemC1b + " x " + data.ItemQt1b + " pz. ");
    $("#NomeItem1c").html(data.ItemC1c + " x " + data.ItemQt1c + " pz. ");
    $("#NomeItem1d").html(data.ItemC1d + " x " + data.ItemQt1d + " pz. ");

    $("#NomeItem2a").html(data.ItemC2a + " x " + data.ItemQt2a + " pz. ");
    $("#NomeItem2b").html(data.ItemC2b + " x " + data.ItemQt2b + " pz. ");
    $("#NomeItem2c").html(data.ItemC2c + " x " + data.ItemQt2c + " pz. ");
    $("#NomeItem2d").html(data.ItemC2d + " x " + data.ItemQt2d + " pz. ");

    $("#NomeItem3a").html(data.ItemC3a + " x " + data.ItemQt3a + " pz. ");
    $("#NomeItem3b").html(data.ItemC3b + " x " + data.ItemQt3b + " pz. ");
    $("#NomeItem3c").html(data.ItemC3c + " x " + data.ItemQt3c + " pz. ");
    $("#NomeItem3d").html(data.ItemC3d + " x " + data.ItemQt3d + " pz. ");
   
}
QBOccasions.setupBuyContract3 = function(data, vData) {
    $("#buy-seller-name").html("data.sellerData.charinfo.firstname" + " " + "data.sellerData.charinfo.lastname");
    $("#buy-seller-banknr").html(data.sellerData.charinfo.account);
    $("#buy-seller-telnr").html(data.sellerData.charinfo.phone);
    $("#buy-vehicle-plate").html(vData.plate);
    $("#buy-vehicle-desc").html(vData.desc);
    $("#buy-price").html("&dollar;" + vData.price);
}

function calculatePrice() {
    var priceVal = $('.vehicle-sell-price').val();
    
    $('#tax').html("&dollar; " + (priceVal / 100 * 19).toFixed(0));
    $('#mosley-cut').html("&dollar; " + (priceVal / 100 * 4).toFixed(0));
    $('#total-money').html("&dollar; " + (priceVal / 100 * 77).toFixed(0));
}