<%--
  Created by IntelliJ IDEA.
  User: Jamin
  Date: 2019/3/3
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="js/jquery-3.3.1.min.js"></script>
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
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<div class="a">
    <div class="r">
        <p>新用户注册</p>
        <p>USER REGISTER</p>
    </div>
    <div class="e">
        <div class="f">
            <form action="" method="get" id="registerform">
                <table>
                    <tr>
                        <td class="f_text"><label for="username">用户名:</label></td>
                        <td class="f_input"><input type="text" id="username" name="username"/>
                            <span id="span_text"></span>

                        </td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="password">密码:</label></td>
                        <td class="f_input"><input type="password" id="password" name="password"/>
                            <span id="span_pw"></span></td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="email">Email:</label></td>
                        <td class="f_input"><input type="email" id="email" name="email"/>
                            <span id="span_email"></span></td>

                    </tr>

                    <tr>
                        <td class="f_text"><label for="name1">姓名:</label></td>
                        <td class="f_input"><input type="text" id="name1" name="name"/>
                            <span id="span_name"></span></td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="tel">手机号:</label></td>
                        <td class="f_input"><input type="text" id="tel" name="tel"/>
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
    //校验用户名
    function checkname() {
        var username = $("#username").val();
        var reg = /^\w{8,20}$/;
        var flag = reg.test(username);
        if (flag) {
            $("#username").css();
        } else {
            $("#username").css("border", "1px solid red");
        }
        return flag;
    }

    // 校验表单
    $(function () {
        $("#registerform").submit(function () {
            return checkname();
        })
        $("#username").blur(checkname());
    });
</script>

</html>
