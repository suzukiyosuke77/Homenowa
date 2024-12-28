import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import Raty from "raty.js";

document.addEventListener("turbolinks:load", () => {
  document.querySelectorAll(".star-rating-display").forEach((element) => {
    const score = element.dataset.score;
    if (element) {
      new Raty(element, {
        starOn: element.dataset.starOn || "/assets/star-on.png",
        starOff: element.dataset.starOff || "/assets/star-off.png",
        number: 3, // 表示する星の数を3つに制限
        score: score,
        readOnly: true, 
      }).init();
    }
  });

  const ratingField = document.getElementById("post_rating");
  if (ratingField) {
    const ratyInstance = new Raty(document.getElementById("star-rating"), {
      scoreName: "post[rating]",
      starOn: "/assets/star-on.png",
      starOff: "/assets/star-off.png",
      number: 3, // 表示する星の数を3つに制限
      score: 3, // デフォルトで星3つを選択
      click: function (score) {
        ratingField.value = score;
      },
    });
    ratingField.value = 3;
    ratyInstance.init();
  }
});
