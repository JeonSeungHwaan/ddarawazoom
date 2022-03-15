
function chartData(ctx){
	var amountData = new Array();
	var payData = new Array();
	
	var maxAmount;

	$.ajax({
	  url : "/coachroom/getPayment",
	  type : "post",
	  dataType: "json",
	  success : function(data){

		  for(var key in data){
			  
			  if(data[key] > 0){
				  payData.push(key);
				  
				  amountData.push(data[key]);
			  }
			  
		  }

		  var myChart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: payData,
				datasets: [{
					label: '월별 매출 (단위: 원)',
					fill: false,
					data: amountData,
					lineTension: 0,
					backgroundColor: 'transparent',
					borderWidth: 2,
					borderColor: '#30d185',
					pointBackgroundColor: '#30d185',
					backgroundColor: '#30d185'
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				hoverMode: 'index',
				stacked: false,
				scales: {
					yAxes: [{
							type: 'linear',
							ticks: {
								beginAtZero: true
							}
						}]
					}
				}
			});
	  }
	})


}

$(document).ready(function(){

	// Graphs
	var ctx = document.getElementById('myChart').getContext('2d');
	// eslint-disable-next-line no-unused-vars
	chartData(ctx);
	
  });