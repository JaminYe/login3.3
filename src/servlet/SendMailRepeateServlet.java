package servlet;

import net.sf.json.JSONObject;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 邮件重发的Servlet
 */
@WebServlet("/SendMailRepeateServlet")
public class SendMailRepeateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        UserServiceImpl userService = new UserServiceImpl();
        //获取注册时的真实姓名用于邮件内容
        String realname = (String) request.getSession().getAttribute("realname");
        //获取发送时的邮箱地址用于邮件发送以及显示
        String email = (String) request.getSession().getAttribute("email");
        //后端邮件是否发送成功
        Boolean flag = userService.sendEmailrepeat(realname, email);
        JSONObject jsonObject = new JSONObject();
        if (flag){
            jsonObject.put("sendMail",flag);
        }else{
            jsonObject.put("sendMail",flag);
        }
        response.getWriter().print(jsonObject);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }
}
