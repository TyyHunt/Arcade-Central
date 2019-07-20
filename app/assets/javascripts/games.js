$(function() {
    console.log( "games ready!" )
    clickGameButton()
});

function clickGameButton() {
    $('a').click(function(event) {
        event.preventDefault()
        showGame()
    });
}

function showGame() {
    $.ajax({
        url: $(this).attr('href'),
        method: 'get',
        dataType: 'json',
    }).done(function(data) {
        console.log('here is your data...', data)
    })
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

