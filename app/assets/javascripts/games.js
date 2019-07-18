$(function() {
    console.log( "games ready!" )
    renderGameForm()
});

function renderGameForm() {
    document.getElementById("new-game-click").addEventListener("click", function(event) {
        event.preventDefault()
        $.get("/games/new", function (data) {
            console.log("retrieved games data")
          $('#show-new-game-form').html(data);
        });
    });
}