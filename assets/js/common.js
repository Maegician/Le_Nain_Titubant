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