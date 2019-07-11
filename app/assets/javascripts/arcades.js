$(function() {
    console.log( "arcades ready!" )
    clickSpecific()
});

function clickSpecific() {
    document.body.addEventListener("click", event => {
        if (event.target.nodeName == "BUTTON") {
            let arcadeName = $(event.target)
            $.get('/arcades.json' , function (data) { 
                console.log("the data is", arcadeName[0])
                arcadeHtml = HandlebarsTemplates['show_arcade']({ 
                    arcade: arcadeName[0]  
                });
                $('#arcade-show').html(arcadeHtml); 
            });
        }
        
      });
}

function getArcade() {
    console.log( "entered get arcade" )
    $.get('/arcades.json' , function (data) { 
        console.log("the data is", data)
        arcadeHtml = HandlebarsTemplates['show_arcade']({ 
            arcade: data  
        });
        $('#arcade-show').html(arcadeHtml); 
    });
}  

class Arcade {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.location = obj.location
        this.owner_name = obj.owner_name
        this.open_time = obj.open_time
        this.close_time = obj.close_time
        this.est_year = obj.est_year
        this.games = obj.games
    }
}
