package pojo;

/**
 * 用户实体类
 *
 * @author Jamin
 */
public class User {

  /**
   * 用户id
   */
  private int userid;
  /**
   * 用户名
   */
  private String username;
  /**
   * 用户密码
   */
  private String password;
  /**
   * 用户邮箱地址
   */
  private String email;
  /**
   * 用户姓名
   */
  private String realname;
  /**
   * 用户手机号
   */
  private String tel;
  /**
   * 用户性别
   */
  private int gender;
  /**
   * 用户出生日期
   */
  private String birthday;
  /**
   * 用户激活状态
   */
  private int activation;
  /**
   * 激活码
   */
  private String code;

  public User() {
  }

  @Override
  public String toString() {
    return "User{"
        + "userid="
        + userid
        + ", username='"
        + username
        + '\''
        + ", password='"
        + password
        + '\''
        + ", email='"
        + email
        + '\''
        + ", realname='"
        + realname
        + '\''
        + ", tel='"
        + tel
        + '\''
        + ", gender="
        + gender
        + ", birthday='"
        + birthday
        + '\''
        + ", activation="
        + activation
        + ", code="
        + code
        + '}';
  }

  public int getUserid() {
    return userid;
  }

  public void setUserid(int userid) {
    this.userid = userid;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getRealname() {
    return realname;
  }

  public void setRealname(String realname) {
    this.realname = realname;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public int getGender() {
    return gender;
  }

  public void setGender(int gender) {
    this.gender = gender;
  }

  public String getBirthday() {
    return birthday;
  }

  public void setBirthday(String birthday) {
    this.birthday = birthday;
  }

  public int getActivation() {
    return activation;
  }

  public void setActivation(int activation) {
    this.activation = activation;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public User(
      int userid,
      String username,
      String password,
      String email,
      String realname,
      String tel,
      int gender,
      String birthday,
      int activation,
      String code) {
    this.userid = userid;
    this.username = username;
    this.password = password;
    this.email = email;
    this.realname = realname;
    this.tel = tel;
    this.gender = gender;
    this.birthday = birthday;
    this.activation = activation;
    this.code = code;
  }
}
