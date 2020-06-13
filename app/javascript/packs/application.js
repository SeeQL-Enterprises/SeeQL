require("stylesheets/application.scss")

import "bootstrap";
import "../plugins/interactjs";
import "../plugins/comment";
import "../plugins/leaderlinejs";
import "cocoon";
import "../plugins/select_all"
import "../plugins/add_database";
import "../plugins/add_collaborators";
import "../plugins/view_database";
import "../plugins/sidebar-menu";
import "../plugins/clipboard";

import { initUpdateNavbarOnScroll } from '../plugins/navbar';
initUpdateNavbarOnScroll();

import { initTypewriter } from "../plugins/typewriter";
initTypewriter().typeString('visualisation.')
    .pauseFor(700)
    .deleteAll(74)
    .typeString('navigation.')
    .pauseFor(700)
    .deleteAll(74)
    .typeString('collaboration.')
    .pauseFor(700)
    .start();
