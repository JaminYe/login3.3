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
    <link rel="stylesheet" href="css/register.css">
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
</head>

<body>
<div class="a">
    <div class="r">
        <p>新用户注册</p>
        <p>USER REGISTER</p>
    </div>
    <div class="e">
        <div class="f">
            <form action="/RegisterServlet" method="get" id="registerform">
                <table>
                    <tr>
                        <td class="f_text"><label for="username">用户名:</label></td>
                        <td class="f_input"><input type="text" id="username" name="username" onblur="checkname1()"
                                                   onchange="checkname()"/></td>
                        <td><span id="span_name"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="f_text"><label for="password">密码:</label></td>
                        <td class="f_input"><input type="password" id="password" name="password"
                                                   onblur="checkpassword1()" onchange="checkpassword()"/>
                        </td>
                        <td><span id="span_password"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="f_text"><label for="email">Email:</label></td>
                        <td class="f_input"><input type="email" id="email" name="email" onblur="checkemail1()"
                                                   onchange="checkEmail()"/>
                        </td>
                        <td><span id="span_email"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="f_text"><label for="realname">姓名:</label></td>
                        <td class="f_input"><input type="text" id="realname" name="realname" onblur="checkRealname1()"
                                                   onchange="checkrealname()"/>
                        </td>
                        <td><span id="span_realname"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="f_text"><label for="tel">手机号:</label></td>
                        <td class="f_input"><input type="text" id="tel" name="tel" onblur="checkTel1()"
                                                   onchange="checkTel()">
                        </td>
                        <td><span id="span_tel"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="f_text"><label>性别:</label></td>
                        <td class="f_input"><input type="radio" name="gender" value="0" checked="checked"/>男
                            <input type="radio" name="gender" value="1"/>女
                    </tr>
                    </td>
                    <tr>
                        <td class="f_text"><label for="birthday">出生日期:</label></td>
                        <td class="f_input"><input type="text" id="birthday" name="birthday"
                                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'2000-01-01 00:00:00'})"
                        />
                        </td>
                    </tr>

                    <tr>
                        <td class="f_text"><label for="yanzhengma">验证码:</label></td>
                        <td class="f_input"><input type="text" id="yanzhengma" name="yanzhengma" onblur="checkcode()"/>
                            <img id="code" src="/CheckcodeServlet" onclick="Refreshcode()"></td>
                    </tr>
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
</html>
