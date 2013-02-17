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
			    $(".localemenu").hide();
				
				$(".regform").children("input").click(function(){
					$(".authform ").hide();
					$(".regform_new").show();
				})
				$(".go_reg").click(function() {
					$(".regform_new").hide();
					$(".authform ").show();
				})
				
				$('.langlink').click(function(){
					$(".localemenu").toggle();
				});
				
			})
