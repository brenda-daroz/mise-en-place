// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import * as Turbo from "@hotwired/turbo"

Turbo.scroll = {};

document.addEventListener("turbo:load", ()=> {

  const elements = document.querySelectorAll("[data-turbolinks-scroll]");

  elements.forEach(function(element){

    element.addEventListener("click", ()=> {
      Turbo.scroll['top'] = document.scrollingElement.scrollTop;
    });

    element.addEventListener("submit", ()=> {
      Turbo.scroll['top'] = document.scrollingElement.scrollTop;
    });

  });

  if (Turbo.scroll['top']) {
    document.scrollingElement.scrollTo(0, Turbo.scroll['top']);
  }

  Turbo.scroll = {};
});

