const filter = () => {
  const playlists = document.querySelectorAll(".overlay-image");
  const slider = document.querySelector("#danceability-slider");

slider.addEventListener("change", (event) => {
  let slider_value = slider.value;
  console.log(slider_value);
  playlists.forEach((item) => {
  ///console.log(item.querySelector("#is_dancing").innerText);
    let is_dancing = item.querySelector("#is_dancing").innerText
    console.log(is_dancing);
    item.style.display = "";
    if (is_dancing !== slider_value) {
      item.style.display = "none";
    }
  });
});
}

export { filter };

// slider = 1 > is_dancing = 0
// slider = 2 > is_dancing = 0 & 1
// slider = 3 > is_dancing = 0, 1 et 2
// slider = 4 > is_dancing = 1 et 2
// slider = 5 > is_dancing = 2
