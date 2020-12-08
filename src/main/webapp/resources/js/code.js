//  какие символы используются на первом уровне ? Пробел, j, f, k, d.

// для начала нам нужна наша формула генереции случайного числа
function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
}


let colors = ['is-info', 'is-success', 'is-warning', 'is-danger', 'is-link'];
//цвета фреймворка bulma, в которые мы будем красить наши кнопки
//при каждой генерации мы будем назначать каждому символу свой цвет, что бы пользователь при печати не путался
let str_arr = ['j', 'f', 'k', 'd', ' '];

let begin = document.querySelector(".begin"); // здесь у нас надпись, которая приглашает пользователя нажать enter для начала игры. Потом она у нас должна пропасть
let progress = document.getElementById("prog"); // здесь прогресс ошибок пользователя
let buttons = document.querySelector('.buttons'); // элемент в который мы будем писать наши буковки

//теперь нужно отрисовать наши буковки

function drawBoard() {
    for (let index = 0; index < 20; index++) { // в идеале этот показатель пользователь должен иметь возможность изменить. Разберем это во второй части нашей статьи
        let rand = getRandomInt(colors.length); // здесь у нас массив буковок и цифр одинаковый по длине, поэтому я выбрал цвета

        buttons.insertAdjacentHTML("afterbegin",
            '<button class="game-button button is-large ' + colors[rand] + '" id=\"' + str_arr[rand] + '\">' + str_arr[rand] + '</button>');
    }
}

document.addEventListener('keydown', StartGame, {
    once: true
    //благодаря once у нас отрисовка вызывается только один раз
});

function StartGame(e) {
    if (e.key == "Enter") {
        drawBoard();
        begin.style.display = "none"; // скрываем приглашающую кнопку
        mainGame(); // игра началась
    }
}

function mainGame() {
    document.addEventListener('keyup', press); //  я создал отдельную функцию, что бы была возможность ее останавливать
}

let error_counter = document.getElementById("error_counter");
error_counter = parseInt(document.getElementById("error_counter").textContent);

var count_right = 0;

error_counter = 0;

function press(e) {

    let elements_arr = document.querySelectorAll(".game-button");  // выбираем все созданные кнопки

    if (e.key == elements_arr[0].id) { // здесь можно выбирать и по querySelector, но тогда код будет длиннее
        elements_arr[0].remove();
        count_right++; //  считаем правильные ответы
    } else {
        //errors_count++; // считаем ошибки
        //progress.value = errors_count;
        error_counter = parseInt(document.getElementById("error_counter").textContent);
        error_counter = error_counter + 1;
        document.getElementById("error_counter").innerHTML = error_counter;
        if (error_counter > 20) { // если пользователь допустит ошибок больше чем у нас букв, игра закончится
            let fail = confirm("Game over! Хотите сыграть еще раз?");
            if (fail) {
                document.location.reload(); // перезагрузка страницы если пользователь согласился еще раз играть
            } else {
                // здесь могла быть ваша реклама
                document.addEventListener('keydown', press);
            }
        }
    }
    if (count_right == 20) {
        alert("Вы выиграли!");
        let win = confirm("Хотите поиграть еще?");
        if (win) {
            document.location.reload(); // тоже самое что и при проигрыше. В дальнейшем планируется исправить
            drawBoard();
            begin.style.display = "none"; // скрываем приглашающую кнопку
            mainGame(); // игра началась
        }
    }
}

function newGame() {
    document.location.reload(); // тоже самое что и при проигрыше. В дальнейшем планируется исправить
    drawBoard();
    begin.style.display = "none"; // скрываем приглашающую кнопку
    mainGame();
}

let sec = 0;

function init(e) {
    setInterval(tick, 1000);
}

function tick() {
    sec++;
    document.getElementById("speed_counter").innerHTML = count_right * 60 / sec;
}


//Выбор параметров тренировки



function changeSelect(){
    let exerciseSelection = document.querySelector('.exerciseSelection');
    var select=document.getElementById("difficultyLevel");
    var value=select.value;
exerciseSelection.innerHTML='';
    if(value==1) {
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select><c:forEach items="${exercisesLevel1}" var="exercise"> <option>${exercise.exercise}</option> </c:forEach></select>');
    }
    if(value==2)
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select><c:forEach items="${exercisesLevel2}" var="exercise"> <option>${exercise.exercise}</option> </c:forEach></select>');
    if(value==3)
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select><c:forEach items="${exercisesLevel3}" var="exercise"> <option>${exercise.exercise}</option> </c:forEach></select>');
    if(value==4)
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select><c:forEach items="${exercisesLevel4}" var="exercise"> <option>${exercise.exercise}</option> </c:forEach></select>');
}

function restrictionOfEnteredCharacters(element,event){
    var zone0=[82,70,86,84,71,66,89,72,78,85,74,77,32];
    var zone1=[69,68,67,73,75,188];
    var zone2=[87,83,88,79,76,190];
    var zone3=[81,65,90,219,221,222];
    var select=document.getElementById("difficultyLevel");
    var value=select.value;
    if(value==1){
        if(zone0.indexOf(event.keyCode)== -1)
            return false;
    }
    if(value==2){
        if(zone0.indexOf(event.keyCode)== -1 && zone1.indexOf(event.keyCode)==-1)
            return false;
    }
    if(value==3){
        if(zone0.indexOf(event.keyCode)== -1 && zone1.indexOf(event.keyCode)==-1 && zone2.indexOf(event.keyCode)==-1)
            return false;
    }
    if(value==4){
        if(zone0.indexOf(event.keyCode)== -1 && zone1.indexOf(event.keyCode)==-1 && zone2.indexOf(event.keyCode)==-1 && zone3.indexOf(event.keyCode)==-1)
            return false;
    }

}