<%--
  Created by IntelliJ IDEA.
  User: Jamin
  Date: 2019/3/3
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8"/>
    <title>注册</title>
    <style>
        body {
            background: url(img/1.jpg) no-repeat center;
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

        .r {
            float: left;
            /*border: solid;*/
            margin: 15px;
        }

        .r > p:first-child {
            font-size: 20px;
            color: gold;
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
        }

        .r > p:last-child {
            /*border: solid;*/
            font-size: 20px;
            color: gray;
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
        }

        .e {
            float: left;
            /*border: solid;*/
            margin-left: 20px;
            margin-top: 5px;
        }

        .g {
            /*border: solid;*/
            float: right;
            margin: 15px;
        }

        .g a {
            color: pink;
        }

        .f {
            width: 400px;
        }

        .f_text {
            height: 35px;
            text-align: right;
            width: 70px;
        }

        .f_input {
            padding-left: 15px;
        }

        #username,
        #name1,
        #email,
        #birthday,
        #checkcode,
        #tel,
        #password {
            width: 200px;
            height: 20px;
            border: 1px solid gray;
            border-radius: 5px;
        }

        #checkcode {
            width: 100px;
        }

        .img_check {
            vertical-align: middle;
        }

        #td_sub {
            width: 80px;
            height: 40px;
            background-color: gold;
            border: 1px solid gold;
        }
    </style>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<div class="a">
    <div class="r">
        <p>新用户注册</p>
        <p>USER REGISTER</p>
    </div>
    <div class="e">
        <div class="f">
            <form action="" method="get" id="sub">
                <table>
                    <tr>
                        <td class="f_text"><label for="username">用户名:</label></td>
                        <td class="f_input"><input type="text" id="username" name="username" onblur="un()"/>
                            <span id="span_text"></span>

                        </td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="password">密码:</label></td>
                        <td class="f_input"><input type="password" id="password" name="password" onblur="pw()"/>
                            <span id="span_pw"></span></td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="email">Email:</label></td>
                        <td class="f_input"><input type="email" id="email" name="email" onblur="checkEmail()"/>
                            <span id="span_email"></span></td>

                    </tr>

                    <tr>
                        <td class="f_text"><label for="name1">姓名:</label></td>
                        <td class="f_input"><input type="text" id="name1" name="name" onblur="checkname()"/>
                            <span id="span_name"></span></td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="tel">手机号:</label></td>
                        <td class="f_input"><input type="text" id="tel" name="tel" onblur="checktel()"/>
                            <span id="span_tel"></span></td>
                    </tr>

                    <tr>
                        <td class="f_text"><label>性别:</label></td>
                        <td class="f_input"><input type="radio" name="gender" value="boy" checked="checked"/>男
                            <input type="radio" name="gender" value="girl"/>女
                    </tr>
                    </td>
                    <tr>
                        <td class="f_text"><label for="birthday">出生日期:</label></td>
                        <td class="f_input"><input type="text" id="birthday" name="birthday"
                                                   onclick="WdatePicker({dateFmt:'yyyy:MM:dd HH:mm:ss'})"
                                                   onchange="checkbirthday()"/>
                            <span id="span_birthday"></span></td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="checkcode">验证码:</label></td>
                        <td class="f_input"><input type="text" id="checkcode" name="checkcode"
                                                   onblur="checkedcode()"/><img src="img/下载.jpg" width="100px"
                                                                                height="20px" class="img_check">
                    </tr>
                    <span id="span_code"></span>

                    </td>
                    <tr>
                        <td colspan="2" align="center"><input id="td_sub" type="submit" value="注册"/></td>
                    </tr>
                </table>

            </form>

        </div>
    </div>
    <div class="g">
        <span>已有账号?</span>
        <a href="#">直接登录</a>

    </div>
</div>
</body>
<script>
    document.getElementById("sub").onsubmit = function () {
        //				return un() && pw() &&checkEmail()&&checkname()&&checktel() &&checkbirthday()&&checkedcode()
        return checkbirthday()
    }

    function checkedcode() {
        var code = document.getElementById("checkcode");

        if (code.value == "1024") {
            document.getElementById("span_code").innerHTML = "验证成功";
            return true;
        } else {
            document.getElementById("span_code").innerHTML = "验证失败"
            return false;
        }
    }

    function checktel() {

        var tel = document.getElementById("tel");
        var reg = /0?(13|14|15|17|18|19)[0-9]{9}/;
        if (reg.test(tel.value)) {
            document.getElementById("span_tel").innerHTML = "验证成功";
            return true;
        } else {
            document.getElementById("span_tel").innerHTML = "验证失败"
            return false;
        }
    }

    var birthday = document.getElementById("birthday");

    function checkbirthday() {


        if (birthday.value == "") {
            document.getElementById("span_birthday").innerHTML = "验证失败"
            return false;
        } else {

            document.getElementById("span_birthday").innerHTML = "验证成功";
            return true;
        }
    }

    function pw() {
        var pword = document.getElementById("password")
        var reg = /^[1-9]\d*$/;
        if (reg.test(pword.value)) {
            document.getElementById("span_pw").innerHTML = "验证成功";
            return true;
        } else {
            document.getElementById("span_pw").innerHTML = "验证失败"
            return false;
        }
    }

    function un() {
        var uname = document.getElementById("username");
        var reg = /[\u4e00-\u9fa5]/;
        if (reg.test(uname.value)) {
            document.getElementById("span_text").innerHTML = "验证成功";
            return true;
        } else {
            document.getElementById("span_text").innerHTML = "验证失败"
            return false;
        }
    }

    function checkname() {

        var name1 = document.getElementById("name1");

        var reg = /[\u4e00-\u9fa5]/;
        if (reg.test(name1.value)) {
            document.getElementById("span_name").innerHTML = "验证成功";
            return true;
        } else {
            document.getElementById("span_name").innerHTML = "验证失败"
            return false;
        }

    }

    function checkEmail() {

        var email = document.getElementById("email");

        var reg = /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/;
        if (reg.test(email.value)) {
            document.getElementById("span_email").innerHTML = "验证成功";
            return true;
        } else {
            document.getElementById("span_email").innerHTML = "验证失败"
            return false;
        }

    }
</script>

</html>
