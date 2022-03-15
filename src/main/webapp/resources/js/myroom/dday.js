	
	// 따라줌과 함께한지 일, 시, 분, 초 
	function ddarawazoom_dday() {
    
	    var getYear = prompt("구하려는 '년도'를 입력하세요.");
	    var getMonth = prompt("구하려는 '월'을 입력하세요.");
	    var getDate = prompt("구하려는 '일'을 입력하세요.");
	    
    	var today = new Date();
	    var dday = new Date(getYear, (getMonth-1), getDate);
	    var toGo = dday - today; 
	    
	    var currSec = 1000; // 밀리세컨
        var currMin = 60 * 1000; // 초 * 밀리세컨
        var currHour = 60 * 60 * 1000; // 분 * 초 * 밀리세컨
        var currDay = 24 * 60 * 60 * 1000; // 시 * 분 * 초 * 밀리세컨
	    
	    var day = parseInt(toGo/currDay); //d-day 일
        var hour = parseInt(toGo/currHour); //d-day 시
        var min = parseInt(toGo/currMin); //d-day 분
        var sec = parseInt(toGo/currSec); //d-day 초
        
        var viewHour = hour-(day*24);
        var viewMin = min-(hour*60);
        var viewSec = sec-(min*60);
        
        // 일, 시, 분, 초 출력
        var viewStr = day+"일 "+viewHour+"시 "+viewMin+"분 "+viewSec+"초";
        
        $("#dday_button").remove();
        $("#dday_start").append('현재 따라와줌과 함께한지');
	    $("#dday_result").append('<span class="ddayColor" id="dday">'+viewStr+'</span>');
	    $("#dday_end").append('되었습니당~^0^!!');
	};
	
	
	// 바디 프로필 디데이 카운트 다운
	function countdown() {
		const getYear = document.getElementById("inputYear").value;
	    const getMonth = document.getElementById("inputMonth").value;
	    const getDate = document.getElementById("inputDate").value;
	    
	    const currentDate = new Date();
	    const newYearDate = new Date(getYear, (getMonth-1), getDate);
	    const totalSeconds = (newYearDate - currentDate) / 1000;
	    
	    const days = Math.floor(totalSeconds / 3600 / 24);
	    const hours = Math.floor(totalSeconds / 3600) % 24;
	    const mins = Math.floor(totalSeconds / 60) % 60;
	    const seconds = Math.floor(totalSeconds) % 60;
	   
	   if (totalSeconds == 0){
		    $("#count>#count_div").remove();
		    $("#body_final").html('바디 프로필 촬영 디데이가 되었습니당~!!');
	   }else{
	   		document.getElementById("days").innerHTML = days;
		    document.getElementById("hours").innerHTML = hours;
		    document.getElementById("mins").innerHTML = mins;
		    document.getElementById("seconds").innerHTML = seconds;
	   }
	   
	   setInterval(countdown, 1000);
	    
	 };	
		
	// 초가 한 자리 수일 때 0을 붙여 자리수를 채워주는 함수
	function formatTime(time) {
		return time < 10 ? '0${time}' : time;
	};
	
	
	
	

