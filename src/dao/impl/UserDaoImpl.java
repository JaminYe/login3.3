package dao.impl;

import dao.UserDao;
import org.springframework.jdbc.core.JdbcTemplate;
import util.BaseDao;

/**
 * 处理用户数据的dao层接口实现类
 * @author Jamin
 */
public class UserDaoImpl implements UserDao {
    //创建JdbcTemplate成员变量
   private static JdbcTemplate jdbcTemplate=new JdbcTemplate(BaseDao.getDs());

}
