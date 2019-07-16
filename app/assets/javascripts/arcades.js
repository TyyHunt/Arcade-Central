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
                $('#games-show').html(""); 
                gamesClicked(jsArcade)
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
                games: data
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
    }
}



