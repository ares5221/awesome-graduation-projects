<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="net.fiyu.edit.RemotePic"%>
<jsp:useBean id="date" scope="page" class="net.fiyu.edit.TimeStamp"/>
<%@ page import="net.fiyu.edit.UploadWebHelper,net.fiyu.edit.UploadBean"%>

<%!
// 参数变量
String sType, sStyleName;
//' 设置变量
String sAllowExt, sUploadDir,sBaseUrl,sContentPath;
int  nAllowSize;
//' 接口变量
String sFileExt,sSaveFileName,sOriginalFileName,sPathFileName,FileName, nFileNum;
String sAction;
Connection connect = null;
%>
<%!
/*' ============================================
' 去除Html格式，用于从数据库中取出值填入输入框时
' 注意：value="?"这边一定要用双引号
' ============================================*/
public String inHTML(String str)
{
	String sTemp;
	sTemp = str;
	if(sTemp.equals(""))
	{
		System.exit(0);
	}
	sTemp = sTemp.replaceAll("&", "&amp;");
	sTemp = sTemp.replaceAll("<", "&lt;");
	sTemp = sTemp.replaceAll(">", "&gt;");
	sTemp = sTemp.replaceAll("\"", "&quot;");
	return sTemp;
}
//初始化上传限制数据
public void InitUpload(String realpath){
	UploadWebHelper uw = new UploadWebHelper();
	uw.filename = realpath+"WEB-INF/style.xml";
	uw.getInstance();
	UploadBean bean = uw.InitPara();
	try{

		sUploadDir = bean.getSuploaddir();
        System.out.println(sUploadDir);
		if(sType.equalsIgnoreCase("remote"))
		{
			sAllowExt =  bean.getSremoteext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize =  Integer.parseInt(bean.getSremotesize()) ;
                        System.out.println(sAllowExt+nAllowSize);
		}
                else if(sType.equalsIgnoreCase("file"))
               {
			sAllowExt = bean.getSfileext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSfilesize());
                        System.out.println(sAllowExt+nAllowSize);
               }
               else if(sType.equalsIgnoreCase("media"))
		{
			sAllowExt =  bean.getSmediaext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSmediasize());
                        System.out.println(sAllowExt+nAllowSize);
		}
                else if(sType.equalsIgnoreCase("flash"))
                {
			sAllowExt =  bean.getSflashext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSflashsize());
                        System.out.println(sAllowExt+nAllowSize);
                }
		else
                {
			sAllowExt =  bean.getSimageext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSimagesize());
                        System.out.println(sAllowExt+nAllowSize);
                }
	}
	catch(Exception e){
        }
}
%>
<%
//设置类型
sType=request.getParameter("type");
if(sType==null)
{
sType="image";
}
else
sType=request.getParameter("type").trim();
//设置样式
sStyleName=request.getParameter("style");
if (sStyleName==null)
{
  sStyleName="standard";
}
else
sStyleName=request.getParameter("style").trim();
//设置动作
sAction=request.getParameter("action");
if(sAction==null)
{
  sAction="sun";
}
else
sAction=request.getParameter("action").trim();
%>
<%
//初始化上传变量
InitUpload(config.getServletContext().getRealPath("/"));
//断开数据库连接
//sAction = UCase(Trim(Request.QueryString("action"))
if(sAction.equalsIgnoreCase("remote"))
{    //远程自动获取
	String sContent;
		String RemoteFileurl=null;
	String Protocol,sUrl;
	int Port;
	String LocalFileurl=null;
	String SrcFileurl=null;
	String SaveFileName=null;
	sContent=request.getParameter("eWebEditor_UploadText");
    if(sContent==null || "".equals(sContent))
	{
		sContent="没有内容";
	}
	else
		sContent=new String(request.getParameter("eWebEditor_UploadText").getBytes("iso8859-1"));
	System.out.println();
	System.out.println();
	System.out.println();
	System.out.println();
    System.out.println("替换前的html标记为:"+"\n"+sContent);
	if(sAllowExt!="")
	{
	Pattern pRemoteFileurl = Pattern.compile("((http|https|ftp|rtsp|mms):(//|\\\\){1}(([A-Za-z0-9_-])+[.]){1,}(net|com|cn|org|cc|tv|[0-9]{1,3})(\\S*/)((\\S)+[.]{1}("+sAllowExt+")))");//取得网页上URL的正则表达式
    Matcher mRemoteFileurl = pRemoteFileurl.matcher(sContent);//对传入的字符串进行匹配
	Protocol=request.getProtocol();//取得通讯的协议
	String ProtocolA[]=Protocol.split("/");//取得协议前面的字母，如HTTP/1.1,变为"HTTP","1.1"
	sUrl = ProtocolA[0]+"://"+request.getServerName();//取得本地URL路径,如http://localhost
	//ProtocolA[]=null;
	Port=request.getServerPort();//取得端口值
	if(Port!=80)
	{//查看端口是否为80，如果不是还需要在联接上加上端口
     sUrl=sUrl+":"+Port;
	}
	String context=request.getContextPath();
	sUrl=sUrl+context+"/"+sUploadDir;
	System.out.println(sUrl);
	StringBuffer sb=new StringBuffer();
	boolean result=mRemoteFileurl.find();
	int i=0;

       while(result)
			{

             i++;
             RemoteFileurl=mRemoteFileurl.group(0);
			 /*System.out.println();
			 System.out.println();
			 System.out.println();
			 System.out.println();
			 System.out.println("需要替换的远程连接："+"\n"+RemoteFileurl);
			 */
			 sOriginalFileName=RemoteFileurl.substring(RemoteFileurl.lastIndexOf("/"));
			 Pattern pFileType=Pattern.compile("[.]{1}("+sAllowExt+")");//二次匹配取得文件的类型
			 Matcher mFileType=pFileType.matcher(RemoteFileurl);
			 while(mFileType.find())
				{
				 String SaveFileType=mFileType.group();
				 //修改子路径 2005年7月13号
				 LocalFileurl=context+"/"+sUploadDir+(String)date.Time_Stamp()+i+SaveFileType;//文件的路径，以时间戳命名
				}

			   String LoadFile=sUploadDir.substring(0,sUploadDir.length()-1);	SaveFileName=config.getServletContext().getRealPath("/")+LoadFile+"\\"+LocalFileurl.substring(LocalFileurl.lastIndexOf("/")+1);
			   /*System.out.println();
			   System.out.println();
			   System.out.println();
				System.out.println("远程文件保存的路径和文件名："+"\n"+SaveFileName);
				*/
                sSaveFileName=LocalFileurl.substring(LocalFileurl.lastIndexOf("/"));
                RemotePic Down=new RemotePic();
				Down.picurl=RemoteFileurl;
				Down.savepath=SaveFileName;
             if (Down.download())//如果上载保存成功，则更换html标记里的文件路径
				{
				 mRemoteFileurl.appendReplacement(sb,LocalFileurl);//替换路径
				}
             result=mRemoteFileurl.find();
			}
			mRemoteFileurl.appendTail(sb);
		sContent=sb.toString();
	}
	sContent=inHTML(sContent);
	/*System.out.println();
	System.out.println();
	System.out.println();
	System.out.print("替换后的html标记:"+"\n"+sContent);
	*/
	out.println("<HTML><HEAD><TITLE>远程上传</TITLE><meta http-equiv='Content-Type' content='text/html; charset=gb2312'></head><body>");
	out.print("<input type=hidden id=UploadText value=\"");
	out.print(sContent);
	out.println("\">");
	out.println("</body></html>");
	out.println("<script language=javascript>");
	out.print("parent.setHTML(UploadText.value);try{parent.addUploadFile('");//为什么只取一半的值？且只取复制网页插入位置之前的值？
	out.print(sOriginalFileName);
	out.print("', '");
	out.print(sSaveFileName);
	out.print("', '");
	out.print(SaveFileName);
	out.println("');} catch(e){} parent.remoteUploadOK();");
	out.println("</script>");

  //DoRemote();
}
else if(sAction.equalsIgnoreCase("save"))
{
  //显示上传菜单
 out.println("<HTML>");
        out.println("<HEAD>");
        out.println("<TITLE>文件上传</TITLE>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">");
        out.println("<style type=\"text/css\">");
        out.println("body, a, table, div, span, td, th, input, select{font:9pt;font-family: \"宋体\", Verdana, Arial, Helvetica, sans-serif;}");
        out.println("body {padding:0px;margin:0px}");
        out.println("</style>");
        out.println("<script language=\"JavaScript\" src=\"dialog/dialog.js\">");
        out.println("</script>");
        out.println("</head>");
        out.println("<body bgcolor=menu>");
        out.print("<form action=\"?action=save&type=");//注意此处为什么不用println()
        out.print(sType);
        out.print("&style=");
        out.print(sStyleName);
        out.println("\" method=post name=myform enctype=\"multipart/form-data\">");
        out.println("<input type=file name=uploadfile size=1 style=\"width:100%\" onchange=\"originalfile.value=this.value\">");
        out.println("<input type=hidden name=originalfile value=\"\">");
        out.println("</form>");
        out.println("<script language=javascript>");
        out.print("var sAllowExt = \"");
        out.print(sAllowExt);
        out.println("\";");
        out.println("// 检测上传表单");
        out.println("function CheckUploadForm() {");
        out.println("if (!IsExt(document.myform.uploadfile.value,sAllowExt)){");
        out.println("parent.UploadError(\"提示：\\n\\n请选择一个有效的文件，\\n支持的格式有（\"+sAllowExt+\"）！\");");
        out.println("return false;");
        out.println("}");
        out.println("return true");
        out.println("}");
        out.println("// 提交事件加入检测表单");
        out.println("var oForm = document.myform;");
        out.println("oForm.attachEvent(\"onsubmit\", CheckUploadForm) ;");
        out.println("if (! oForm.submitUpload) oForm.submitUpload = new Array() ;");
        out.println("oForm.submitUpload[oForm.submitUpload.length] = CheckUploadForm ;");
        out.println("if (! oForm.originalSubmit) {");
        out.println("oForm.originalSubmit = oForm.submit ;");
        out.println("oForm.submit = function() {");
        out.println("if (this.submitUpload) {");
        out.println("for (var i = 0 ; i < this.submitUpload.length ; i++) {");
        out.println("this.submitUpload[i]() ;");
        out.println("			}");
        out.println("		}");
        out.println("		this.originalSubmit() ;");
        out.println("	}");
        out.println("}");
        out.println("// 上传表单已装入完成");
        out.println("try {");
        out.println("	parent.UploadLoaded();");
        out.println("}");
        out.println("catch(e){");
        out.println("}");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
  //存文件
  //DoSave();
    SmartUpload up = new SmartUpload();
   //初始化上传组件
     up.initialize(pageContext);
   //设置上传文件大小
     up.setMaxFileSize(nAllowSize*1024);
   //设置上传文件类型
     String setExt=sAllowExt.replace('|',',');
     up.setAllowedFilesList(setExt);
String context=request.getContextPath();
	// Upload
	up.upload();
	// Select each file
	for (int i=0;i<up.getFiles().getCount();i++){
	// Retreive the current file
		com.jspsmart.upload.File myFile = up.getFiles().getFile(i);
		if (!myFile.isMissing()) {
			FileName=(String)date.Time_Stamp();
			sOriginalFileName=myFile.getFileName();
			myFile.saveAs("/"+sUploadDir+FileName+"."+myFile.getFileExt());
			sSaveFileName=FileName+"."+myFile.getFileExt();
			
			//修改子路径 2005年7月13号
			sPathFileName=context+"/"+sUploadDir+sSaveFileName;
			System.out.println(sPathFileName);
		}
	}
   out.println("<script language=javascript>");
	out.print("parent.UploadSaved('");
	out.print(sSaveFileName);
	out.print("','");
	out.print(context);
	out.print("');var obj=parent.dialogArguments.dialogArguments;if (!obj) obj=parent.dialogArguments;try{obj.addUploadFile('");
	out.print(sOriginalFileName);
	out.print("', '");
	out.print(sSaveFileName);
	out.print("', '");
	out.print(sPathFileName);
	out.print("');} catch(e){}");
	out.println(";history.back()</script>");
}
else
{
  //显示上传表单
         out.println("<HTML>");
        out.println("<HEAD>");
        out.println("<TITLE>文件上传</TITLE>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">");
        out.println("<style type=\"text/css\">");
        out.println("body, a, table, div, span, td, th, input, select{font:9pt;font-family: \"宋体\", Verdana, Arial, Helvetica, sans-serif;}");
        out.println("body {padding:0px;margin:0px}");
        out.println("</style>");
        out.println("<script language=\"JavaScript\" src=\"dialog/dialog.js\">");
        out.println("</script>");
        out.println("</head>");
        out.println("<body bgcolor=menu>");
        out.print("<form action=\"?action=save&type=");
        out.print(sType);
        out.print("&style=");
        out.print(sStyleName);
        out.println("\" method=post name=myform enctype=\"multipart/form-data\">");
        out.println("<input type=file name=uploadfile size=1 style=\"width:100%\" onchange=\"originalfile.value=this.value\">");
        out.println("<input type=hidden name=originalfile value=\"\">");
        out.println("</form>");
        out.println("<script language=javascript>");
        out.print("var sAllowExt = \"");
        out.print(sAllowExt);
        out.println("\";");
        out.println("// 检测上传表单");
        out.println("function CheckUploadForm() {");
        out.println("	if (!IsExt(document.myform.uploadfile.value,sAllowExt)){");
        out.println("		parent.UploadError(\"提示：\\n\\n请选择一个有效的文件，\\n支持的格式有（\"+sAllowExt+\"）！\");");
        out.println("		return false;");
        out.println("	}");
        out.println("	return true");
        out.println("}");
        out.println("// 提交事件加入检测表单");
        out.println("var oForm = document.myform ;");
        out.println("oForm.attachEvent(\"onsubmit\", CheckUploadForm) ;");
        out.println("if (! oForm.submitUpload) oForm.submitUpload = new Array() ;");
        out.println("oForm.submitUpload[oForm.submitUpload.length] = CheckUploadForm ;");
        out.println("if (! oForm.originalSubmit) {");
        out.println("	oForm.originalSubmit = oForm.submit ;");
        out.println("	oForm.submit = function() {");
        out.println("		if (this.submitUpload) {");
        out.println("			for (var i = 0 ; i < this.submitUpload.length ; i++) {");
        out.println("				this.submitUpload[i]() ;");
        out.println("			}");
        out.println("		}");
        out.println("		this.originalSubmit() ;");
        out.println("	}");
        out.println("}");
        out.println("// 上传表单已装入完成");
        out.println("try {");
        out.println("	parent.UploadLoaded();");
        out.println("}");
        out.println("catch(e){");
        out.println("}");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
        //out.println("123");

}
%>


