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
 * 验证电子邮箱是否重复
 */
@WebServlet("/CheckEmailServlet")
public class CheckEmailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        UserServiceImpl userService = new UserServiceImpl();
        Boolean flag = userService.queryUserByEmail(email);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("flag",flag);
        response.getWriter().print(jsonObject);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
