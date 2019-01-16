<jsp:useBean id="email" class="beanMailer.SMTPBean"/>

<%
String from,to,subject,message;
    try
    { 
    from = request.getParameterValues("from")[0];
    to = request.getParameterValues("to")[0];
    subject = request.getParameterValues("subject")[0];
    message = request.getParameterValues("message")[0];
    }
    catch (Exception e)
    {
    out.println("You have to use the Form to send email from here.");
    out.println ("Click <A href= \"index.jsp\">here</A> for the form.<BR>");
    out.flush();
    return;
    }
%>   

<jsp:setProperty name="email" property="smtpServer" value="mail.abs.com.cn" />
<%--
<jsp:setProperty name="email" property="port" value="25" />
--%>


<%--方法1:  为保持代码简洁，使用sendMail()方法--%>

<% 
 try{
 email.sendMail(from,to,subject,message);
 }catch(beanMailer.SMTPException e){
  out.println(e.getMessage() + "<br>");
 }
%> 
<%--或方法2:  使用更复杂的脚本得到服务器的响应并捕捉错误信息。该方法比较稳妥，分细步骤执行--%>
<%
    try{
    // 1) 连接到服务器
    email.connect();
    out.println("Connecting...");
    out.println(email.getServerReply());
    out.println("<br>");

    // 2) 得到服务器响应
    try{
          out.println("Hailing...");
          email.hail(from, to);
          out.println(email.getServerReply());
          out.println("<br>"); 

         // 3) 如果找到服务器，则发出信息
          try{
                out.println("Sending Message...");
                email.sendMessage(from, to, subject, message);
                out.println(email.getServerReply());
                out.println("<br>"); 

               }catch (SMTPException e){
                 out.println(e.getMessage() +"<br>");
           }

         // 4) 关闭连接
        try{
               out.println("Logging off...");
               email.logout();
               out.println(email.getServerReply());
               out.println("<br>");
              }catch (SMTPException e) {
          out.println(e.getMessage() +"<br>");
          }
    }catch (SMTPException e){
   out.println(e.getMessage() +"<br>");
   }
 }catch (SMTPException e){
   out.println(e.getMessage() +"<br>");
   }  
%> 