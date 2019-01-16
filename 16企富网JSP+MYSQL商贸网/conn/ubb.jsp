<%@ page import="java.util.regex.*" %>
<%!
public class checkData{	

	/** 传入的需要匹配的参数 */
    String s = null;
	/** Pattern 类型的 p */
	Pattern p;
	/** Matcher 类型的 m */
	Matcher m;

//////////////////
   String u_s = new String("haha");
   String u_s1 = new String("haha");
   Pattern u_p;
   Matcher u_m;
   CharSequence u_s2;
   boolean result;
///////////////////
	//构造函数
	checkData(String ins){
		this.s = ins;
	}

	public void setS(String ins){
		this.s = ins;
	}

	public String getS(){
		return this.s;
	}

	/**
	---->检测Email是否正确
	*/
    //返回值:布尔值(boolean)
	public boolean checkMail(){
		if(this.s.equals("")) return false;
		try{
        p = Pattern.compile("^[a-z_\\-0-9]+\\@[a-z_\\.\\-0-9]+$",Pattern.CASE_INSENSITIVE);
		m = p.matcher(this.s);
		return m.matches();
		}
		catch(Exception e){return false;}
	}
    
	/**
	---->检测处理用户输入的用户名是否合法
	*/
	//	返回值:布尔值(boolean)
    public boolean checkNick(){
		if(this.s.equals("")) return false;
		try{
			p = Pattern.compile("^[^\\|\\@!|#|\\$|%|\\^|&|*|\\(|\\)|,|;|:|\"|'|\\.|\\?|<|>|\\/|\\+|=|\\]|\\[|\\{|\\}]+?$",Pattern.CASE_INSENSITIVE);
			m = p.matcher(this.s);
			return m.matches();
		}
		catch(Exception e){return false;}
	}

	/**
	---->检测输入的网址是否合法
	*/
	//	返回值:布尔值(boolean)
    public boolean checkUrl(){
		if(this.s.equals("")) return false;
		try{
			p = Pattern.compile("^(http:\\/\\/)|(www\\.)[{1}a-z_\\-0-9\\.\\/]+$",Pattern.CASE_INSENSITIVE);
			m = p.matcher(this.s);
			return m.matches();
		}
		catch(Exception e){return false;}
	}

   /**
   ----->处理一些特殊字符
   */
   //返回值:字符串(String)
    public String killHtml(boolean t){
    	if(t) s = s.trim();
    	s = s.replaceAll("<","&lt;");
    	s = s.replaceAll(">","&gt;");
    	s = s.replaceAll("  ","&nbsp;&nbsp;");
    	s = s.replaceAll("#_#","#__#");
    	s = s.replaceAll("\n","<br>");
    	s = s.replaceAll("<!--newLine-->","");
    	return s;
	}

	public String formatHtml(boolean t){
    	if(t) s = s.trim();
    	s = s.replaceAll("<","&lt;");
    	s = s.replaceAll(">","&gt;");
    	s = s.replaceAll("  ","&nbsp;&nbsp;");
    	s = s.replaceAll("#_#","#__#");
    	s = s.replaceAll("\n","<br>");
    	s = s.replaceAll("<!--newLine-->","");
    	return s;
	}
}
%>