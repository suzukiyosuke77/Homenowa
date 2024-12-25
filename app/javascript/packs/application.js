import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

import Raty from "raty.js";
import starOn from "../images/star-on.png";
import starOff from "../images/star-off.png";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener("turbolinks:load", () => {
  document.querySelectorAll(".star-rating-display").forEach((element) => {
    const score = element.dataset.score;
    new Raty(element, {
      readOnly: true,
      score: score,
      starOn: starOn,
      starOff: starOff,
    }).init();
  });

  const ratingField = document.getElementById("post_rating");

  if (ratingField) {
    const ratyInstance = new Raty(document.getElementById("star-rating"), {
      scoreName: "post[rating]",
      starOn: starOn,
      starOff: starOff,
      number: 3,
      score: 3,
      click: function (score) {
        ratingField.value = score;
      },
    });
    ratingField.value = 3; // 初期値を設定
    ratyInstance.init(); // Ratyを初期化
  }
});
