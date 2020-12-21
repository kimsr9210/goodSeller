$(function(){
            $('#category-main').change(function(){
               var $text = $('#category-main').val();
                console.log($('#category-main').children().val());
                if($text=="의류 브랜드 패션"){
                    $('#category-sub').html( "<option>티셔츠</option>"+
                            				"<option>바지</option>"+
                                            "<option>아우터</option>"+
                                            "<option>가방</option>"+
                                            "<option>신발</option>");
                }else if($text=="생활 건강"){
                    $('#category-sub').html("<option>인테리어 용품</option>"+
                                            "<option>수납 용품</option>"+
                                            "<option>주방 용품</option>"+
                                            "<option>세탁 용품</option>"+
                                            "<option>욕실 용품</option>");
                }else if($text=="가구 가전"){
                    $('#category-sub').html("<option>수납 가구</option>"+
                            				"<option>거실 가구</option>"+
				                            "<option>침실 가구</option>"+
				                            "<option>TV</option>"+
				                            "<option>냉장고</option>"+
				                            "<option>에어컨</option>"+
				                            "<option>스타일러</option>");
                }else if($text=="디지털 컴퓨터"){
                    $('#category-sub').html("<option>카메라</option>"+
				                            "<option>음향기기</option>"+
				                            "<option>게임</option>"+
				                            "<option>핸드폰</option>"+
				                            "<option>태블릿</option>"+
				                            "<option>컴퓨터</option>");
                }else if($text=="도서 문구"){
                    $('#category-sub').html("<option>입문/문학</option>"+
				                            "<option>교육/참고서</option>"+
				                            "<option>어린이도서</option>"+
				                            "<option>장난감</option>"+
				                            "<option>피규어</option>"+
				                            "<option>사무용품</option>");
                }else if($text=="뷰티 잡화"){
                    $('#category-sub').html("<option>화장품/향수</option>"+
				                            "<option>바디/헤어</option>"+
				                            "<option>패션잡화</option>"+
				                            "<option>쥬얼리/시계/선글라스</option>");
                }else if($text=="스포츠 레저"){
                    $('#category-sub').html("<option>골프</option>"+
				                            "<option>스키/보드</option>"+
				                            "<option>수영/수상레저</option>"+
				                            "<option>구기/라켓</option>"+
				                            "<option>헬스/요가/필라테스</option>");
                }
            });     
    /*사진미리보기*/
        var sel_file;
        var $img_path;
           $(document).ready(function(){
               $('.file-upload').on('change', handleImgFileSelect);
           });
            $('.file-upload').click(function(){
                $img_path = $(this);
                console.log($img_path);
            })
            function handleImgFileSelect(e){
                var files = e.target.files;
                var filesArr = Array.prototype.slice.call(files);
                
                filesArr.forEach(function(f){
                    if(!f.type.match('image.*')){
                        alert("확장자는 이미지 확장자만 가능합니다.");
                        return;
                    }
                    
                    sel_file = f;
                    
                    var reader = new FileReader();
                    reader.onload = function(e){
                        $img_path.prev().prev().attr('src', e.target.result);
                    }
                    reader.readAsDataURL(f);
                })
            }
    
    $('form').submit(function(){
        var subject = $('#subject').val();
        var file = $('#mainImg').val();
        var startPrice = $('#startPrice').val();
        var buyPrice = $('#buyPrice').val();
        var method = $('#trans-method').val();
        var category = $('#category-main').val();
        var content = $('#content').val();
        if(subject==""){
            alert('제목을 입력해주세요');
            return false;
        }else if(file==""){
            alert('메인사진을 선택해주세요');
            return false;
        }else if(startPrice==""){
            alert('시작 금액을 설정해주세요');
            return false;
        }else if(buyPrice==""){
            alert('즉시 구매 금액을 설정해주세요');
            return false;
        }else if(method=="------선택------"){
            alert('거래 방식을 선택해주세요');
            return false;
        }else if(category=="------선택------"){
            alert('카테고리를 선택해주세요');
            return false;
        }else if(content==""){
            alert('상세 내용을 입력해주세요');
            return false;
        }
        return true;
    });
});
            

        
        
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