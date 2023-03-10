// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ActiveButtonController from "./active_button_controller"
application.register("active-button", ActiveButtonController)

import FilterController from "./filter_controller"
application.register("filter", FilterController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import IngredientsController from "./ingredients_controller"
application.register("ingredients", IngredientsController)

import PageOrientationController from "./page_orientation_controller"
application.register("page-orientation", PageOrientationController)

import ToggleFavouriteController from "./toggle_favourite_controller"
application.register("toggle-favourite", ToggleFavouriteController)
