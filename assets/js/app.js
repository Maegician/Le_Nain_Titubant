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
let commentList = document.getElementById('comment-list');

if (null != scoreForm) { // Test si le formulaire existe bien

    scoreForm.onsubmit = () => {
        let request = new XMLHttpRequest();

        request.open('post', scoreForm.getAttribute('action'));
        request.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        request.onload = () => {
            console.log("request onload");
            let json = JSON.parse(request.responseText);
            let result = document.createElement('div');
            result.innerHTML = json.message;
            scoreForm.parentNode.removeChild(scoreForm);


            let commentDiv=document.createElement('div');
            let scoreDiv=document.createElement('div');
            commentDiv.classList.add('comment-item');
            commentDiv.classList.add('col-11');
            commentDiv.classList.add('mb-4');
            commentDiv.classList.add('p-3');
            commentDiv.classList.add('overflow-y');
            commentDiv.innerHTML=json.comment.content;
            scoreDiv.innerHTML=json.comment.score;
            commentList.prepend(commentDiv);
            commentDiv.prepend(scoreDiv);
        };
        // Récupére la valeur du bouton cliqué
        let formData = new FormData(scoreForm);
        request.send(formData);
        console.log(formData);
        return false; // empéche l'envois du formulaire
    }
}