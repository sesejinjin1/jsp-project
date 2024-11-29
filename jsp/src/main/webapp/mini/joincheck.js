var isIdChecked = false;

function fnCheck(){
    var form = document.joinForm;
    var id = form.userId.value;
    
    if(id.length <= 4 || id.length >= 16){
        alert("아이디는 5자 이상 16자 미만 입력하세요.");
        form.userId.focus();
        return;
    }
    
    location.href = "id-check.jsp?userId=" + form.userId.value;
    
}

function fnSave(){
    var form = document.joinForm;
    var id = form.userId.value;
    var pwd = form.userPwd.value;
    var pwd2 = form.userPwd2.value;
    var name = form.userName.value;
    var jumin = form.userJumin1.value;
    var jumin2 = form.userJumin2.value;
    var phone = form.userPhone.value;
    var email = form.userEmail1.value;

    if(id == ""){
        alert("아이디를 입력해주세요.");
        form.userId.focus();
        return;
    }

    if(!isIdChecked){
        alert("아이디 중복 체크를 해주세요.");
        form.userId.focus();
        return;
    }

    if(id.length <= 4 || id.length >= 16){
        alert("아이디는 5자 이상 16자 미만 입력하세요.");
        form.userId.focus();
        return;
    }

    if(pwd == ""){
        alert("비밀번호를 입력해주세요.");
        form.userPwd.focus();
        return;
    } else {
        if(pwd.length < 8){
            alert("비밀번호는 8자 이상 입력하세요.");
            form.userPwd.focus();
            return;
        }
    }

    if(pwd2 == ""){
        alert("비밀번호확인을 입력해주세요.");
        form.userPwd2.focus();
        return;
    }

    if(pwd != pwd2){
        alert("입력하신 비밀번호와 비밀번호 확인이 맞지않습니다!");
        form.userPwd2.focus();
        return;
    }

    if(name == ""){
        alert("이름을 입력해주세요.");
        form.userName.focus();
        return;
    }

    if(jumin == ""){
        alert("주민번호를 확인해주세요.");
        form.userJumin1.focus();
        return;
    }

    if(jumin2 == ""){
        alert("주민번호를 확인해주세요.");
        form.userJumin2.focus();
        return;
    }

    if(phone == ""){
        alert("휴대폰 번호를 입력해주세요.");
        form.userPhone.focus();
        return;
    }

    if(email == ""){
        alert("이메일을 입력해주세요.");
        form.userEmail1.focus();
        return;
    }

    form.submit();
}

function fnUpdate(){
    var form = document.joinForm;
    var pwd = form.userPwd.value;
    var pwd2 = form.userPwd2.value;
    var name = form.userName.value;
    var jumin = form.userJumin1.value;
    var jumin2 = form.userJumin2.value;
    var phone = form.userPhone.value;
    var email = form.userEmail1.value;

    if(pwd == ""){
        alert("비밀번호를 입력해주세요.");
        form.userPwd.focus();
        return;
    } else {
        if(pwd.length < 8){
            alert("비밀번호는 8자 이상 입력하세요.");
            form.userPwd.focus();
            return;
        }
    }

    if(pwd2 == ""){
        alert("비밀번호확인을 입력해주세요.");
        form.userPwd2.focus();
        return;
    }

    if(pwd != pwd2){
        alert("입력하신 비밀번호와 비밀번호 확인이 맞지않습니다!");
        form.userPwd2.focus();
        return;
    }

    if(name == ""){
        alert("이름을 입력해주세요.");
        form.userName.focus();
        return;
    }

    if(jumin == ""){
        alert("주민번호를 확인해주세요.");
        form.userJumin1.focus();
        return;
    }

    if(jumin2 == ""){
        alert("주민번호를 확인해주세요.");
        form.userJumin2.focus();
        return;
    }

    if(phone == ""){
        alert("휴대폰 번호를 입력해주세요.");
        form.userPhone.focus();
        return;
    }

    if(email == ""){
        alert("이메일을 입력해주세요.");
        form.userEmail1.focus();
        return;
    }

    form.submit();
}
