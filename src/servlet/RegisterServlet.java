package servlet;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String sessioncode = (String) request.getSession().getAttribute("sessioncode");
        Boolean flag;
        if (code.equalsIgnoreCase(sessioncode)) {
            flag = true;
        } else {
            flag = false;
        }
        JSONObject json = new JSONObject();
        json.put("flag", flag);

        PrintWriter out = response.getWriter();
        out.println(json);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
