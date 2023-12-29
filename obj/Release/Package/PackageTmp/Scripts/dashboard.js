//Ziyi write this file
// Dong Tian ， Say Ken 请不要使用到其他科的作业中
(function () {
    'use strict'

    feather.replace({ 'aria-hidden': 'true' })

 
    var ctx = document.getElementById('myChart')

    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: [
                'Sunday',
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday'
            ],
            datasets: [{
                data: [
                    20339,
                    19345,
                    16483,
                    17003,
                    23489,
                    24092,
                    16000
                ],
                lineTension: 0,
                backgroundColor: 'transparent',
                borderColor: '#00ff00',
                borderWidth: 4,
                pointBackgroundColor: '#00ff00'
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: false
                    }
                }]
            },
            legend: {
                display: false
            }
        }
    })
})()