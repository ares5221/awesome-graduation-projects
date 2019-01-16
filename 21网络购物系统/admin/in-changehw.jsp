<%   boolean founderr=false;
	 String hw_ids ,hw_cashs,sort_ids,pifas,dailis,errmsg,datas,tuijians,Nsort_ids;
	 hw_ids=request.getParameter("hw_id");
	 if(hw_ids!=null)
		 {
	 //--------------------------------------hw_ids!=null---------------------------------------------
	      hw_id=Cint(hw_ids);
	      if(hw_id!=0){
	        sql="SELECT * from hw where hw_id="+hw_id; 
            rs=mdb.executeQuery(sql);
			if(rs.next())
				{
                  hw_name=rs.getString("hw_name");
                 hw_cash=rs.getInt("hw_cash");
                 hw_pic=rs.getString("hw_pic");
                hw_sn=rs.getString("hw_sn");
                 sort_id=rs.getInt("sort_id");
                Nsort_id=rs.getInt("Nsort_id");
            tuijian=rs.getBoolean("tuijian");
            hw_content=rs.getString("hw_content");
			hw_content=hw_content.replaceAll("<br>",String.valueOf(' '));
	        hw_content2=rs.getString("hw_content2");
			hw_content2=hw_content2.replaceAll("<br>",String.valueOf(' '));

             hw_views=rs.getInt("hw_views");
            hw_buys=rs.getInt("hw_buys");
             chubsh=rs.getString("chubsh");
           zhuang=rs.getString("zhuang");
           hw_sn=rs.getString("hw_sn");
           company=rs.getString("company");
           yeshu=rs.getString("yeshu");
           kaiben=rs.getString("kaiben");
           isbn=rs.getString("isbn");
           pifa=rs.getInt("pifa");
           daili=rs.getInt("daili");
           data=rs.getDate("data");
           rs.close();
%>
<!-----------------------------------table to show the modify info---------------------------------------->

<table width="500" border="0" cellspacing="0" cellpadding="0" align="center" height="100" bgcolor="808080">
  <tr> 
    <td height="175"> 
      <form name="form1" method="post" action="changehw.jsp?hw_id=<%=hw_id%>&action=save">
        <table border="0" width="100%" cellspacing="1">
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2"><font color="#FF0000">商品名称</font> 
              <input type="text" name="hw_name" size="20" class=input value="<%=hw_name%>">
              <font color="#FF0000"> &nbsp;&nbsp;&nbsp;&nbsp; 商品类别 </font> 
              <select class="smallSel" name="sort_id" size="1">
<%
	       sort_ids=request.getParameter("sort_id");
	       Nsort_ids=request.getParameter("Nsort_id");
           String sel;
  	       sql="select * from sort";
           rs=mdb.executeQuery(sql);
	      if (!rs.next()){
		        out.print("Not record.");
	       }else
	       {  rs.previous();
	          while(rs.next())
	          {    sort_id=rs.getInt("sort_id");
                    if (sort_id==Cint(sort_ids))
                       {      sel="selected";
		                }
                    else
		            {
                      sel="";
                     }	
	                  out.print("<option " +sel + " value='"+sort_id+"' name=sort_id>"+rs.getString("sort_name")+"</option>");
              }
	      }
	     rs.close();
%>
              </select>
              &nbsp;&nbsp;<font color="#FF0000">选择分类</font>： 
              <select name="Nsort_id" size="1">
                <%
  	    sql="select * from Nsort";
        rs=mdb.executeQuery(sql);
	    if(!rs.next())
	    {	out.print("Not record.");
	     }else
	    {  rs.previous();
            while(rs.next())
	         { 
	             Nsort_id=rs.getInt("Nsort_id");
                 if(Nsort_id==Cint(Nsort_ids))
                 {       sel="selected";
		         }
                 else
		          {
                         sel="";
                  }	
                 out.print( "<option " + sel + " value='" +  Nsort_id + "'>" + rs.getString("Nsort_name") + "</option>");
        
                  }
	         }
             rs.close();
%>
              </select>
              ** </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2"><font color="#FF0000">图书原价</font> 
              <input type="text" name="pifa" size="7" class=input value="<%=pifa%>">
              元 <font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;会员价格</font> 
              <input type="text" name="hw_cash" size="7" class=input value="<%=hw_cash%>">
              元 <font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;VIP价格 </font> 
              <input type="text" name="daili" size="7" class=input value="<%=daili%>">
              元 </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="5" colspan="2"> 
              <hr noshade size="1">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="25%"><font color="#000000">作者</font> 
              <input type="text" name="hw_sn" size="10" class=input value="<%=hw_sn%>">
            </td>
            <td width="75%"><font color="#000000">出版社</font> 
              <input type="text" name="chubsh" size="30" class=input value="<%=chubsh%>">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="25%"><font color="#000000">页数</font> 
              <input type="text" name="yeshu" size="10" class=input value="<%=yeshu%>">
            </td>
            <td width="75%"><font color="#000000">出版日期</font> 
              <input type="text" name="data" size="24" class=input value="<%=data%>">
              格式:2002-10-10</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="25%"><font color="#000000">颜色</font> 
              <input type="text" name="kaiben" size="10" class=input value="<%=kaiben%>">
            </td>
            <td width="75%"><font color="#000000">ISBN号码</font> 
              <input type="text" name="isbn" size="30" class=input value="<%=isbn%>">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="5" colspan="2"> 
              <hr noshade size="1">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2"> <font color="#000000">装帧</font> 
              <input type="text" name="zhuang" size="30" class=input value="<%=zhuang%>">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2"><font color="#FF0000">简单内容介绍</font></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td valign="top" colspan="2"> 
              <textarea rows="3" name="hw_content" cols="50" class=input><%=hw_content%></textarea>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td valign="top" colspan="2"><font color="#FF0000">详细内容介绍</font></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td valign="top" colspan="2"> 
              <textarea rows="10" name="hw_content2" cols="50" class=input><%=hw_content2%></textarea>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2"> <font color="#FF0000">商品图片</font> 
              <input type="text" name="hw_pic" size="46" class=input value="<%=hw_pic%>"><a href="up.jsp" target="_blank">上传图片</a></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2" height="24"> 
              <input type="radio" name="tuijian" value="1">
              推荐此商品 
              <input type="radio" name="tuijian" value="0" checked>
              不推荐
              <input name="hw_id" type="hidden" id="hw_id" value="<%=hw_id%>"></td>
          </tr>
          <tr bgcolor="#FFFFFF" align="center"> 
            <td colspan="2"> 
              <input type="submit" name="Submit" value="修改">
            </td>
          </tr>
        </table>
      </form>
    </td>
  </tr>
</table>

<%        }//---------------------------rs.next end---------------------------------
	   }//---------------------------hw_id!=0 check end------------------------------------------------------
    }//----------------------------hw_id!=null end-------------------------------------------------------------
%>
 