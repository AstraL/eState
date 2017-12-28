$(document).on('turbolinks:load',function() {
    $('#share').jsSocials({
        url: window.location.href,
        showCount: true,
        showLabel: false,
        shares: ["facebook", "googleplus", "linkedin", "pocket", "whatsapp", "viber", "messenger", "vkontakte", "telegram"]
    });
});
