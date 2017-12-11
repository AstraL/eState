function loadSettings() {
    $('#q_deal').val(localStorage.deal);
    $('#q_realty_type').val(localStorage.realty_type);
    $('#q_r_min').val(localStorage.r_min);
    $('#q_r_max').val(localStorage.r_max);
    $('#q_price_max').val(localStorage.price_max);
    $('#q_price_min').val(localStorage.price_min);
}

function saveSettings() {
    localStorage.deal = $('#q_deal').val();
    localStorage.realty_type = $('#q_realty_type').val();
    localStorage.r_min = $('#q_r_min').val();
    localStorage.r_max = $('#q_r_max').val();
    localStorage.price_max = $('#q_price_max').val();
    localStorage.price_min = $('#q_price_min').val();
}

$(document).on('turbolinks:render ready', function() {
    $('#property-thumbs').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        itemWidth: 175,
        itemMargin: 10,
        asNavFor: '#property-images',
        prevText: "",
        nextText: ""
    });

    $('#property-images').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: true,
        sync: "#property-thumbs",
        prevText: "",
        nextText: "",
        selector: ".slides .item"
    });
});

$(document).ready(function() {
    //$(window).unload(saveSettings);
    //loadSettings();
});

