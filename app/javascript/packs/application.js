
import 'bootstrap';
import JQuery from 'jquery';
import '../plugins/interactjs';
import '../plugins/comment';
import '../plugins/leaderlinejs';
import 'cocoon';
import '../plugins/select_all'
import '../plugins/add_database';
import '../plugins/add_collaborators';
import '../plugins/view_database';
import '../plugins/sidebar';
import '../plugins/clipboard';
import '../plugins/help_button';
import '../plugins/alert';
import '../plugins/error_lists';
import '../plugins/image_preview';
import { initUpdateNavbarOnScroll } from '../plugins/navbar';
import { initTypewriter } from "../plugins/typewriter";

initUpdateNavbarOnScroll();

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

window.JQuery = JQuery;
window.$ = window.JQuery;

require('../stylesheets/application.scss')
