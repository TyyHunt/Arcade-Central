$(function() {
    console.log( "arcades ready!" )
    clickSpecific()
});

function clickSpecific() {
    document.body.addEventListener("click", event => {
        if (event.target.nodeName == "BUTTON") {
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
            });
        } 
      });
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
