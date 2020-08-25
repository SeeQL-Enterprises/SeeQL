import 'bootstrap';
import 'cocoon';
import JQuery from 'jquery';
import '../plugins/add_collaborators';
import '../plugins/add_database';
import '../plugins/alert';
import '../plugins/clipboard';
import '../plugins/comment';
import '../plugins/error_lists';
import '../plugins/help_button';
import '../plugins/image_preview';
import '../plugins/interactjs';
import '../plugins/leaderlinejs';
import '../plugins/project_options';
import '../plugins/select_all'
import '../plugins/sidebar';
import '../plugins/view_database';

import '../../assets/stylesheets/tailwind.scss';

import initUpdateNavbarOnScroll from '../plugins/navbar';
import initTypewriter from "../plugins/typewriter";

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
