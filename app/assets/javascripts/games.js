$(function() {
    console.log( "games ready!" )
    clickGameButton()
});

function clickGameButton() {
    $('a#game-show-route').bind("click", function(event) {
        event.preventDefault()
        $.ajax({
            url: $(this).attr('href'),
            method: 'get',
            dataType: 'json',
        }).done(function(data) {
            console.log('here is your data...', data)
            renderGame(data)
        })  
    });
}

function renderGame(obj) {
    let jsGame = new Game(obj)
    let postGame = jsGame.showGamePage()
    document.getElementById("game-holder").innerHTML = postGame
    $("#game-return-option").click( function() {
        setTimeout(location.reload.bind(location), 100);
        console.log("page reloaded")
    });
}

class Game {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.numPlayers = obj.num_players
        this.cost = obj.cost
        this.working = obj.working
        this.arcade = obj.arcade
    }
}

Game.prototype.showGamePage = function () {
    return (`
    <div class="card mb-3" style="max-width: 900px;">
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="https://images.pexels.com/photos/1293261/pexels-photo-1293261.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" class="card-img" alt="...">
            </div>
            <div class="card-body">
                <div class="col-md-8">
                    <h2 class="card-title"> ${this.arcade.name} </h2>
                    <hr>
                    <p class="card-text">Located in: ${this.arcade.location}</p>
                    <p class="card-text">Owned by: ${this.arcade.owner_name}</p>
                    <p class="card-text">Open from: ${this.arcade.open_time}am - ${this.arcade.close_time}pm</p>
                    <p class="card-text">Open since: ${this.arcade.est_year} </p>
                </div>
            </div>
        </div>
    </div>


    <div class="card text-white bg-secondary mb-3 float-left inline" style="max-width: 18rem; height: 400px; width: 700px; margin-left: 400px;">
        <div class="card-header">
            <h4>${this.name}</h4>
        </div>
        <div class="card-body">
            <p class="card-text">Max Players: ${this.numPlayers}</p>
            <p class="card-text">Costs: ${this.cost} cents</p>
            <p class="card-text">In Order: ${this.working}</p>
            <br>
            <a href="/games" id="game-return-option" >Return to Games</a>
        </div>
    </div>
    `)
}



