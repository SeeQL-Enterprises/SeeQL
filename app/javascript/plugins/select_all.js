$('#select_all').click(function() {
    $('input[type="checkbox"]').prop('checked', true);
});

$('#unselect_all').click(function() {
    $('input[type="checkbox"]').prop('checked', false);
});
