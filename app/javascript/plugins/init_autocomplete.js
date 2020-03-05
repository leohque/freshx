import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('address-search');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
