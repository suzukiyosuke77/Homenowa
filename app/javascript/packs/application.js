// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import Raty from "raty.js";

document.addEventListener('turbolinks:load', () => {
  const ratingField = document.getElementById('post_rating');

  if (ratingField) {
    // Ratyインスタンスの作成
    const ratyInstance = new Raty(document.getElementById('star-rating'), {
      scoreName: 'post[rating]',
      starOn: '/assets/star-on.png',
      starOff: '/assets/star-off.png',
      number: 3, // 表示する星の数を3つに制限
      score: 3, // デフォルトで星3つを選択
      click: function(score) {
        ratingField.value = score;
      }
    });
    ratingField.value = 3;
    ratyInstance.init(); // Ratyを初期化
  }
});