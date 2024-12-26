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
  // 星評価表示用（投稿一覧など）
  document.querySelectorAll(".star-rating-display").forEach((element) => {
    const score = element.dataset.score; // 各投稿のスコアを取得
    if (element) {
      new Raty(element, {
        starOn: element.dataset.starOn || "/assets/star-on.png",
        starOff: element.dataset.starOff || "/assets/star-off.png",
        starHalf: element.dataset.starHalf || "/assets/star-half.png",
        score: score,
        readOnly: true, // 読み取り専用
      }).init();
    }
  });

  // 星評価入力用（新規投稿など）
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
    ratyInstance.init(); // Ratyを初期化
  }
});
