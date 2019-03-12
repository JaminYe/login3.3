package dao.impl;

import dao.UserDao;
import org.springframework.jdbc.core.JdbcTemplate;
import pojo.User;
import util.BaseDao;

import java.sql.Timestamp;

/**
 * 处理用户数据的dao层接口实现类
 *
 * @author Jamin
 */
public class UserDaoImpl implements UserDao {

  // 创建JdbcTemplate成员变量
  private static JdbcTemplate jdbcTemplate = new JdbcTemplate(BaseDao.getDs());

  /**
   * 新增用户
   *
   * @param user 前台数据封装成的user对象
   */
  @Override
  public int insertUser(User user) {
    // 新增用户默认为未激活状态
    String sql = "insert into user_ values(sequence_userid.Nextval,?,?,?,?,?,?,?,?,?)";
    int a =
        jdbcTemplate.update(
            sql,
            user.getUsername(),
            user.getPassword(),
            user.getEmail(),
            user.getRealname(),
            user.getTel(),
            user.getGender(),
            Timestamp.valueOf(user.getBirthday()),
            0,
            user.getCode());
    return a;
  }

  /**
   * 判断邮箱是否唯一
   *
   * @param email 前台传输邮箱地址
   * @return 查询到的数据总数
   */
  @Override
  public Long queryUserByEmail(String email) {
    String sql = "select count(email) from user_ where email=?";
    Long aLong = jdbcTemplate.queryForObject(sql, Long.class, email);
    return aLong;
  }

  /**
   * 验证用户名是否唯一
   *
   * @param username 前台传输用户名
   */
  @Override
  public Long queryUserByUsername(String username) {
    String sql = "select count(username) from user_ where username=?";
    Long aLong = jdbcTemplate.queryForObject(sql, Long.class, username);
    return aLong;
  }

  /**
   * 通过email查激活码
   *
   * @param email 注册的email
   */
  @Override
  public String queryUserbyRegisterEmail(String email) {
    String sql = "select Code from user_ where email=?";
    String code = jdbcTemplate.queryForObject(sql, String.class, email);
    return code;
  }

  /**
   * 通过邮箱更改激活状态
   *
   * @param code 邮箱地址
   */
  @Override
  public int updateCodeByEmail(String code) {
    String sql = "update user_ set activation=1 where code=?";
    int i = jdbcTemplate.update(sql, code);
    return i;
  }
}
