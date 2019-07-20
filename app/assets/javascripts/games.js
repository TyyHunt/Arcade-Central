$(function() {
    console.log( "games ready!" )
    clickGameButton()
});

function clickGameButton() {
    $('a').click(function(event) {
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
}

class Game {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.numPlayers = obj.num_players
        this.cost = obj.cost
        this.working = obj.working
    }
}

Game.prototype.showGamePage = function () {
    return (`
    <div class="card text-white bg-secondary mb-3 float-left inline" style="max-width: 18rem; height: 400px; width: 700px; margin-left: 400px;">
        <div class="card-header">
            <h4>${this.name}</h4>
        </div>
        <div class="card-body">
            <p class="card-text">Max Players: ${this.numPlayers}</p>
            <p class="card-text">Costs: ${this.cost} cents</p>
            <p class="card-text">In Order: ${this.working}</p>
        </div>
    </div>
    `)
}



