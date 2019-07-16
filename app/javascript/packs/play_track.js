const playTrack = () => {
  console.log("play track js");
  const covers = document.querySelectorAll(".play-button");

  const player = document.querySelector("iframe");
  const description = document.querySelector("#info-description");
  const artist = document.querySelector("#info-artist");

  var source = 'https://embed.spotify.com/?uri=spotify:playlist:'


  covers.forEach((item) => {
    item.addEventListener("click", (event) => {
    var id = item.attributes.id.value;
    var newSource = source + id;
    console.log(newSource);
    player.src = newSource;
    description.innerText = item.attributes.description.value;
    artist.innerHTML = "About "+item.attributes.artist.value+":<br />" +
    item.attributes.bio.value;
  });
  });
};

export { playTrack };
