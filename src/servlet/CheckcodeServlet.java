package servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/CheckcodeServlet")
public class CheckcodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //定义验证码框的长宽
        int width = 100;
        int height = 50;
        //创建image对象
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        //创建画笔对象
        Graphics graphics = image.getGraphics();
        //设置画笔颜色
        graphics.setColor(Color.white);
        //填充背景
        graphics.fillRect(0, 0, width, height);
        //重新设定画笔颜色
        graphics.setColor(Color.BLUE);
        //画验证码的边框
        graphics.drawRect(0, 0, width - 1, height - 1);
        //将验证码所要显示的内容组成字符串
        String s = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";
        //创建随机数对象
        Random random = new Random();
        //创建颜色数组
        Color[] colors = {Color.red, Color.BLACK, Color.blue, Color.MAGENTA, Color.GREEN};
        //创建builder对象用于组合验证码
        StringBuilder builder = new StringBuilder();
        //for循环画验证码
        for (int i = 1; i <= 4; i++) {
            //每个字母换一个颜色
            graphics.setColor(colors[new Random().nextInt(colors.length)]);
            //随机生成字符串下标
            int index = random.nextInt(s.length());
            //通过字符串下标拿到字符
            char c = s.charAt(index);
            //组合字符串
            builder.append(c);
            //设置验证码的字体
            graphics.setFont(new Font("Comic Sans MS", Font.BOLD, 20));
            //验证码所要摆放的位置
            graphics.drawString(c + "", width / 5 * i, height / 2);
        }

        //for循环画干扰线
        for (int i = 0; i < 10; i++) {
            //设置干扰线颜色
            graphics.setColor(colors[new Random().nextInt(colors.length)]);
            //设置干扰线坐标
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(30);
            int y1 = random.nextInt(30);
            int sin = random.nextBoolean() ? 1 : -1;
            int cos = random.nextBoolean() ? 1 : -1;
            graphics.drawLine(x, y, x + x1 * sin, y + y1 * cos);
        }
        //输出验证码框
        ImageIO.write(image, "jpg", response.getOutputStream());
        //将验证码转为String类型
        String s1 = builder.toString();
        //存放在session中
        request.getSession().setAttribute("sessioncode", s1);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
