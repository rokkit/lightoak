			        	$(function(){
        		$(".video").click(function(){
        			$('.vid').arcticmodal({
                        closeOnOverlayClick: false,                    
                        overlay: {
                        css: {
                        backgroundColor: '#000',
                        opacity: .7
                        }
                        }
                        });
        		})
        	})
			$(function() {
				// $(".regform_new").hide();
				$(".localemenu").hide();
				
				$(".regform").children("input").click(function(){
					$("html, body").animate({ scrollTop: 790 }, 'slow');
  					return false;
				})
				$(".go_reg").click(function() {
					alert('success');
				})
				
				$('.langlink').click(function(){
					$(".localemenu").toggle();
				});
				
			})
			$(function(){
				$(".search_block").click(function(){
					$(".dark").show();
					$(".seach_content").show();
					$(".dark").animate({
					    opacity: 0.3
					  }, 200 );
					$(".seach_content").animate({
					    opacity: 1
					  }, 200 );
				})
				$(".dark").click(function(){
					$(".dark").animate({
					    opacity: 0
					  }, 200, function(){
					  	$(".dark").hide();
					  } );
					$(".seach_content").animate({
					    opacity: 0
					  }, 200 , function(){
					  	$(".seach_content").hide();
					  } );
				})

				// $('.input_search_text').keypress(function() {
				//   var search = $('.input_search_text').val();
				//   if(search!=""){
				//   	alert(search);
				//   }
				// }).setTimeout(2000);

				var delay = (function(){
				  var timer = 0;
				  return function(callback, ms){
				    clearTimeout (timer);
				    timer = setTimeout(callback, ms);
				  };
				})();

				$('.input_search_text').keypress(function(e) {

				    delay(function(){
				      var search = $('.input_search_text').val();
				    if(search!=""){
				  	  $(".seach_content").html("Результаты поиска в дереве:<br>");
				  	  $(".seach_content").append(search);
				  	  $(".seach_content").append("<br><br>Результаты поиска среди уроков:<br>");
				  	  $(".seach_content").append(search);
				    }
				    }, 1000 );
				});


				
			})
