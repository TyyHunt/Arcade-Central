$(function() {
    console.log( "arcades ready!" )
    clickSpecific()
});

function clickSpecific() {
    document.body.addEventListener("click", event => {
        if (event.target.nodeName == "BUTTON") {
            let arcadeName = $(event.target)[0].innerText
            let arcadeData = 
            $.get('/arcades.json' , function (data) { 
                console.log("the data is", arcadeName)
                arcadeHtml = HandlebarsTemplates['show_arcade']({ 
                    name: arcadeName  
                });
                $('#arcade-show').html(arcadeHtml); 
            });
        }
        
      });
}

Arcade.prototype.singleArray = function (array, input) {
    array.map
}

function getArcade() {
    console.log( "entered get arcade" )
    $.get('/arcades.json' , function (data) { 
        console.log("the data is", data)
        arcadeHtml = HandlebarsTemplates['show_arcade']({ 
            name: data  
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
