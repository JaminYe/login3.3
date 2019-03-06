package service.impl;

import dao.impl.UserDaoImpl;
import pojo.User;
import util.SendEmail;
import util.UUIDUtil;

/**
 * 处理用户数据的service层接口实现类
 */
public class UserServiceImpl implements service.UserService {
    private UserDaoImpl userDao = new UserDaoImpl();

    /**
     * @param user 前台数据封装成的user对象
     * @return
     */
    @Override
    public Boolean insertUser(User user, String email) {
        user.setCode(UUIDUtil.getUUID());

        int i = userDao.insertUser(user);
        if (i > 0) {
            try {
                SendEmail.sendmail(email, user.getRealname(), user.getCode());
            } catch (Exception e) {
                e.printStackTrace();
            }
            return true;
        }

        return false;
    }

    @Override
    public Boolean queryUserByEmail(String email) {
        if (userDao.queryUserByEmail(email) < 1) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean queryUserByUsername(String username) {
        if (userDao.queryUserByUsername(username) < 1) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean sendEmailrepeat(String realname, String email) {
        String code = userDao.queryUserbyRegisterEmail(email);
        if (null != code) {
            try {
                SendEmail.sendmail(email, realname, code);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return true;
        }else{
            return false;
        }

    }

    @Override
    public Boolean updateCodeByEmail(String code) {
       if (userDao.updateCodeByEmail(code)>0){
           return true;
       }else{
           return false;
       }
    }

}
