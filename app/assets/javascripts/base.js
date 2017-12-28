$(document).on('turbolinks:load',function() {
    $('#share').jsSocials({
        url: window.location.href,
        showCount: function(screenWidth) {
            return (screenWidth > 1024);
        },
        showLabel: false,
        shares: ["facebook", "googleplus", "linkedin", "pocket", "whatsapp", "viber", "messenger", "vkontakte", "telegram"]
    });
});
