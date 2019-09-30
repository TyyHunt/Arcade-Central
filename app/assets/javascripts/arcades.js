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
                console.log(jsArcade)
                arcadeHtml = HandlebarsTemplates['show_arcade']({ 
                    name: jsArcade.name,
                    location: jsArcade.location,
                    ownerName: jsArcade.ownerName,
                    openTime: jsArcade.openTime,
                    closeTime: jsArcade.closeTime,
                    estYear: jsArcade.estYear,
                    id: jsArcade.id  
                });
                console.log(jsArcade.games)
                let gamesHtml = jsArcade.games.map(function(game) {
                    return (`
                        <div class="card text-white bg-secondary mb-3 float-left inline" style="max-width: 18rem; height: 400px; width: 700px; margin: 30px;">
                            <div class="card-header">
                                <h4>${game.name}</h4>
                            </div>
                            <div class="card-body">
                                <p class="card-text">Max Players: ${game.num_players}</p>
                                <p class="card-text">Costs: ${game.cost} cents</p>
                                <p class="card-text">In Order: ${game.working}</p>
                            </div>
                        </div>
                    `)
                }).sort().join('')
                $('#arcade-show').html(arcadeHtml);
                $('#games-show').html(gamesHtml); 
            });
        } 
    });
}

function gamesClicked(arcadeObj) {
    document.getElementById("arcade-games").addEventListener("click", function(event) {
        console.log("games button clicked", `/arcades/${arcadeObj.id}/games`)
        event.preventDefault()
        $.get(`/arcades/${arcadeObj.id}/games.json`, function (data) {
            console.log("retrieved games data")
            gamesHtml = HandlebarsTemplates['show_games']({
                game: data
          });
          $('#games-show').html(gamesHtml);
        });
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



