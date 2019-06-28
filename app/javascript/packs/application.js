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
  console.log(slider.value);
  playlists.forEach((item) => {
  // var id = item.attributes.id.value;
  //var newSource = source + id;
});
});
