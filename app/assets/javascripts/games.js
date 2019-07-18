$(function() {
    console.log( "games ready!" )
    renderGameForm()
});

function renderGameForm() {
    document.getElementById("new-game-click").addEventListener("click", function(event) {
        event.preventDefault()
        $('#show-new-game-form').html(gameFormContents());
        submitGameForm()
    });
}

function submitGameForm() {
    let formSubmit = document.getElementById("new_game");
    formSubmit.onsubmit = function(event) {
        event.preventDefault()
    }
}

function gameFormContents() {
    return (`
    <div class="container" role="main">
        <div class="new-edit-form card">
            <h1 class="page-title">Add A New Game</h1>
            <br>
            <form class="form-group" id="new_game" action="/games" accept-charset="UTF-8" method="post"><input name="utf8" value="✓" type="hidden"><input name="authenticity_token" value="J1dNUG9n2AG7NhPcwLlMIeGMUZg8itg1+DsToTLtYlFU6rpiAJUFQg9iRfjf4Uf7aCR5jaipyxTt2ITEP+bDyw==" type="hidden">
                <label for="game_Name of the game: ">Name of the game: </label>
                <input name="game[name]" id="game_name" type="text">
                <br>
                <label for="game_Maximum number of players: ">Maximum number of players: </label>
                <input name="game[num_players]" id="game_num_players" type="number">
                <br>
                <label for="game_How much will this game cost? ">How much will this game cost? </label>
                <input class="text_field" step="0.25" name="game[cost]" id="game_cost" type="number">
                <br>
                <label for="game_This game will belong to which arcade">This game will belong to which arcade?</label>
                <select name="game[arcade_id]" id="game_arcade_id"><option selected="selected" value="1">Yost Group</option>
                <option value="2">Beier, Gutkowski and Boehm</option>
                <option value="3">Hauck Inc</option>
                <option value="4">Dickens and Sons</option>
                <option value="5">Kuphal Group</option>
                <option value="6">Kohler-Jast</option>
                <option value="7">Pouros-Prohaska</option>
                <option value="8">Kunde-Stark</option></select>
                <br>
                <label for="game_Is this game in working order">Is this game in working order?</label>
                <label for="game_No">No</label>
                <input value="false" name="game[working]" id="game_working_false" type="radio">
                <label for="game_Yes">Yes</label>
                <input value="true" name="game[working]" id="game_working_true" type="radio">
                <br>
                <input value="101" name="game[player_id]" id="game_player_id" type="hidden">
                <br>
                <input name="commit" id="new-form-submission" value="Create Game" data-disable-with="Create Game" type="submit">
            </form>
        </div>
    </div>
    `)
}