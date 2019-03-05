package servlet;

import org.apache.commons.beanutils.BeanUtils;
import pojo.User;
import service.impl.UserServiceImpl;
import util.SendEmail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // 设置响应编码
    response.setCharacterEncoding("utf-8");
    // userService的对象
    UserServiceImpl userService = new UserServiceImpl();

    // 创建user对象用于存放user属性
    User user = new User();
    // 获取前端的值封装成map集合
    Map<String, String[]> map = request.getParameterMap();
    // 单独获取邮箱地址与用户名
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    // 获取的map集合封装成javabean
    try {
      BeanUtils.populate(user, map);
    } catch (InvocationTargetException e) {
      e.printStackTrace();
    } catch (IllegalAccessException e) {
      e.printStackTrace();
    }
    // 调用service方法返回执行结果
    int i = userService.insertUser(user);
    // 判断是否新增成功
    if (i != 0) {
      try {
        SendEmail.sendmail(email, username, "aaaa");
      } catch (Exception e) {
        e.printStackTrace();
      }
    } else {

    }
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    this.doPost(request, response);
  }
}
