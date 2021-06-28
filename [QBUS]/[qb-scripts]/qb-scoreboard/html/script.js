$(function()
{
    //get info from client side
    window.addEventListener('message', function(event)
    {
        var cdata = event.data;
        if (cdata.action == 'close')
        {
            document.getElementById("hscoreboard").innerHTML = "";
            $('body').hide();
        }
        else if (cdata.action == 'updateScoreboard')
        {
            document.getElementById("hscoreboard").innerHTML = cdata.info;
            $('body').show();
        }
        else if (cdata.action == 'updatePolice')
        {
            $('#pacifc').html(`<i class="${cdata.pacific == true? "fas fa-check-circle" : "fas fa-times-circle"}" id="${cdata.pacific == true? "green" : "red"}"> </i> &nbsp;`);
            $('#paleto').html(`<i class="${cdata.paleto == true? "fas fa-check-circle" : "fas fa-times-circle"}" id="${cdata.paleto == true? "green" : "red"}"> </i> &nbsp;`);
            $('#shops').html(`<i class="${cdata.shop == true? "fas fa-check-circle" : "fas fa-times-circle"}" id="${cdata.shop == true? "green" : "red"}"> </i> &nbsp;`);
            $('#jewels').html(`<i class="${cdata.jewels == true? "fas fa-check-circle" : "fas fa-times-circle"}" id="${cdata.jewels == true? "green" : "red"}"> </i> &nbsp;`);
            $('#hostage').html(`<i class="${cdata.hostage == true? "fas fa-check-circle" : "fas fa-times-circle"}" id="${cdata.hostage == true? "green" : "red"}"> </i> &nbsp;`);
        }

    }, false);

    //for close scoreboard
    $(document).on('keydown', function() {
        switch(event.keyCode) {
            case 27: // ESC Key code
                $.post(`https://${GetParentResourceName()}/close`);
                break;
            case 118: // F7
                $.post(`https://${GetParentResourceName()}/close`);
                break;
        }
    });

});
