window.pace = function () {
    var distanceInput = document.getElementById("distance"),
        hrInput = document.getElementById("hours"),
        minInput = document.getElementById("minutes"),
        secInput = document.getElementById("seconds"),
        paceFS = document.getElementById("pace_field_s"),
        paceFM = document.getElementById("pace_field_m");


    distanceInput.style.borderColor = "initial";
    var dist = parseFloat(distanceInput.value),
        hours = parseFloat(hrInput.value),
        minutes = parseFloat(minInput.value),
        seconds = parseFloat(secInput.value),
        pMin = parseFloat(paceFM.value),
        pSec = parseFloat(paceFS.value);

    calculateP_btn.addEventListener("click", function () {
        if (isNaN(dist)) {
            distanceInput.style.borderColor = "red";
        } else {
            paceFM.value = "";
            paceFS.value = "";

            if (isNaN(hours)) {
                hours = 0;
                hrInput.value = "0";
            }
            if (isNaN(minutes)) {
                minutes = 0;
                minInput.value = "0";
            }
            if (isNaN(seconds)) {
                seconds = 0;
                secInput.value = "0";
            }

            var totalMinutes = hours * 60 + minutes + seconds / 60,
                pace = totalMinutes / dist,
                paceMinutes = Math.floor(pace),
                paceSeconds = Math.round((pace - paceMinutes) * 60);

            if (paceSeconds < 10) {
                paceSeconds = "0" + paceSeconds;
            }
            paceFM.value = paceMinutes;
            paceFS.value = paceSeconds;
            paceMinutes = 0;
            paceSeconds = 0;
        }
    });

    calculateT_btn.addEventListener("click", function () {
        if (isNaN(pMin) || isNaN(pSec)) {
            pSec.style.borderColor = "red";
            pMin.style.borderColor = "red";
        } else {
            hrInput.value = "";
            minInput.value = "";
            secInput.value = "";
            seconds = pSec * dist % 60;
            secInput.value = seconds;
            minutes = pSec * dist / 60;
            minutes += pMin * dist;
            if (minutes > 60) {
                hours = minutes % 60;
                Math.floor(hours);
                hrInput.value = hours;
            }
            minutes %= 60;
            minInput.value = Math.floor(minutes);
        }

    });

    clr_btn.addEventListener("click", function () {
        paceFM.value = "";
        paceFS.value = "";
        distanceInput.value = "";
        hrInput.value = "";
        minInput.value = "";
        secInput.value = "";
    });

}