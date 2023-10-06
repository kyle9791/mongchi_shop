<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="/css/tiny-slider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>

<body>
<jsp:include page="../inc/menu.jsp"/>

<div class="hero">
    <div class="container">
        <h1 class="font-apply"><span class="d-block">회원가입</span></h1>
    </div>
</div>

<div class="center">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center"></div>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="h5 mb-4 text-center"></h3>

                        <form action="/addMember" method="post">
                            <p><label>이메일&nbsp;</label><input type="email" name="emailId"></p><span class="memberEmailCheck"></span>
                            <p><label>비밀번호&nbsp;</label><input type="password" name="password"></p>
                            <p><label>비밀번호 확인&nbsp;</label><input type="password" name="password2"></p><span class="passCheck"></span>
                           <p><label>이름&nbsp;</label><input type="text" name="memberName"></p>
                            <p><label>전화번호&nbsp;</label><input type="text" name="phone"></p>
                            <p><label>생일&nbsp;</label><input type="date" name="birthday"></p>
                            <button type="submit">회원 가입</button>
                        </form>

                </div>
            </div>
        </div>
    </section>
</div>

<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/tiny-slider.js"></script>
<script src="/js/custom.js"></script>

<jsp:include page="../inc/footer.jsp"/>
</body>
<script>


    document.addEventListener("DOMContentLoaded", function () {
        const p1 = document.querySelector('input[name="password"]');
        const p2 = document.querySelector('input[name="password2"]');
        const c1 = document.querySelector(".passCheck");
        const lowercaseRegex = /[a-z]/;
        const digitRegex = /[0-9]/;

        p1.addEventListener("keyup", function () {
            if (p1.value.length < 8) {
                c1.style.color = "red"
                c1.innerHTML = "비밀번호는 8자 이상이어야 합니다.";
            } else if (!lowercaseRegex.test(p1.value) || !digitRegex.test(p1.value)) {
                c1.style.color = "red"
                c1.innerHTML = "비밀번호는 반드시 영문(소문자)와 숫자를 포함해야 합니다.";
            } else {
                c1.style.color = "green"
                c1.innerHTML = "비밀번호가 유효합니다.";
            }
        });



        const xhr = new XMLHttpRequest();
        const emailId = document.querySelector('input[name=emailId]');
        emailId.addEventListener('keyup',function () {
            const emailIdval = emailId.value;
            const memberEmailCheck = document.querySelector('.memberEmailCheck'); //결과문자열
            xhr.open('GET','./ajaxIdCheck.jsp?emailId='+emailIdval );
            xhr.send();
            xhr.onreadystatechange = () => {
                if(xhr.readyState !== XMLHttpRequest.DONE) return;

                if(xhr.status === 200) {
                    const json = JSON.parse(xhr.response);
                    if(json.result === 'true') {
                        memberEmailCheck.style.color = 'red';
                        memberEmailCheck.innerHTML = '동일한 아이디가 있습니다!';
                    }
                    else {
                        memberEmailCheck.style.color = 'gray';
                        memberEmailCheck.innerHTML = '동일한 아이디가 없습니다.'
                    }
                }
                else {
                    console.error('Error',xhr.status,xhr.statusText);
                }
            }
        });
    });
</script>
</html>
