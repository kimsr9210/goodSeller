$(function(){
//      메뉴 나타내기
  	$('#main-navi-img').click(function(){
          var $img = $('#main-menu');
          
          $('#side-menu').css('display','none');
          
          if($img.css('display')=='none'){
              $img.css('display','block');
              $('#contents').css('opacity','0.5');
              $('#footer').css('opacity','0.5');
              $('#tooltiptext-main').css('visibility','hidden');
          }else{
              $img.css('display','none');
              $('#contents').css('opacity','1.0');
              $('#footer').css('opacity','1.0');
          }
      })
//      메뉴 나타내기
      $('#menu-img2').click(function(){
          var $img = $('#side-menu');
          
          $('#main-menu').css('display','none');
          
          if($img.css('display')=='none'){
              $img.css('display','block');
              $('#contents').css('opacity','0.5');
              $('#footer').css('opacity','0.5');
              $('#tooltiptext-side').css('visibility','hidden');
          }else{
              $img.css('display','none');
              $('#contents').css('opacity','1.0');
              $('#footer').css('opacity','1.0');
          }
      });
      
          $('.menu-none').click(function(){
              if(($('#side-menu').css('display')=='block')||($('#main-menu').css('display')=='block')){
                  event.stopPropagation();
                  $('#side-menu').css('display','none');
                  $('#contents').css('opacity','1.0');
                  $('#footer').css('opacity','1.0');
                  $('#main-menu').css('display','none');
                  $('#contents').css('opacity','1.0');
                  $('#footer').css('opacity','1.0');
              }
          });
//          새로고침
          $('#logo-img').click(function(){
              location.reload();
          });
          
          $('#main-navi-img').hover(function(){
              if($('#side-menu').children().css('display')=='block'){
                  $('#tooltiptext-main').css('visibility','hidden');
              }else {
              $('#tooltiptext-main').css('visibility','visible');
              }
          }, function(){
              $('#tooltiptext-main').css('visibility','hidden');
          });
          
          $('#menu-img2').hover(function(){
              if($('#side-menu').children().css('display')=='block'){
                  $('#tooltiptext-side').css('visibility','hidden');
              }else {
              $('#tooltiptext-side').css('visibility','visible');
              }
          }, function(){
              $('#tooltiptext-side').css('visibility','hidden');
          });
          
          $('#login-box').hover(function(){
              $('#tooltiptext-user').css('visibility','visible');
          }, function(){
              $('#tooltiptext-user').css('visibility','hidden');
          });
          
          $('#search-btn').hover(function(){
              $('#tooltiptext-search').css('visibility','visible');
          }, function(){
              $('#tooltiptext-search').css('visibility','hidden');
          });
          
          $('#search-input').focus(function(){
          	$(this).attr('placeholder','');
          });
          
          $('#search-input').focusin(function(){
      	$(this).attr('placeholder','');
	        });
	        $('#search-input').focusout(function(){
	        	$(this).attr('placeholder','  찾고싶은 상품을 검색해주세요!');
	        });
      })