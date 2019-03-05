package util;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 数据库连接工具类
 *
 * @author Jamin
 */
public class BaseDao {
    /**
     * 静态变量ds
     */
    private static DataSource ds;

    /**
     * 加载配置文件
     */
    static {
        Properties pro = new Properties();
        try {
            pro.load(BaseDao.class.getResourceAsStream("/druid.properties"));
            ds = DruidDataSourceFactory.createDataSource(pro);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 获取连接对象
     *
     * @return 连接对象
     */
    public static DataSource getDs() {
        return ds;
    }

    public static Connection getConn() throws SQLException {
        System.out.println("建立连接");

        return ds.getConnection();
    }


}
