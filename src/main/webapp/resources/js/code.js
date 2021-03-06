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
    buttons.innerHTML = "";
    for (let index = value.length - 1; index > -1; index--) { // в идеале этот показатель пользователь должен иметь возможность изменить. Разберем это во второй части нашей статьи
        let rand = getRandomInt(colors.length); // здесь у нас массив буковок и цифр одинаковый по длине, поэтому я выбрал цвета;

        buttons.insertAdjacentHTML("afterbegin",
            '<span  class="game-button button is-large ' + colors[rand] + '" id=\"' + value[index] + '\">' + value[index] + '</span>');
    }
}

var tr = true;


function keyboard() {
    if (document.getElementById('onKeyboard').checked == tr) {
        document.querySelector('#keyboard').innerHTML = "<li class=\"symbol\"><span class=\"off\">`</span><span class=\"on\">~</span></li>\n" +
            "\t\t<li id='key1' class=\"symbol\"><span class=\"off\">1</span><span class=\"on\">!</span></li>\n" +
            "\t\t<li id='key2' class=\"symbol\"><span class=\"off\">2</span><span class=\"on\">@</span></li>\n" +
            "\t\t<li id='key3' class=\"symbol\"><span class=\"off\">3</span><span class=\"on\">#</span></li>\n" +
            "\t\t<li id='key4' class=\"symbol\"><span class=\"off\">4</span><span class=\"on\">$</span></li>\n" +
            "\t\t<li id='key5' class=\"symbol\"><span class=\"off\">5</span><span class=\"on\">%</span></li>\n" +
            "\t\t<li id='key6' class=\"symbol\"><span class=\"off\">6</span><span class=\"on\">^</span></li>\n" +
            "\t\t<li id='key7' class=\"symbol\"><span class=\"off\">7</span><span class=\"on\">&amp;</span></li>\n" +
            "\t\t<li id='key8' class=\"symbol\"><span class=\"off\">8</span><span class=\"on\">*</span></li>\n" +
            "\t\t<li id='key9' class=\"symbol\"><span class=\"off\">9</span><span class=\"on\">(</span></li>\n" +
            "\t\t<li id='key0' class=\"symbol\"><span class=\"off\">0</span><span class=\"on\">)</span></li>\n" +
            "\t\t<li id='key-' class=\"symbol\"><span class=\"off\">-</span><span class=\"on\">_</span></li>\n" +
            "\t\t<li id='key=' class=\"symbol\"><span class=\"off\">=</span><span class=\"on\">+</span></li>\n" +
            "\t\t<li id='keydelete' class=\"delete lastitem\">delete</li>\n" +
            "\t\t<li id='keytab' class=\"tab\">tab</li>\n" +
            "\t\t<li id='keyй' class=\"letter\">й</li>\n" +
            "\t\t<li id='keyц' class=\"letter\">ц</li>\n" +
            "\t\t<li id='keyу' class=\"letter\">у</li>\n" +
            "\t\t<li id='keyк' class=\"letter\">к</li>\n" +
            "\t\t<li id='keyе' class=\"letter\">е</li>\n" +
            "\t\t<li id='keyн' class=\"letter\">н</li>\n" +
            "\t\t<li id='keyг' class=\"letter\">г</li>\n" +
            "\t\t<li id='keyш' class=\"letter\">ш</li>\n" +
            "\t\t<li id='keyщ' class=\"letter\">щ</li>\n" +
            "\t\t<li id='keyз' class=\"letter\">з</li>\n" +
            "\t\t<li id='keyх' class=\"symbol\"><span class=\"off\">х</span><span class=\"on\">{</span></li>\n" +
            "\t\t<li id='keyъ' class=\"symbol\"><span class=\"off\">ъ</span><span class=\"on\">}</span></li>\n" +
            "\t\t<li id='key' class=\"symbol lastitem\"><span class=\"off\"></span><span class=\"on\">|</span></li>\n" +
            "\t\t<li id='keycapsLock' class=\"capslock\">caps lock</li>\n" +
            "\t\t<li id='keyф' class=\"letter\">ф</li>\n" +
            "\t\t<li id='keyы' class=\"letter\">ы</li>\n" +
            "\t\t<li id='keyв' class=\"letter\">в</li>\n" +
            "\t\t<li id='keyа' class=\"letter\">а</li>\n" +
            "\t\t<li id='keyп' class=\"letter\">п</li>\n" +
            "\t\t<li id='keyр' class=\"letter\">р</li>\n" +
            "\t\t<li id='keyо' class=\"letter\">о</li>\n" +
            "\t\t<li id='keyл' class=\"letter\">л</li>\n" +
            "\t\t<li id='keyд' class=\"letter\">д</li>\n" +
            "\t\t<li id='keyж' class=\"letter\">ж</li>\n" +
            "\t\t<li id='keyэ' class=\"symbol\"><span class=\"off\">э</span><span class=\"on\">&quot;</span></li>\n" +
            "\t\t<li id='keyEnter' class=\"return lastitem\">enter</li>\n" +
            "\t\t<li id='keylShift' class=\"left-shift\">shift</li>\n" +
            "\t\t<li id='keyя' class=\"letter\">я</li>\n" +
            "\t\t<li id='keyч' class=\"letter\">ч</li>\n" +
            "\t\t<li id='keyс' class=\"letter\">с</li>\n" +
            "\t\t<li id='keyм' class=\"letter\">м</li>\n" +
            "\t\t<li id='keyи' class=\"letter\">и</li>\n" +
            "\t\t<li id='keyт' class=\"letter\">т</li>\n" +
            "\t\t<li id='keyь' class=\"letter\">ь</li>\n" +
            "\t\t<li id='keyб' class=\"letter\">б</li>\n" +
            "\t\t<li id='keyю' class=\"letter\">ю</li>\n" +
            "\t\t<li id='key/' class=\"symbol\"><span class=\"off\">/</span><span class=\"on\">?</span></li>\n" +
            "\t\t<li id='keyshift' class=\"right-shift lastitem\">shift</li>\n" +
            "\t\t<li id='keyspace' class=\"space lastitem\">&nbsp;</li>";

    } else {
        document.querySelector('#keyboard').innerHTML = "";
    }
}

document.addEventListener('keydown', StartGame, {
    once: true
    //благодаря once у нас отрисовка вызывается только один раз
});

function StartGame() {
    drawBoard();
    mainGame(); // игра началась
}

function mainGame() {
    document.addEventListener('keypress', press); //  я создал отдельную функцию, что бы была возможность ее останавливать
    document.addEventListener('keyup', up);
}

let error_counter = document.getElementById("error_counter");
error_counter = parseInt(document.getElementById("error_counter").textContent);


var count_right = 0;

error_counter = 0;

function up(e) {
    if (document.getElementById('onKeyboard').checked == tr)
        if (e.keyCode == 32) {
            document.getElementById('keyspace').setAttribute("style", "background-color:white;");
        } else
            document.getElementById('key' + e.key).setAttribute("style", "background-color:white;");

}

function press(e) {
    let elements_arr = document.querySelectorAll(".game-button");  // выбираем все созданные кнопки
    if (document.getElementById('onKeyboard').checked == tr) {
        if (e.keyCode == 32) {
            document.getElementById('keyspace').setAttribute("style", "background-color:#9cb4e2;");
        } else
            document.getElementById('key' + e.key).setAttribute("style", "background-color:#9cb4e2;");

    }


    if (e.key == elements_arr[0].id) { // здесь можно выбирать и по querySelector, но тогда код будет длиннее
        elements_arr[0].remove();
        count_right++; //  считаем правильные ответы
    } else {
        error_counter = parseInt(document.getElementById("error_counter").textContent);
        error_counter = error_counter + 1;
        document.getElementById("error_counter").innerHTML = error_counter;
        document.getElementById("input_error_counter").value = error_counter;
        if (error_counter >= document.querySelector('#maxNumberOfErrors').value) {
            document.getElementById("status").value = false;
            document.querySelector('.btnResult').click();
        }
    }

    if (count_right == exercise.value.length) {
        if (document.getElementById('pressingTime').value * 60 <= document.getElementById("input_speed_counter").value) {
            document.getElementById("status").value = true;
        }
        document.querySelector('.btnResult').click();
    }
}

function result() {
    if (document.getElementById('result').innerText == 'true')
        document.getElementById('result').innerHTML = "Пройдено!";
    else {
        document.getElementById('result').innerHTML = "Провалено!";
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
    document.querySelector('#pressingTimeSpan').innerText = document.querySelector('#pressingTime').value * 60;
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
        document.querySelector('.cleaner_h10').innerHTML = "Допустимые символы: " + zone0;
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<textarea id="text" name="exercise" rows="10" cols="50" class="required" type="text"\n' +
            '                              minlength="${difficulteLevel1.minLength}" maxlength="${difficulteLevel0.maxLength}"\n' +
            '                                                                  onkeydown="return restrictionOfEnteredCharacters(this,event)"></textarea> <input type="hidden" name="minLength" value="${difficulteLevel0.minLength}"/>\n' +
            '                    <input type="hidden" name="maxLength" value="${difficulteLevel0.maxLength}"/>');
    }
    if (value == 2) {
        document.querySelector('.cleaner_h10').innerHTML = "Допустимые символы: " + zone1;
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<textarea id="text" name="exercise" rows="10" cols="50" class="required" type="text"\n' +
            '                              minlength="${difficulteLevel1.minLength}" maxlength="${difficulteLevel1.maxLength}"\n' +
            '                                                                  onkeydown="return restrictionOfEnteredCharacters(this,event)"></textarea> <input type="hidden" name="minLength" value="${difficulteLevel1.minLength}"/>\n' +
            '                    <input type="hidden" name="maxLength" value="${difficulteLevel1.maxLength}"/>');
    }
    if (value == 3) {
        document.querySelector('.cleaner_h10').innerHTML = "Допустимые символы: " + zone2;
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<textarea id="text" name="exercise" rows="10" cols="50" class="required" type="text"\n' +
            '                              minlength="${difficulteLevel2.minLength}" maxlength="${difficulteLevel2.maxLength}"\n' +
            '                                                                  onkeydown="return restrictionOfEnteredCharacters(this,event)"></textarea> <input type="hidden" name="minLength" value="${difficulteLevel2.minLength}"/>\n' +
            '                    <input type="hidden" name="maxLength" value="${difficulteLevel2.maxLength}"/>');
    }
    if (value == 4) {
        document.querySelector('.cleaner_h10').innerHTML = "Допустимые символы: " + zone3;
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

    var difficultyLevel = document.querySelector('#difficultyLevel').value;
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
    document.querySelector('.required').value = str;

}


//Выбор параметров тренировки
function changeSelect() {
    let exerciseSelection = document.querySelector('.exerciseSelection');
    var select = document.getElementById("difficultyLevel");
    var value = select.value;
    exerciseSelection.innerHTML = '';
    if (value == 1) {
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select style="color: #800080;max-width:250px; font-weight: bold;" id="sel idLevel" id="idLevel" name ="section" ><c:forEach items="${exercisesLevel1}" var="exercise"> <option style="color: #800080; font-weight: bold;" value=" ${exercise.id}">${exercise.exercise}</option> </c:forEach></select>');
    }
    if (value == 2)
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select style="color: #800080;max-width:250px; font-weight: bold;" id="sel idLevel" id="idLevel" name ="section" ><c:forEach items="${exercisesLevel2}" var="exercise"> <option style="color: #800080; font-weight: bold;" value=" ${exercise.id}">${exercise.exercise}</option> </c:forEach></select>');
    if (value == 3)
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select style="color: #800080;max-width:250px; font-weight: bold;" id="sel idLevel" id="idLevel" name ="section" ><c:forEach items="${exercisesLevel3}" var="exercise"> <option style="color: #800080; font-weight: bold;" value=" ${exercise.id}">${exercise.exercise}</option> </c:forEach></select>');
    if (value == 4)
        exerciseSelection.insertAdjacentHTML("afterbegin",
            '<select style="color: #800080;max-width:250px; font-weight: bold;" id="sel idLevel" id="idLevel" name ="section" ><c:forEach items="${exercisesLevel4}" var="exercise"> <option style="color: #800080; font-weight: bold;" value=" ${exercise.id}">${exercise.exercise}</option> </c:forEach></select>');
    let hrefTraining = document.querySelector('.hrefTraining');
    var id = document.getElementById('idLevel');
    var value = id.value;
    //hrefTraining.innerHTML = '';
    var v = ' <a href="/user/training?id=' + id.value + '">Начать тренировку</a><input type="hidden" name="exerciseId" value="' + value + '"/>'.replace();

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

function showExercise(input) {
    let file = input.files[0];
    let reader = new FileReader();
    reader.readAsText(file);

    reader.onload = function () {
        var beg = reader.result.indexOf('id=');
        document.querySelector('#difficultyLevel').selectedIndex = reader.result.substr(beg + 4, 1) - 1;
        beg = reader.result.indexOf('<exercise>');
        var end = reader.result.indexOf('</exercise>');
        document.querySelector('#text').value = reader.result.substr(beg + 10, end - beg - 10);
        console.log(reader.result);
    };

    reader.onerror = function () {
        console.log(reader.error);
    };
}

function initChangeExercise() {
    document.querySelector("#difficultyLevel").selectedIndex = document.querySelector("#myDifficultyLevel").value - 1;
}


let arr_ru = ['а', 'б', 'в', 'г', 'д', 'е', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'э', 'ю', 'я'];

document.onkeydown = function (e) {
    e = e || window.event
    if (e.shiftKey && e.keyCode == 65) {

        for (var i = 0; i < arr_ru.length; i++) {
             document.querySelector('#key'+arr_ru[i]).insertAdjacentHTML("afterbegin", '<img class="gach" src="../../resources/images/gachi'+i+'.jpg"/>');
            //alert(document.querySelector('#key' + arr_ru[i]));

        }
        return true;
    }
}
