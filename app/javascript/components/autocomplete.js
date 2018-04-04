// app/javascript/components/autocomplete.js
function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var surfboardAddress = document.getElementById('surfboard_address');

    if (surfboardAddress) {
      var autocomplete = new google.maps.places.Autocomplete(surfboardAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(surfboardAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
