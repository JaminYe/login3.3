package servlet;

import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 激活
 */
@WebServlet("/ActiveAccount")
public class ActiveAccount extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserServiceImpl userService = new UserServiceImpl();
        //获取请求中的code码
        String code = request.getParameter("code");
        //先判断code是否为空
        if (null != code) {
            Boolean flag = userService.updateCodeByEmail(code);
            if (flag) {
            response.sendRedirect("Activation.jsp");
            } else {

            }
        }else{

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
