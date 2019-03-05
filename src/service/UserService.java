package service;

import pojo.User;

/**
 * 处理用户数据的service层接口
 * @author Jamin
 */
public interface UserService {
    /**
     * 用户注册
     * @param user 前台数据封装成的user对象
     * @return  数据处理结果
     */
    int insertUser(User user);

    /**
     * 判断dao层传输的User对象是否为空
     * @param email 前端传输的email地址
     * @return  返回是否
     */
    Boolean queryUserByEmail(String email);
    /**
     * 判断dao层传输的User对象是否为空
     * @param username 前端传输的email地址
     * @return  返回是否
     */
    Boolean queryUserByUsername(String username);
}
