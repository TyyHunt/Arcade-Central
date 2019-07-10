$(function() {
    console.log( "arcades ready!" )
    arcadeIndexClick()
});

function arcadeIndexClick() {
    console.log( "entered arcade index click" )
    $('button#arcade-names').on('click', function (event) {
        event.preventDefault()
        getArcade()
    })
}

function getArcade() {
    console.log( "entered get arcade" )
    $.ajax({
        url: 'http://localhost:3000/arcades',
        method: 'get',
        dataType: 'json'
    }).done( function (data) {
        console.log("the data is", data)

    })
    document.getElementById('arcade-show').innerHTML = "Hello"
}

class Arcade {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.location = obj.location
        this.openTime = obj.open_time
        this.closeTime = obj.close_time
        this.estYear = obj.est_year
        this.games = obj.games
    }
}