import('./common');
/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

// any CSS you import will output into a single css file (app.css in this case)
import '../scss/app.scss';

// Need jQuery? Install it with "yarn add jquery", then uncomment to import it.
// import $ from 'jquery';

//Requete ajax
let scoreForm = document.getElementById('score-form');
if (null != scoreForm) { // Test si le formulaire existe bien
    let clickedSubmit = null;

    // Event onclick sur chaque boutons pour stocker le bouton qui a été cliqué
    let submitButtons = scoreForm.querySelectorAll('button');
    submitButtons.forEach((value) => {
        value.onclick = function () {
            clickedSubmit = this;
        };
    });

    scoreForm.onsubmit = () => {
        let request = new XMLHttpRequest();

        request.open('post', scoreForm.getAttribute('action'));
        request.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        request.onload = () => {
            let json = JSON.parse(request.responseText);
            let result = document.createElement('div');
            result.innerHTML = json.message;
            scoreForm.parentNode.replaceChild(result, scoreForm);
        };
        // Récupére la valeur du bouton cliqué
        let formData = new FormData(scoreForm);
        formData.set('score', clickedSubmit.value);
        request.send(formData);

        return false; // empéche l'envois du formulaire
    }
}