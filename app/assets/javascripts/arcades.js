$(function() {
    console.log( "arcades ready!" );
    arcadeIndexClick()
});

function arcadeIndexClick() {
    $('button.arcade-names').on('click', function (event) {
        event.preventDefault()
        console.log("works")
        getArcade()
    })
}

function getArcade() {
    document.getElementsByID('arcade-show').innerHTML = "Hello"
}