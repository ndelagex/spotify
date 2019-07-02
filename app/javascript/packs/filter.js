const filter = () => {


  const dancing_slider = document.querySelector("#danceability-slider");

  dancing_slider.addEventListener("change", (event) => {
    let slider_value = parseInt(dancing_slider.value);
    console.log(slider_value);
    const playlists = document.querySelectorAll(".overlay-image");

    playlists.forEach((item) => {
    ///console.log(item.querySelector("#is_dancing").innerText);
      let is_dancing = item.querySelector("#is_dancing").innerText;
      let is_dancing_filtered = item.querySelector("#is_dancing_filtered").innerText;
      let is_vocal_filtered = item.querySelector("#is_vocal_filtered").innerText;
      let is_summer_filtered = item.querySelector("#is_summer_filtered").innerText;
      let is_robot_filtered = item.querySelector("#is_robot_filtered").innerText;
      if (
        ((is_dancing == "2") && ([1,2].includes(slider_value))) ||
        ((is_dancing == "1") && ([1,5].includes(slider_value))) ||
        ((is_dancing == "0") && ([4,5].includes(slider_value)))
        )
      {
        item.style.display = "none";
        item.querySelector("#is_dancing_filtered").innerText = 'true';
      } else
      {
        item.style.display = "";
        item.querySelector("#is_dancing_filtered").innerText = 'false';
      }
      if ([is_vocal_filtered,is_summer_filtered,is_robot_filtered].includes('true')) {
        item.style.display = "none";
      }
    });
  });

  ///// vocals or intruments

  const vocability_slider = document.querySelector("#vocability-slider");

  vocability_slider.addEventListener("change", (event) => {
    let slider_value = parseInt(vocability_slider.value);
    const playlists = document.querySelectorAll(".overlay-image");
    playlists.forEach((item) => {
    ///console.log(item.querySelector("#is_dancing").innerText);
      let is_vocal = item.querySelector("#is_vocal").innerText;
      let is_dancing_filtered = item.querySelector("#is_dancing_filtered").innerText;
      let is_vocal_filtered = item.querySelector("#is_vocal_filtered").innerText;
      let is_summer_filtered = item.querySelector("#is_summer_filtered").innerText;
      let is_robot_filtered = item.querySelector("#is_robot_filtered").innerText;
      if (
        ((is_vocal == "2") && ([1,2].includes(slider_value))) ||
        ((is_vocal == "1") && ([1,5].includes(slider_value))) ||
        ((is_vocal == "0") && ([4,5].includes(slider_value)))
        )
      {
        item.style.display = "none";
        item.querySelector("#is_vocal_filtered").innerText = 'true';
      } else
      {
        item.style.display = "";
        item.querySelector("#is_vocal_filtered").innerText = 'false';
      };
      if ([is_dancing_filtered,is_summer_filtered,is_robot_filtered].includes('true')) {
        item.style.display = "none";
      }
    });
  });

  ///// summer or winter

  const summerability_slider = document.querySelector("#summerability-slider");

  summerability_slider.addEventListener("change", (event) => {
    let slider_value = parseInt(summerability_slider.value);
    console.log(slider_value);
    const playlists = document.querySelectorAll(".overlay-image");
    playlists.forEach((item) => {
    ///console.log(item.querySelector("#is_dancing").innerText);
      let is_summer = item.querySelector("#is_summer").innerText;
      let is_dancing_filtered = item.querySelector("#is_dancing_filtered").innerText;
      let is_vocal_filtered = item.querySelector("#is_vocal_filtered").innerText;
      let is_summer_filtered = item.querySelector("#is_summer_filtered").innerText;
      let is_robot_filtered = item.querySelector("#is_robot_filtered").innerText;
      item.style.display = "";
      if (
        ((is_summer == "2") && ([1,2].includes(slider_value))) ||
        ((is_summer == "1") && ([1,5].includes(slider_value))) ||
        ((is_summer == "0") && ([4,5].includes(slider_value)))
        )
      {
        item.style.display = "none";
        item.querySelector("#is_summer_filtered").innerText = 'true';
      } else
      {
        item.style.display = "";
        item.querySelector("#is_summer_filtered").innerText = 'false';
      };
      if ([is_dancing_filtered,is_vocal_filtered,is_robot_filtered].includes('true')) {
        item.style.display = "none";
      }
    });
  });

  ///// acoustic or robot

  const acousticality_slider = document.querySelector("#acousticality-slider");

  acousticality_slider.addEventListener("change", (event) => {
    let slider_value = parseInt(acousticality_slider.value);
    console.log(slider_value);
    const playlists = document.querySelectorAll(".overlay-image");
    playlists.forEach((item) => {
    ///console.log(item.querySelector("#is_dancing").innerText);
      let is_acoustic = item.querySelector("#is_robot").innerText;
      let is_dancing_filtered = item.querySelector("#is_dancing_filtered").innerText;
      let is_vocal_filtered = item.querySelector("#is_vocal_filtered").innerText;
      let is_summer_filtered = item.querySelector("#is_summer_filtered").innerText;
      let is_robot_filtered = item.querySelector("#is_robot_filtered").innerText;
      item.style.display = "";
      if (
        ((is_acoustic == "2") && ([1,2].includes(slider_value))) ||
        ((is_acoustic == "1") && ([1,5].includes(slider_value))) ||
        ((is_acoustic == "0") && ([4,5].includes(slider_value)))
        )
      {
        item.style.display = "none";
        item.querySelector("#is_robot_filtered").innerText = 'true';
      } else
      {
        item.style.display = "";
        item.querySelector("#is_robot_filtered").innerText = 'false';
      };
      if ([is_dancing_filtered,is_summer_filtered,is_vocal_filtered].includes('true')) {
        item.style.display = "none";
      }
    });
  });
}

export { filter };

// slider = 1 > is_dancing = 0 > hide 1 and 2
// slider = 2 > is_dancing = 0 & 1 > hide 2
// slider = 3 > is_dancing = 0, 1 et 2 > hide nothing
// slider = 4 > is_dancing = 1 et 2 > hide 0
// slider = 5 > is_dancing = 2 > hide 0 and 1
//
// dancing = 2 slider [1,2]
// dancing = 1 slider [1,5]
// dancing = 0 slider [4,5]
