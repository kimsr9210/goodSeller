/**
 * 
 */ 
$(function() {
    var value = $('input[name=method]:checked').val();
    var label = $("#changeMethod");
    $("input[name=method]").click(function() {
        value = $(this).val();
        if(value=='email'){
            label.text("이메일");
            label.next().attr('placeholder','이메일 입력')
            console.log(label.next().attr('placeholder'));
            //console.log(label.text());
        }
        if(value=="phone"){
            //$(this).prev().text('핸드폰');
            label.text("휴대폰 번호");
            label.next().attr('placeholder','- 제외하고 입력')
            console.log(label.next().attr('placeholder'));
            //console.log(label.text());
        }
    });
});