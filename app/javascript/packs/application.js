require("stylesheets/application.scss")

import "bootstrap";
import JQuery from 'jquery';
import 'bootstrap'
import "../plugins/interactjs";
import "../plugins/comment";
import "../plugins/leaderlinejs";
import "cocoon";
import "../plugins/select_all"
import "../plugins/add_database";
import "../plugins/add_collaborators";
import "../plugins/view_database";
import "../plugins/sidebar_menu";
import "../plugins/clipboard";
import "../plugins/help_button";
import "../plugins/alert";
import "../plugins/error_lists";
import "../plugins/avatar_preview";

window.$ = window.JQuery = JQuery;

import { initUpdateNavbarOnScroll } from '../plugins/navbar';
initUpdateNavbarOnScroll();

import { initTypewriter } from "../plugins/typewriter";
if (document.getElementById("typewriter")) {
    initTypewriter().typeString('visualisation.')
    .pauseFor(700)
    .deleteAll(74)
    .typeString('navigation.')
    .pauseFor(700)
    .deleteAll(74)
    .typeString('collaboration.')
    .pauseFor(700)
    .start();
}
