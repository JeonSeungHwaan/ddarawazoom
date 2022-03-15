document.addEventListener('DOMContentLoaded', function calendarEvent(eventData) {
		var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      locale: 'ko',
	      navLinks: true, // can click day/week names to navigate views
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	      eventClick: function(arg) {
	    	  console.log(arg);
	    	  
	    	  var title = arg.event.title;
	    	  
	    	  $.ajax({
	    		  type : 'POST',
	    		  url : '/myroom/getClassNum',
	    		  data : { title : title },
	    		  success : function(data){
	    			  console.log(data)
	    			  if(data == 0){
					      alert('해당 강의는 종료되었습니다.');
					  } else {
						  window.location='/ddarawazoom/zclasscontent?num='+data;
					}
	    		  }
	    	  });
	      },	
	      
	      events: getEvent()
	      
	    });

	    calendar.render();
	  });
	