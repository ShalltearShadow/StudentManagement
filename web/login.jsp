<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">

    <title>登录页面</title>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <script type="text/javascript">
        function reImg() {
            var img = document.getElementById("Img");
            img.src = "verify.jsp?" + Math.random();
        }
    </script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
    <script type="text/javascript">
        function ajaxf() {
            var radio = document.getElementsByName("item");
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var vli =document.getElementById("vli").value;
            var login;
            for (i=0; i<radio.length; i++) {
                if (radio[i].checked) {
                    login = radio[i].value;
                }
            }
            $.post({
                type: "post",
                url: "${pageContext.request.contextPath}/AllLoginServlet",
                // contentType:"application/json",
                data: {"username":username,"password":password,"vlidata":vli,"login":login},
                success: function (data) {
                    var name = document.getElementById("username");
                    var passwd = document.getElementById("password");
                    var vli = document.getElementById("vli");
                    var s = data.toString();

                    if(name.value==null||name.value==""){
                        name.focus();
                        alert("账号不能为空！！！");
                    }else if (passwd.value==null||passwd.value==""){
                        passwd.focus();
                        alert("密码不能为空！！！");
                    } else if (vli.value==null||vli.value==""){
                        vli.focus();
                        alert("验证码不能为空！！！");
                    } else if (s.trim()=="vli".trim()){
                        alert("验证码错误！！！");
                        reImg();
                    }else if (s.trim()=="np".trim()){
                        alert("账号或密码错误！！！");
                        reImg();
                    }else {
                        if (s.trim()=="stu".trim()) {
                            window.location.href = "studentindex.jsp";
                        }else if (s.trim()=="tea".trim()){
                            window.location.href = "teacherindex.jsp";
                        }else if (s.trim()=="guan".trim()){
                            window.location.href = "manageindex.jsp";
                        }
                    }
                }
            });
        }
    </script>
</head>
<body>



<form  id="form" method="post">

    <div class="dowebok">
        <div class="menu">
            <div>
                <input id="item1" type="radio" name="item" value="stu" checked>
                <label for="item1"></label>
                <span>&nbsp;学生</span>
            </div>
            <div>
                <input id="item2" type="radio" name="item" value="tea">
                <label for="item2"></label>
                <span>&nbsp;教师</span>
            </div>
            <div>
                <input id="item3" type="radio" name="item" value="guan">
                <label for="item3"></label>
                <span>&nbsp;管理员</span>
            </div>
        </div>
        <div class="logo"></div>
        <div class="form-item">
            <input id="username"  width="360px" type="text" name="username" placeholder="账号" />
        </div>
        <div class="form-item">
            <input id="password" type="password" name="password" placeholder="密码" />
        </div>

        <div  class="vlidate">
            <span>验证码</span>
            <input id="vli" type="text" name="verify" maxlength="4" />
            <img border=0 style="padding-left:0.5em"
                 id="Img" src="verify.jsp" alt="验证码" onclick="reImg()" title="点击更换图片">
        </div>
        <div class="form-submit" style="text-align: center;margin-top: 30px;"><input type="button" onclick="ajaxf()" value = "登录"></div>
    </div>
</form>
</body>
</html>