/**
 * 
 */
$(function(){
            $('#category-main').change(function(){
               var $text = $('#category-main').val();
                console.log($('#category-main').children().val());
                console.log($text);
                if($text=="의류 브랜드 패션"){
                    $('#category-sub').html( "<option>상의</option>"+
                                            "<option>아우터</option>"+
                                            "<option>원피스</option>"+
                                            "<option>바지</option>"+
                                            "<option>스커트</option>"+
                                            "<option>가방</option>"+
                                            "<option>신발</option>"+
                                            "<option>안경</option>"+
                                            "<option>속옷</option>"+
                                            "<option>악세사리</option>");
                }else if($text="디지털 컴퓨터"){
                    $('#category-sub').html("<option>카메라</option>"+
                                            "<option>음향기기</option>"+
                                            "<option>게임</option>"+
                                            "<option>핸드폰</option>"+
                                            "<option>태블릿</option>"+
                                            "<option>컴퓨터</option>");
                }
            })
        })
        
        
        /* 콤마 만들어주기 (넘겨주는 값도 콤마로 넘어가서 form에서 넘어간 값 바꿔줘야함)*/
        function f_setCommaValue(el){
           var value = f_getOnlyNum(el);
           var temp = '';
           var idx = value.length % 3;
           if(idx>0 && value.length > 3){
               temp = value.substring(0, idx) + ',';
               value = value.substring(idx);
           }


           for(i=(value.length/3) - 1; i>0; i--){
               temp += value.substring(0, 3) + ',';
               value = value.substring(3); 
           }
           temp += value;
           el.value = temp;
       }
        
        // 숫자만 반환
       function f_getOnlyNum(el){
           var value = el.value;
           if(value.trim().length == 0){
               value = '0';
        }
           value = value.replaceAll(',', '');
           value = parseInt(value, 10).toString();
           return value;
       }

      

       //숫자만 입력
       function f_onlyNum(){
           var key = event.keyCode;
           var messageArea = document.getElementById("ssnMessage");
           if(!(key==8||key==9||key==13||key==46||key==144||(key>=48&&key<=57)||key==110||key==190)){
               alert('숫자만 입력 가능합니다');
               event.returnValue = false;
           }
       }