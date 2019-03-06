package util;

import java.util.UUID;

/**
 * 生成唯一识别码的工具类
 *
 * @author Jamin
 */
public class UUIDUtil {

  public static String getUUID() {
    return UUID.randomUUID().toString().replace("-", "");
  }
}
