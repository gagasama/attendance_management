$(function(){
  $("#clock_in_button").click(function(){

    $.post(
      '/user/clock_in',
      {'datetime': String(new Date())},

      function(data){ 

	time = new Date(Date.parse(data.time))
        formated_time = time.getHours() + "時" + time.getMinutes() + "分" + time.getSeconds() + "秒"
        $("#clock_in_button").replaceWith(formated_time)
	
      }  
    );
  
  });

});

