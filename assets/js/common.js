// Importer jQuery
import $ from 'jquery';
require('bootstrap');

import bsCustomFileInput from 'bs-custom-file-input';
$(document).ready(function () {
    bsCustomFileInput.init()
});

import 'summernote/dist/summernote-bs4';
$(document).ready(function () {
    $('.wysiwyg').summernote();
});

import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css';
import 'tippy.js/animations/scale-subtle.css';

tippy('[data-tippy-content]',{
    placement: 'bottom-start',
    arrow: false,
    animation: 'scale-subtle',
});

import AOS from 'aos';
import 'aos/dist/aos.css';
AOS.init();