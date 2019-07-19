
function changeColor(icons) {
  icons.forEach((icon) => {
    console.log(icon.textContent);
    switch (parseInt(icon.textContent, 10)) {
      case 1:
        icon.classList.add('gold');
        break;
      case 2:
        icon.classList.add('silver');
        break;
      case 3:
        icon.classList.add('bronze');
        break;
      default:
        break;
    }
  })
}

export default changeColor;
