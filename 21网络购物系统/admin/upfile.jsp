<%@ page contentType="text/html;charset=GBK" language="java" import="java.io.*" errorPage="" %>
<html>
<head>
<title>
文件上传
</title>
<style type="text/css">
<!--
td {  font-size: 9pt}
a {  color: #000000; text-decoration: none}
a:hover {  text-decoration: underline}
.tx {  height: 16px; width: 30px; border-color: black black #000000; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; font-size: 9pt; background-color: #eeeeee; color: #0000FF}
.bt {  font-size: 9pt; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; height: 16px; width: 80px; background-color: #eeeeee; cursor: hand}
.tx1 { height: 20px; width: 30px; font-size: 9pt; border: 1px solid; border-color: black black #000000; color: #0000FF}
-->
</style>
</head>

<%
try{
	String path=application.getRealPath(request.getRequestURI());

    int plength=path.length();
    path=path.substring(0,plength-17);
	path=path+"/pic";
	String tempFileName=(String)session.getId();
	File fl=new File(path,tempFileName);
	FileOutputStream o=new FileOutputStream(fl);
	InputStream in=request.getInputStream();
	byte b[]=new byte[1000000];
	int n;
	while((n=in.read(b))!=-1){
		o.write(b,0,n);
	}
	o.close();
	in.close();
	RandomAccessFile random=new RandomAccessFile(fl,"r");
	int second=1;
	String secondLine=null;
	while(second<=14){
		secondLine=random.readLine();
		second++;
	}
	int position=secondLine.lastIndexOf("\\");
	String fileName=secondLine.substring(position+1,secondLine.length()-1);
        int length=fileName.length();
        boolean err=false;
	int jpg=fileName.lastIndexOf(".jpg");
	int gif=fileName.lastIndexOf(".gif");
	int k=fileName.lastIndexOf(".");
	if(jpg>0){if(k!=jpg) err=true;}
	 else if(gif>0){ if(gif!=k) err=true;}
	 else{ err=true;
	 }
    if(err==true)
   {
       random.close();
       fl.delete();
       out.print("不准传非法文件!");
   }else
   { 
	random.seek(0);
	long forthEndPosition=0;
	int forth=1;
	while((n=random.readByte())!=-1&forth<=16){
		if(n=='\n'){
			forthEndPosition=random.getFilePointer();
			forth++;
		}
	}
	File fl2=new File(path,fileName);
    RandomAccessFile random2=new RandomAccessFile(fl2,"rw");

    random.seek(random.length());
	long endPosition=random.getFilePointer();
	long mark=endPosition;
	int j=1;
	while((mark>=0)&(j<=6)){
		mark--;
		random.seek(mark);
		n=random.readByte();
		if(n=='\n'){
			endPosition=random.getFilePointer();
			j++;
		}
	}
	random.seek(forthEndPosition);
	long startPoint=random.getFilePointer();
	while(startPoint<endPosition-1){
		n=random.readByte();
		random2.write(n);
		startPoint=random.getFilePointer();
	}
	random2.close();
	random.close();
	fl.delete();
	out.print("<p>文件成功上传!</p>");
        out.print("<p>图片名称应存为:"+fileName+"</p>");
   }
}
catch(IOException e){
	out.print("文件上传失败!");
}
%>
