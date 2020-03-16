import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/cleliabailly/ck7nmmcwi12ft1ipwb645cq6u' // TODO: edit style
    });


    // Current Location button
    map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true,
      },
      trackUserLocation: false,
      showAccuracyCircle: false
      },

    ));

    // Markers
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // defining the popup info window
      const element = document.createElement('div'); // this element is the custom marker
      element.className = 'marker avatar';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'cover';

      new mapboxgl.Marker(element) // passing the custom marker as an element
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // adding the info window
      .addTo(map);
    });

    fitMapToMarkers(map, markers);
  }

  // This auto-locates user after load
  setTimeout(function() {
      $(".mapboxgl-ctrl-geolocate").click();
  },1000);
};

export { initMapbox };


