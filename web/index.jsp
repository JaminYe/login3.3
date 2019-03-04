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
        #realname,
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
                        <td class="f_input"><input type="text" id="username" name="username" onblur="checkname()" onchange="checkname1()" /></td>
                        <td><span id="span_name"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="password">密码:</label></td>
                        <td class="f_input"><input type="password" id="password" name="password" onblur="checkpassword()"/>
                        </td> <td><span id="span_password"></span>
                    </td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="email">Email:</label></td>
                        <td class="f_input"><input type="email" id="email" name="email" onblur="checkEmail()"/>
                        </td> <td><span id="span_email"></span>
                    </td>

                    </tr>

                    <tr>
                        <td class="f_text"><label for="realname">姓名:</label></td>
                        <td class="f_input"><input type="text" id="realname" name="realname" onblur="checkRealname()"/>
                        </td> <td><span id="span_relname"></span>
                    </td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="tel">手机号:</label></td>
                        <td class="f_input"><input type="text" id="tel" name="tel" onblur="checkTel()" onclick="checkTel()"/>
                        </td> <td><span id="span_tel"></span>
                    </td>
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
                                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'2000-01-01'})"onchange="checkBirthday()"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="checkcode">验证码:</label></td>
                        <td class="f_input"><input type="text" id="checkcode" name="checkcode"
                                                   onblur="checkedcode()"/><img src="img/下载.jpg" width="100px"
                                                                                height="20px" class="img_check">
                    </tr>


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


    var trueimg="<img src=\"img/true.png\" height=\"30px\" width=\"50px\">";
    var falseimg=" <img src=\"img/false.png\" height=\"30px\" width=\"50px\">"
    var falseTel="请输入正确的手机号";
    var falseEmail="请输入正确的email地址"
    //校验用户名
    function checkname() {
        var username = $("#username").val();
        var reg = /^\w{8,20}$/;
        var flag = reg.test(username);
        if (flag) {
            $("#username").css("border", "1px solid grey");

        } else {
            $("#username").css("border", "1px solid red");
        }
        return flag;
    }
        //校验

    function checkname1() {
        if (checkname()){
            $("#span_password").append(trueimg);
        }else{
            $("#span_name").remove();
            $("#span_password").append(falseimg);
            $("#span_password").append("密码不得少于8位,以字母数字组成");
        }
    }



    //校验密码
    function checkpassword() {
        var password = $("#password").val()
        var reg = /^\w{8,20}$/;
        var flag = reg.test(password);
        if (flag) {
            $("#password").css("border", "1px solid grey");
            $("#span_password").append(trueimg);
        } else {
            $("#password").css("border", "1px solid red");
            $("#span_password").append(falseimg);
            $("#span_password").append("密码不得少于8位,以字母数字组成");
        }
        return flag;
    }


    //校验Email地址
    function checkEmail() {
        var email = $("#email").val()
        var reg =/[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
        var flag = reg.test(email);
        if (flag) {
            $("#email").css("border", "1px solid grey");
            $("#span_email").append(trueimg);
        } else {
            $("#email").css("border", "1px solid red");
            $("#span_email").append(falseimg);
            $("#span_email").append("请输入正确的Email地址")
        }
        return flag;
    }

    //校验姓名
    function checkRealname() {
        var realname = $("#realname").val()
        var reg = /[\u4e00-\u9fa5]/;
        var flag = reg.test(realname);
        if (flag) {
            $("#realname").css("border", "1px solid grey");
            $("#span_relname").append(trueimg);
        } else {
            $("#realname").css("border", "1px solid red");
            $("#span_relname").append(falseimg);

        }
        return flag;
    }

    //校验手机号
    function checkTel() {
        var tel = $("#tel").val()
        var reg =/0?(13|14|15|17|18|19)[0-9]{9}/;
        var flag = reg.test(tel);
        if (flag) {
            $("#tel").css("border", "1px solid grey");
            $("#span_tel").append(trueimg);
        } else {
            $("#tel").css("border", "1px solid red");
            $("#span_tel").append(falseimg);
            $("#span_tel").append(falseTel);

        }
        return flag;
    }


    // 校验表单
    $(function () {
        $("#registerform").submit(function () {
            return checkname()&&checkpassword()&&checkEmail()&&checkRealname()&&checkTel();

        })

    });

</script>

</html>
