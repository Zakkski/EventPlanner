import "bootstrap";
import changeColors from '../plugins/place_icons';

const placeIcons = document.querySelectorAll('.place-circle');

if(placeIcons) {
  changeColors(placeIcons);
}
