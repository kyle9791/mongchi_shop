<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호 변경</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="/css/tiny-slider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../inc/menu.jsp"/>

<div class="hero">
    <div class="container">
        <h1 class="font-apply"><span class="d-block">비밀번호 변경</span></h1>
    </div>
</div>

<div class="center">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center"></div>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="h5 mb-4 text-center"></h3>

                        <form method="post" action="/modifyPassword" >
                            <p><label>새 비밀번호&nbsp;</label><input type="password" name="password"  required ></p>
                            <p><label>새 비밀번호 확인&nbsp;</label><input type="password" name="password2" required></p><span class="passCheck"></span>
                            <p><input name="emailId"  value="${emailId}" hidden="hidden"></p>
                            &nbsp;<button type="submit" value="수정">수정</button>
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

<script>
    document.addEventListener("DOMContentLoaded",function () {
        const p1 = document.querySelector('input[name="password"]');
        const p2 = document.querySelector('input[name="password2"]');
        const e1 = document.querySelector('input[name="emailId"]');
        const c1 = document.querySelector(".passCheck");
        const lowercaseRegex = /[a-z]/;
        const digitRegex = /[0-9]/;

        p1.addEventListener("keyup", function () {


            if (p1.value.length < 8) {
                c1.style.color = "red";
                c1.innerHTML = "비밀번호는 8자 이상이어야 합니다.";
            } else if (!lowercaseRegex.test(p1.value) || !digitRegex.test(p1.value)) {
                c1.style.color = "red";
                c1.innerHTML = "비밀번호는 반드시 영문(소문자)와 숫자를 포함해야 합니다.";
            } else {
                c1.style.color = "green";
                c1.innerHTML = "비밀번호가 유효합니다.";
            }
        });
        p1.addEventListener("focusout", function () {
            const xhr = new XMLHttpRequest();

            xhr.open('GET', './passwordCheck.jsp?emailId=' + e1.value+"&password="+p1.value);
            xhr.send();
            xhr.onreadystatechange = () => {
                if (xhr.readyState !== XMLHttpRequest.DONE) return;

                if (xhr.status === 200) {
                    const json = JSON.parse(xhr.response);
                    if (json.result === 'true') {
                        alert("기존 비밀번호와 동일한 비밀번호입니다.");
                        p1.clear;
                    } else {
                        console.error('Error', xhr.status, xhr.statusText);
                    }

                }
            }
        })
        p2.addEventListener("focusout", function () {
            if (p1.value === "") {
                p1.focus();
                c1.style.color = "red"
                c1.innerHTML = "비밀번호를 입력해 주세요.";
            } else if (p1.value !== p2.value) {
                c1.style.color = "red"
                c1.innerHTML = "비밀번호가 일치하지 않습니다.";
                p1.value = "";
                p2.value = "";
            } else if (p1.value === p2.value) {
                c1.style.color = "green";
                c1.innerHTML = "비밀번호가 일치합니다.";
            }
        });
    });

</script>
</body>
</html>
