import "bootstrap";

const covers = document.querySelectorAll(".play-button");

const player = document.querySelector("iframe");

var source = 'https://embed.spotify.com/?uri=spotify:playlist:'


covers.forEach((item) => {
  item.addEventListener("click", (event) => {
  var id = item.attributes.id.value;
  var newSource = source + id;
  console.log(newSource);
  player.src = newSource;
});
});

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
