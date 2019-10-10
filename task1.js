$(document).ready(function($){
    
    invisible();
    code();
    phone_code();
    margin_number();
    type_number();

});

function code() {
    let text_size = $(".phone-number").css("font-size").match(/\d+/);
    $(".code").css('font-weight','bold').css("font-size", text_size/2 + "px");
}

function phone_code() {
    let text_size = $(".phone-number").css("font-size");
    $(".phone-code").css("font-size",text_size).css('font-weight','normal');
}

function type_number() {
    let mask = "000-00-00";
    $(".phone-number").mask(mask);
}

function margin_number() {
    let margin_val = "10px";
    $(".all-phone").css("margin",margin_val)
}

function invisible() {
        $(".invisible").hide();
}
