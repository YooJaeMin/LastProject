<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.bundle.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#myChart {
	font-family: 나눔고딕;
}
</style>
<script>
var Chart = require('chart.js')

// ES6
import Chart from 'chart.js'
let myChart = new Chart({...})

// Using requirejs
require(['path/to/Chartjs'], function(Chart){
 var myChart = new Chart({...})
})
</script>
<button onclick="shower (1)">2013년</button>
<button onclick="shower (2)">2014년</button>
<button onclick="shower (3)">2015년</button>
<button onclick="shower (4)">ALL</button>

<div id="canvas1" style="width: 30cm; display: none;">
	<canvas id="myChart1"></canvas>
</div>
<div id="canvas2" style="width: 30cm; display: none;">
	<canvas id="myChart2"></canvas>
</div>
<div id="canvas3" style="width: 30cm; display: none">
	<canvas id="myChart3"></canvas>
</div>

<script>
var ctx1 = $("#myChart1");

var data1 = {
	    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월","8월","9월","10월","11월","12월"],
	    datasets: [
	        {
	            label: "냉면",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "blue",
	            borderColor: "blue",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "red",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [65, 59, 80, 81, 56, 55, 40,65, 59, 80, 81, 56],
	            spanGaps: false,
	        },
	        {
	            label: "파스타",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "pink",
	            borderColor: "pink",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "rgba(75,192,192,1)",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [32, 120, 12, 56, 44, 33, 100,32, 120, 12, 56, 44],
	            spanGaps: false,
	        },
	        {
	            label: "갈비",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "red",
	            borderColor: "red",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "rgba(75,192,192,1)",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [55, 95, 18, 28, 65, 44, 14,55, 95, 18, 28, 65],
	            spanGaps: false,
	        },
	        {
	            label: "죽",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "yellow",
	            borderColor: "yellow",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "rgba(75,192,192,1)",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [23, 11, 54, 41, 22, 75, 62,23, 11, 54, 41, 22],
	            spanGaps: false,
	        }
	    ]
	};
var options1 =  {
    scales: {
        yAxes: [{
            ticks: {
                beginAtZero:true
            }
        }]
    }
};

var myLineChart1 = new Chart(ctx1, {
    type: 'line',
    data: data1,
    options: options1
});
</script>
<script>
var ctx2 = $("#myChart2");

var data2 = {
	    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월","8월","9월","10월","11월","12월"],
	    datasets: [
	        {
	            label: "냉면",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "blue",
	            borderColor: "blue",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "red",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [65, 59, 80, 81, 56, 55, 40,65, 59, 80, 81, 56],
	            spanGaps: false,
	        },
	        {
	            label: "파스타",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "pink",
	            borderColor: "pink",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "rgba(75,192,192,1)",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [32, 120, 12, 56, 44, 33, 100,32, 120, 12, 56, 44],
	            spanGaps: false,
	        },
	        {
	            label: "갈비",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "red",
	            borderColor: "red",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "rgba(75,192,192,1)",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [55, 95, 18, 28, 65, 44, 14,55, 95, 18, 28, 65],
	            spanGaps: false,
	        },
	        {
	            label: "죽",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "yellow",
	            borderColor: "yellow",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "rgba(75,192,192,1)",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [23, 11, 54, 41, 22, 75, 62,23, 11, 54, 41, 22],
	            spanGaps: false,
	        }
	    ]
	};
var options2 =  {
    scales: {
        yAxes: [{
            ticks: {
                beginAtZero:true
            }
        }]
    }
};

var myLineChart2 = new Chart(ctx2, {
    type: 'line',
    data: data2,
    options: options2
});
</script>

<script>
var ctx3 = $("#myChart3");

var data3 = {
	    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월","8월","9월","10월","11월","12월"],
	    datasets: [
	        {
	            label: "냉면",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "blue",
	            borderColor: "blue",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "red",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [65, 59, 80, 81, 56, 55, 40,65, 59, 80, 81, 56],
	            spanGaps: false,
	        },
	        {
	            label: "파스타",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "pink",
	            borderColor: "pink",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "rgba(75,192,192,1)",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [32, 120, 12, 56, 44, 33, 100,32, 120, 12, 56, 44],
	            spanGaps: false,
	        },
	        {
	            label: "갈비",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "red",
	            borderColor: "red",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "rgba(75,192,192,1)",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [55, 95, 18, 28, 65, 44, 14,55, 95, 18, 28, 65],
	            spanGaps: false,
	        },
	        {
	            label: "죽",
	            fill: false,
	            lineTension: 0.1,
	            backgroundColor: "yellow",
	            borderColor: "yellow",
	            borderCapStyle: 'butt',
	            borderDash: [],
	            borderDashOffset: 0.0,
	            borderJoinStyle: 'miter',
	            pointBorderColor: "green",
	            pointBackgroundColor: "#fff",
	            pointBorderWidth: 1,
	            pointHoverRadius: 5,
	            pointHoverBackgroundColor: "rgba(75,192,192,1)",
	            pointHoverBorderColor: "rgba(220,220,220,1)",
	            pointHoverBorderWidth: 2,
	            pointRadius: 1,
	            pointHitRadius: 10,
	            data: [23, 11, 54, 41, 22, 75, 62,23, 11, 54, 41, 22],
	            spanGaps: false,
	        }
	    ]
	};
var options3 =  {
    scales: {
        yAxes: [{
            ticks: {
                beginAtZero:true
            }
        }]
    }
};

var myLineChart3 = new Chart(ctx3, {
    type: 'line',
    data: data3,
    options: options3
});
</script>

<script>
	function shower(x){
		if(x==4){
			for(var i =1; i <=3; i++){
				$("#canvas"+i).css("display","");
			}
		} else{
			for(var i =1; i <=3; i++){
			if(i==x){
				$("#canvas"+i).css("display","");
			} else {
				$("#canvas"+i).css("display","none");
			}
		}
		}
	}
</script>
