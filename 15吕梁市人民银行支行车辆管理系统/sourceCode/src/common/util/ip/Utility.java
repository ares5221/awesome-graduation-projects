package common.util.ip;

import java.io.UnsupportedEncodingException;
import java.util.StringTokenizer;

public class Utility {
	//public static String IP_FILE=(Utils.class.getResource("")+"ip.dat").substring(6);
	public static String IP_FILE="C:/jakarta-tomcat-5.0.28/webapps/design_graduate/WEB-INF/classes/common/util/ip/ip.dat";
	//	 string buffer
    private static StringBuilder stringBuilder = new StringBuilder();
	
	
    public static String getIpStringFromBytes(byte[] ip) {
	    stringBuilder.delete(0, stringBuilder.length());
    	stringBuilder.append(ip[0] & 0xFF);
    	stringBuilder.append('.');   	
    	stringBuilder.append(ip[1] & 0xFF);
    	stringBuilder.append('.');   	
    	stringBuilder.append(ip[2] & 0xFF);
    	stringBuilder.append('.');   	
    	stringBuilder.append(ip[3] & 0xFF);
    	return stringBuilder.toString();
    }
    
    
    public static byte[] getIpByteArrayFromString(String ip) {
        byte[] ret = new byte[4];
        StringTokenizer st = new StringTokenizer(ip, ".");
        try {
            ret[0] = (byte)(Integer.parseInt(st.nextToken()) & 0xFF);
            ret[1] = (byte)(Integer.parseInt(st.nextToken()) & 0xFF);
            ret[2] = (byte)(Integer.parseInt(st.nextToken()) & 0xFF);
            ret[3] = (byte)(Integer.parseInt(st.nextToken()) & 0xFF);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }
    
    public static String getString(String s, String srcEncoding, String destEncoding) {
        try {
            return new String(s.getBytes(srcEncoding), destEncoding);
        } catch (UnsupportedEncodingException e) {
            return s;
        }
    }
   
    public static String getString(byte[] b, int offset, int len, String encoding) {
        try {
            return new String(b, offset, len, encoding);
        } catch (UnsupportedEncodingException e) {
            return new String(b, offset, len);
        }
    }
}
