package dao;

import pojo.User;

/**
 * 处理用户数据的dao层接口
 * @author Jamin
 */
public interface UserDao {
    /**
     * 用户注册
     * @param user 前台数据封装成的user对象
     * @return  数据处理结果
     */
    int insertUser(User user);

    /**
     * 查询邮箱是否已被注册
     * @param email  前台传输邮箱地址
     * @return  查询得到的条数
     */
    Long queryUserByEmail(String email);

    /**
     * 查询用户名是否已被注册
     * @param username   前台传输用户名
     * @return  查询得到的条数
     */
    Long queryUserByUsername(String username);

    /**
     * 通过email查激活码
     * @param email 注册的email
     * @return 激活码
     */
    String queryUserbyRegisterEmail (String email);
}
