package com.htcf.util;

import java.io.IOException;
public class Base64Util {

    /**
    	 *
    	Description :Base64编码
    	@Author：hj
    	@Create 2017-9-27 16:19
    	 */
    public static String encode(byte[] bstr){
        return new sun.misc.BASE64Encoder().encode(bstr);
    }

    /**
     *
     Description :Base64解码
     @Author：hj
     @Create 2017-9-27 16:19
     */
    public static byte[] decode(String str){
        byte[] bt = null;
        try {
            sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
            bt = decoder.decodeBuffer( str );
        } catch (IOException e) {
            e.printStackTrace();
        }

        return bt;
    }

    /**
     * @param args
     */
    public static void main(String[] args) {

        Base64Util base= new Base64Util();
        String aa = "{mmsi:\"000000005,000000006\"}";
        aa = base.encode(aa.getBytes());
        System.out.println("----aa:"+aa);
        String str = aa;
        String str2 = new String(base.decode(str));
        System.out.println("-----str2:"+str2);
    }
}