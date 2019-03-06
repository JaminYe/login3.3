<%--
  Created by IntelliJ IDEA.
  User: Jamin
  Date: 2019/3/5
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>邮件激活</title>
</head>
<script src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<script src="layui/layui.js"></script>
<style>
    body {
        background: url("/img/1.jpg") no-repeat center;
        background-size: 100%, 100%;
    }

    .a {
        border: 5px solid #CBCBCB;
        width: 800px;
        height: 400px;
        margin: auto;
        margin-top: 30px;
        vertical-align: middle;
        background-color: white;
    }

    #bigTure {
        width: 144px;
        height: 120px;
        margin-top: 20px;
        margin-left: 328px;
    }

    #success {
        margin-top: 50px;
    }
    #c {
        margin-top: 70px;
        box-sizing: border-box;
    }

    hr {
        margin-top: 40px;
    }


</style>
<body>
<div class="a">
    <img id="bigTure" src="img/bigTrue.png">
    <div id="success">${realname},恭喜您注册成功,请登录您的注册邮箱:${email}完成账号验证</div>
    <div id="b">邮件没有收到?
        <button id="repeat" class="layui-btn layui-btn-normal">重发验证码</button>
        <span id="sendemail"></span></div>
    <hr>
    <div id="c">
        <div><font face="黑体">还没收到验证邮件?</font>></div>
        <div><font face="华文楷体" size="2px">请确认邮件是否被您提供的邮箱系统自动拦截,或被误以为垃圾邮箱放到垃圾箱了,如果您的邮箱不可用,请您更换邮箱重新注册</font></div>
    </div>
</div>
</body>
<script>
    $('#repeat').on('click', function () {
        var that = $(this);
        var timeo = 60;
        sendemail();
        var timeStop = setInterval(function () {
            timeo--;
            if (timeo > 0) {
                that.text('重新发送' + timeo + 's');
                that.attr('disabled', 'disabled');//禁止点击
            } else {
                timeo = 60;//当减到0时赋值为60
                that.text('获取验证码');
                clearInterval(timeStop);//清除定时器
                that.removeAttr('disabled');//移除属性，可点击
            }
        }, 1000)
    });

    function sendemail() {
        $.ajax({
            url: "SendMailRepeateServlet",
            type: "get",
            dataType: "json",
            success: function (data) {
                var obj = eval("data");
                if (obj.sendMail) {
                    $("#sendemail").append("激活邮件重发成功");
                } else {
                    alert(obj.sendMail);
                    $("#sendemail").append("激活邮件发送失败");
                }
            }
        });
    }
</script>
</html>
