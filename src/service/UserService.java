package service;

import pojo.User;

/**
 * 处理用户数据的service层接口
 *
 * @author Jamin
 */
public interface UserService {
    /**
     * 判断用户注册是否成功
     *
     * @param user
     * @param email
     * @return
     */
    Boolean insertUser(User user, String email);

    /**
     * 判断dao层传输的User对象是否为空
     *
     * @param email 前端传输的email地址
     * @return 返回是否
     */
    Boolean queryUserByEmail(String email);

    /**
     * 判断dao层传输的User对象是否为空
     *
     * @param username 前端传输的email地址
     * @return 返回是否
     */
    Boolean queryUserByUsername(String username);

    /**
     * 重发邮件
     * @param realname  真实姓名
     * @param email    邮箱地址
     * @return  重发是否成功
     */
    Boolean sendEmailrepeat(String realname,String email);

}
