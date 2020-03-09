import "bootstrap";
import "../pages/posts/show";

import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();
