//  какие символы используются на первом уровне ? Пробел, j, f, k, d.
var exer = "";

// для начала нам нужна наша формула генереции случайного числа
function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}

function getRandomInt2(min, max) {
    var rnd = Math.floor(Math.random() * Math.floor(max));
    while (rnd < min)
        rnd = Math.floor(Math.random() * Math.floor(max))
    return rnd;
}

let colors = ['is-info', 'is-success', 'is-warning', 'is-danger', 'is-link'];
//цвета фреймворка bulma, в которые мы будем красить наши кнопки
//при каждой генерации мы будем назначать каждому символу свой цвет, что бы пользователь при печати не путался

let begin = document.querySelector(".begin"); // здесь у нас надпись, которая приглашает пользователя нажать enter для начала игры. Потом она у нас должна пропасть
let progress = document.getElementById("prog"); // здесь прогресс ошибок пользователя
let buttons = document.querySelector('.buttons'); // элемент в который мы будем писать наши буковки
var exercise = document.getElementById("exercise");


var zone0 = ['к', 'е', 'н', 'г', 'а', ' ', 'п', 'р', 'о', 'м', 'и', 'т', 'ь'];
var zone1 = zone0.concat(['у', 'в', 'с', 'ш', 'л', 'б']);
var zone2 = zone1.concat(['ц', 'ы', 'ч', 'щ', 'д', 'ю']);
var zone3 = zone2.concat(['й', 'ф', 'я', 'з', 'ж', 'ъ', 'х', 'э', '.']);

//теперь нужно отрисовать наши буковки

function drawBoard() {

    let value = exercise.value;
    for (let index = value.length - 1; index > -1; index--) { // в идеале этот показатель пользователь должен иметь возможность изменить. Разберем это во второй части нашей статьи
        let rand = getRandomInt(colors.length); // здесь у нас массив буковок и цифр одинаковый по длине, поэтому я выбрал цвета;
        buttons.insertAdjacentHTML("afterbegin",
            '<button class="game-button button is-large ' + colors[rand] + '" id=\"' + value[index] + '\">' + value[index] + '</button>');
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
        error_counter = parseInt(document.getElementById("error_counter").textContent);
        error_counter = error_counter + 1;
        document.getElementById("error_counter").innerHTML = error_counter;
        document.getElementById("input_error_counter").value = error_counter;
        if (error_counter > document.getElementById('maxNumberOfErrors')) {
            document.getElementById("status").value = false;
            document.querySelector('.btnResult').click();
        }
    }
    if (count_right == exercise.value.length) {
        if (document.getElementById('pressingTime') > sec) {
            document.getElementById("status").value = true;
        }
        document.querySelector('.btnResult').click();
    }
}

function newGame() {
    document.location.reload(); // тоже самое что и при проигрыше. В дальнейшем планируется исправить
    drawBoard();
    begin.style.display = "none"; // скрываем приглашающую кнопку
    alert('fs');
    mainGame();
}

let sec = 0;

function init(e) {
    setInterval(tick, 1000);
}

function tick() {
    sec++;
    document.getElementById("speed_counter").innerHTML = (count_right * 60 / sec).toFixed(2);
    document.getElementById("input_speed_counter").value = (count_right * 60 / sec).toFixed(2);
    document.getElementById("transitTime").value = sec;
}


//Создание уровня
function createExcercise() {
    let exerciseSelection = document.querySelector('.createDifficultyLevel');
    var select = document.getElementById("difficultyLevel");
    var value = select.value;
    exerciseSelection.innerHTML = '';

    if (value == 1) {
        document.querySelector('.cleaner_h10').innerHTML = "Допустимые символы: " +zone0;
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<textarea id="text" name="exercise" rows="10" cols="50" class="required" type="text"\n' +
            '                              minlength="${difficulteLevel1.minLength}" maxlength="${difficulteLevel0.maxLength}"\n' +
            '                                                                  onkeydown="return restrictionOfEnteredCharacters(this,event)"></textarea> <input type="hidden" name="minLength" value="${difficulteLevel0.minLength}"/>\n' +
            '                    <input type="hidden" name="maxLength" value="${difficulteLevel0.maxLength}"/>');
    }
    if (value == 2) {
        document.querySelector('.cleaner_h10').innerHTML = "Допустимые символы: " +zone1;
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<textarea id="text" name="exercise" rows="10" cols="50" class="required" type="text"\n' +
            '                              minlength="${difficulteLevel1.minLength}" maxlength="${difficulteLevel1.maxLength}"\n' +
            '                                                                  onkeydown="return restrictionOfEnteredCharacters(this,event)"></textarea> <input type="hidden" name="minLength" value="${difficulteLevel1.minLength}"/>\n' +
            '                    <input type="hidden" name="maxLength" value="${difficulteLevel1.maxLength}"/>');
    }
    if (value == 3) {
        document.querySelector('.cleaner_h10').innerHTML = "Допустимые символы: " +zone2;
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<textarea id="text" name="exercise" rows="10" cols="50" class="required" type="text"\n' +
            '                              minlength="${difficulteLevel2.minLength}" maxlength="${difficulteLevel2.maxLength}"\n' +
            '                                                                  onkeydown="return restrictionOfEnteredCharacters(this,event)"></textarea> <input type="hidden" name="minLength" value="${difficulteLevel2.minLength}"/>\n' +
            '                    <input type="hidden" name="maxLength" value="${difficulteLevel2.maxLength}"/>');
    }
    if (value == 4) {
        document.querySelector('.cleaner_h10').innerHTML = "Допустимые символы: " +zone3;
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<textarea id="text" name="exercise" rows="10" cols="50" class="required" type="text"\n' +
            '                              minlength="${difficulteLevel3.minLength}" maxlength="${difficulteLevel3.maxLength}"\n' +
            '                                                                  onkeydown="return restrictionOfEnteredCharacters(this,event)"></textarea> <input type="hidden" name="minLength" value="${difficulteLevel3.minLength}"/>\n' +
            '                    <input type="hidden" name="maxLength" value="${difficulteLevel3.maxLength}"/>');
    }

}

function autoExerciseZone(zone, len) {
    var str = "";
    for (var i = 0; i < len; i++) {
        str += zone[getRandomInt(zone.length - 1)];
    }
    return str;
}

function autoExercise() {

    var difficultyLevel = document.getElementById('difficultyLevel').value;
    var minLength = document.getElementsByName('minLength').values().next().value.value;
    var maxLength = document.getElementsByName('maxLength').values().next().value.value;
    var len = getRandomInt2(minLength, maxLength);
    var str;
    if (difficultyLevel == 1)
        str = autoExerciseZone(zone0, len);
    else if (difficultyLevel == 2)
        str = autoExerciseZone(zone1, len);
    else if (difficultyLevel == 3)
        str = autoExerciseZone(zone2, len);
    else if (difficultyLevel == 4)
        str = autoExerciseZone(zone3, len);

    document.querySelector('.required').innerHTML = str;

}

function changeDifficultyLevel() {

}

//Выбор параметров тренировки
function changeSelect() {
    let exerciseSelection = document.querySelector('.exerciseSelection');
    var select = document.getElementById("difficultyLevel");
    var value = select.value;
    exerciseSelection.innerHTML = '';
    if (value == 1) {
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select id="idLevel" name ="section" ><c:forEach items="${exercisesLevel1}" var="exercise"> <option value=" ${exercise.id}">${exercise.exercise}</option> </c:forEach></select>');
    }
    if (value == 2)
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select id="idLevel" name ="section" ><c:forEach items="${exercisesLevel2}" var="exercise"> <option value=" ${exercise.id}">${exercise.exercise}</option> </c:forEach></select>');
    if (value == 3)
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select id="idLevel" name ="section" ><c:forEach items="${exercisesLevel3}" var="exercise"> <option value=" ${exercise.id}">${exercise.exercise}</option> </c:forEach></select>');
    if (value == 4)
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select id="idLevel" name ="section" ><c:forEach items="${exercisesLevel4}" var="exercise"> <option value=" ${exercise.id}">${exercise.exercise}</option> </c:forEach></select>');
    let hrefTraining = document.querySelector('.hrefTraining');
    var id = document.getElementById('idLevel');
    var value = id.value;
    //hrefTraining.innerHTML = '';
    var v = ' <a href="/user/training?id=' + id.value + '">Начать тренировку</a><input type="hidden" name="exerciseId" value="' + value + '"/>'.replace();

    exer = value;
}


function saveExercise() {
    var id = document.getElementById('idLevel');
    var value = id.value;
    exer = value;
}

function restrictionOfEnteredCharacters(element, event) {
    var zone0 = [82, 70, 86, 84, 71, 66, 89, 72, 78, 85, 74, 77, 32, 8, 35, 56, 37, 38, 39, 40];
    var zone1 = [69, 68, 67, 73, 75, 188];
    var zone2 = [87, 83, 88, 79, 76, 190];
    var zone3 = [81, 65, 90, 219, 221, 222];
    var select = document.getElementById("difficultyLevel");
    var value = select.value;
    if (value == 1) {
        if (zone0.indexOf(event.keyCode) == -1)
            return false;
    }
    if (value == 2) {
        if (zone0.indexOf(event.keyCode) == -1 && zone1.indexOf(event.keyCode) == -1)
            return false;
    }
    if (value == 3) {
        if (zone0.indexOf(event.keyCode) == -1 && zone1.indexOf(event.keyCode) == -1 && zone2.indexOf(event.keyCode) == -1)
            return false;
    }
    if (value == 4) {
        if (zone0.indexOf(event.keyCode) == -1 && zone1.indexOf(event.keyCode) == -1 && zone2.indexOf(event.keyCode) == -1 && zone3.indexOf(event.keyCode) == -1)
            return false;
    }

}