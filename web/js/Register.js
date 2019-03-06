var trueimg = "<img src=\"img/true.png\" height=\"20px\" width=\"20px\">";
var falseimg = " <img src=\"img/false.png\" height=\"20px\" width=\"20px\">";
var tipname = "<font size='1px'>用户名不得少于8位,以字母数字组成</font>";
var tippassword = "<font size='1px'>密码不得少于8位,以字母数字组成</font>";
var tipEmail = "<font size='1px'>请输入正确的Email地址</font>"
var tipTel = "<font size='1px'>请输入正确的手机号</font>"
var tiprealname = "<font size='1px'>请输入正确的姓名</font>"
var account = "<font size='1px'>已被注册</font>"

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

//追加显示
function checkname1() {
    if (checkname()) {
        $("#span_name").empty();
        $.ajax({
            url: "CheckUsernameServlet",
            type: "get",
            data: {"username": $("#username").val()},
            dataType: "json",
            success: function (data) {
                var obj = eval("data");
                if (obj.flag) {
                    $("#span_name").append(trueimg);
                } else {
                    $("#span_name").append(falseimg);
                    $("#span_name").append(account);
                }
            }
        })
    } else {
        $("#span_name").empty();
        $("#span_name").append(falseimg);
        $("#span_name").append(tipname);
    }
}


//校验密码
function checkpassword() {
    var password = $("#password").val()
    var reg = /^\w{8,20}$/;
    var flag = reg.test(password);
    if (flag) {
        $("#password").css("border", "1px solid grey");

    } else {
        $("#password").css("border", "1px solid red");
    }
    return flag;
}

//追加显示
function checkpassword1() {
    if (checkpassword()) {
        $("#span_password").empty();
        $("#span_password").append(trueimg);
    } else {
        $("#span_password").empty();
        $("#span_password").append(falseimg);
        $("#span_password").append(tippassword);
    }
}

//校验Email地址
function checkEmail() {
    var email = $("#email").val()
    var reg = /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
    var flag = reg.test(email);
    if (flag) {
        $("#email").css("border", "1px solid grey");

    } else {
        $("#email").css("border", "1px solid red");
    }
    return flag;
}

//追加显示
function checkemail1() {
    if (checkEmail()) {
        $("#span_email").empty();
        $.ajax({
            url: "CheckEmailServlet",
            type: "get",
            data: {"email": $("#email").val()},
            dataType: "json",
            success: function (data) {
                var obj = eval("data");
                if (obj.flag) {
                    $("#span_email").append(trueimg);
                } else {
                    $("#span_email").append(falseimg);
                    $("#span_email").append(account);
                }
            }
        })
    } else {
        $("#span_email").empty();
        $("#span_email").append(falseimg);
        $("#span_email").append(tipEmail);
    }
}

//校验姓名
function checkRealname() {
    var realname = $("#realname").val()
    var reg = /[\u4e00-\u9fa5]/;
    var flag = reg.test(realname);
    if (flag) {
        $("#realname").css("border", "1px solid grey");
    } else {
        $("#realname").css("border", "1px solid red");

    }
    return flag;
}

//追加显示
function checkrealname1() {
    if (checkRealname()) {
        $("#span_realname").empty();
        $("#span_realname").append(trueimg);
    } else {
        $("#span_realname").empty();
        $("#span_realname").append(falseimg);
        $("#span_realname").append(tiprealname);
    }
}


//校验手机号
function checkTel() {
    var tel = $("#tel").val()
    var reg = /0?(13|14|15|17|18|19)[0-9]{9}/;
    var flag = reg.test(tel);
    if (flag) {
        $("#tel").css("border", "1px solid grey");
    } else {
        $("#tel").css("border", "1px solid red");

    }
    return flag;
}

//追加显示
function checkTel1() {
    if (checkTel()) {
        $("#span_tel").empty();
        $("#span_tel").append(trueimg);
    } else {
        $("#span_tel").empty();
        $("#span_tel").append(falseimg);
        $("#span_tel").append(tipTel);
    }
}

//刷新验证码
function Refreshcode() {
    var code = document.getElementById("code");
    var date = new Date().getTime();
    code.src = "/CheckcodeServlet?" + date;
}

//当鼠标失去焦点时,使用ajax异步加载,将输入框的值传走
function checkcode() {
    $.ajax({
        url: "TestcheckcodeServlet",
        type: "get",
        data: {"code": $("#yanzhengma").val()},
        dataType: "json",
        success: function (data) {
            var obj = eval("data");
            if (obj.flag) {
                $("#yanzhengma").css("border", "1px solid grey");
            } else {
                $("#yanzhengma").css("border", "1px solid red");
            }
        }

    })
}

// 校验表单
$(function () {
    $("#registerform").submit(function () {
        return checkname() && checkpassword() && checkEmail() && checkRealname() && checkTel() && $("#birthday").val() != ""&&checkcode();

    });

});
