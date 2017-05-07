function create_Content() {
    $("#create-new-content").val();
    $.ajax({
        type: "POST",
        url: "http://localhost:3000/",
        data: "email=" + email,
        cache: false,
        success: function(result) {
            alert(result);
        }
    });
}
