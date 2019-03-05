package service.impl;

import dao.impl.UserDaoImpl;
import org.junit.Test;
import pojo.User;

/**
 * 处理用户数据的service层接口实现类
 */
public class UserServiceImpl implements service.UserService {
    private  UserDaoImpl userDao = new UserDaoImpl();
    /**
     *
     * @param user 前台数据封装成的user对象
     * @return
     */
    @Override
    public int insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public Boolean queryUserByEmail(String email) {
        if (userDao.queryUserByEmail(email)<1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public Boolean queryUserByUsername(String username) {
        if (userDao.queryUserByUsername(username)<1){
            return true;
        }else{
            return false;
        }
    }

}
