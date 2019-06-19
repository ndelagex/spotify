import "bootstrap";

const covers = document.querySelectorAll(".cover");

const player = document.querySelector("iframe");

var source = 'https://embed.spotify.com/?uri=spotify:playlist:'

console.log(player.src);

covers.forEach((item) => {
  item.addEventListener("click", (event) => {
  var id = item.attributes.id.value;
  var newSource = source + id;
  console.log(newSource);
  player.src = newSource;
});
});



