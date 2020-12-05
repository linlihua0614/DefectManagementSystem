package com.lhlin.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2020/8/8 0008.
 */
public class Common {
    //user session key
    public static final String USER_SESSION = "USER_SESSION";

    public static final String LOGIN_URL="/view/login.jsp";

    public static Date str2Date(String str,String format){
        SimpleDateFormat sdf2 = new SimpleDateFormat(format);
        Date d1 = null;
        try {
            d1 = sdf2.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return d1;
    }

}
