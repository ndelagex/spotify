const playTrack = () => {
  console.log("play track js");
  const covers = document.querySelectorAll(".play-button");

  const player = document.querySelector("iframe");
  const description = document.querySelector("#playlist-description");
  const artist = document.querySelector("#artist-bio");
  const artistName = document.querySelector("#artist-name");
  const avatar = document.querySelector(".avatar");

  var source = 'https://embed.spotify.com/?uri=spotify:playlist:'


  covers.forEach((item) => {
    item.addEventListener("click", (event) => {
    var id = item.attributes.id.value;
    var newSource = source + id;
    var aboutArtist, artistNamo;
    player.src = newSource;
    //console.log(item.attributes.avatar.value);
    // setting playlist description
    if (item.attributes.description.value == "")
      {
        description.style.display = "none";
      }
    else
      {
        description.style.display = "";
        description.innerHTML = (item.attributes.name.value + ": " + item.attributes.description.value);
      }
    // setting artist bio
    if (item.attributes.artist && (item.attributes.bio.value != ""))
      {
        aboutArtist = item.attributes.bio.value;
      }
    else {
      aboutArtist = "";
    }
    artist.innerHTML = aboutArtist;
    // setting artist name
    if (item.attributes.artist)
      {
        artistNamo = item.attributes.artist.value + "<br />";
      }
    else {
      artistNamo = "";
    }
    artistName.innerHTML = artistNamo;
    // setting avatar
    if (item.attributes.avatar.value != "")
      {
        avatar.style.display = "";
        avatar.src = item.attributes.avatar.value;
      }
    else {
      avatar.style.display = "none";
    }
  });
  });
};

export { playTrack };
