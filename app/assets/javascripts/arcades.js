$(function() {
    console.log( "arcades ready!" )
    arcadeIndexClick()
});

function arcadeIndexClick() {
    console.log( "entered arcade index click" )
    document.addEventListener('click', function (event) {
        if ( event.target.classList.contains( 'arcade-id' ) ) {
            event.preventDefault()
            getArcade()
        }
    }, false);
}






function getArcade() {
    console.log( "entered get arcade" )
    $.get('/arcades.json' , function (data) { 
        console.log("the data is", data)
        arcadeHtml = HandlebarsTemplates['show_arcade']({ 
            arcade: data[0] 
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
