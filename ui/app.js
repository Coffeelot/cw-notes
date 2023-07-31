let open

window.addEventListener('message', function(data) {
    if (event.data.nui == 'cwnotes') {
        open = 'note'
        $('.cwnotes').show();
        $('.cwnotes').animate({
            left: '250px',
            height: '+=150px',
            width: '+=150px'
        });
        $("#title").html(event.data.information.title);
        $(".note-body").html(event.data.information.text);
        if (event.data.hasNotepad) {
            $(".note-copy").show();
        } else {
            $(".note-copy").hide();
        }
    } else if (event.data.nui == 'cwnoteswrite') {
        open = 'write'
        $('.cwnotes-writer').show();
        $('.cwnotes-writer').animate({
            left: '250px',
            height: '+=150px',
            width: '+=150px'
        });
        if (event.data.information?.title) {
            $("#title-input").val(event.data.information.title);
        }
        if (event.data.information?.text) {
            $("#body-input").val(event.data.information.text);
        }
    }
});

hidefunction = function() {
    $.post(`https://cw-notes/escape`)
    if (open == 'note') {
        $('.cwnotes').animate({
                height: '-=150px',
                width: '-=150px'
            });;
        $('.cwnotes').hide();
    } else if (open =='write') {
        $('.cwnotes-writer').animate({
                height: '-=150px',
                width: '-=150px'
            });;
        $('.cwnotes-writer').hide();
    }
}

function handleConfirm() {
    const title = $("#title-input").val();
    const text = $("#body-input").val();
    $.post('https://cw-notes/confirm', JSON.stringify({title: title, text: text}), hidefunction());
    $("#title-input").val('')
    $("#body-input").val('')
}

function handleCopy() {
    const title = $("#title").html();
    const text = $(".note-body").html();
    $.post('https://cw-notes/createCopy', JSON.stringify({title: title, text: text}), hidefunction());
    $("#title").val('')
    $(".note-body").val('')
}

document.onkeyup = function(event) {
    event = event || window.event;
    var charCode = event.keyCode || event.QBich;
    if (charCode == 27) { // Nui hide key backspace
        hidefunction()
    }
};
