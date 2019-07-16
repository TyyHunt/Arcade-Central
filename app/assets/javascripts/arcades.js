$(function() {
    console.log( "arcades ready!" )
    clickSpecific()
});

function clickSpecific() {
    document.body.addEventListener("click", event => {
        if (event.target.nodeName == "BUTTON") {
            console.log("button pressed")
            let arcadeName = $(event.target)[0].innerText.toString();
            $.get('/arcades.json' , function (data) { 
                let result = data.filter(obj => {
                    if (obj.name === arcadeName) {
                        return obj;
                      }
                  })
                let jsArcade = new Arcade(result[0])
                arcadeHtml = HandlebarsTemplates['show_arcade']({ 
                    name: jsArcade.name,
                    location: jsArcade.location,
                    ownerName: jsArcade.ownerName,
                    openTime: jsArcade.openTime,
                    closeTime: jsArcade.closeTime,
                    estYear: jsArcade.estYear,
                    id: jsArcade.id  
                });
                $('#arcade-show').html(arcadeHtml); 
                gamesClicked(jsArcade)
            });
        } 
      });
}

function gamesClicked(arcadeObj) {
    document.getElementById("arcade-games").addEventListener("click", function(event) {
        console.log("games button clicked")
        event.preventDefault()
        jsGames = new Game(arcadeObj.games)
        arcadeObj.showGames(jsGames[0])
    },false);
}

class Arcade {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.location = obj.location
        this.ownerName = obj.owner_name
        this.openTime = obj.open_time
        this.closeTime = obj.close_time
        this.estYear = obj.est_year
        this.games = obj.games
    }
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

Arcade.prototype.showGames = function(gamesObj) {
    gamesHtml = HandlebarsTemplates['show_games']({
          games: gamesObj
    });
    $('#games-show').html(gamesHtml);
}


