package servlet;

import net.sf.json.JSONObject;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CheckUsernameServlet")
public class CheckUsernameServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String username = request.getParameter("username");
    JSONObject jsonObject = new JSONObject();
    UserServiceImpl userService = new UserServiceImpl();
    Boolean flag = userService.queryUserByUsername(username);
    jsonObject.put("flag", flag);
    response.getWriter().print(jsonObject);
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    this.doPost(request, response);
  }
}
