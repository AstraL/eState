import '../scss/application.scss';

import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
import 'bootstrap/dist/js/bootstrap';
import 'flexslider/jquery.flexslider-min'
import '../js/application/helper-plugins';
import 'bootstrap-select/dist/js/bootstrap-select';
import 'waypoints/lib/jquery.waypoints';
import 'jssocials/dist/jssocials';

Rails.start();
Turbolinks.start();

import '../js/application/init';
import '../js/application/realties';
import '../js/application/base';