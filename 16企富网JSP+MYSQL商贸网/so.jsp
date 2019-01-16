<TABLE bgColor=#FFFFFF border=0 cellPadding=0 cellSpacing=1 width=98% bordercolor="#ffffff" height="69" align=center>
<center>
   <tr > 
      <TD align=center valign="middle" height="20"> <table   cellSpacing="5" cellPadding="5" width="400" border="0">
          <tbody>
            <tr align="middle" > 
              <td style="BORDER-RIGHT: #faa800 1px solid; BORDER-TOP: #faa800 1px solid; BORDER-LEFT: #faa800 1px solid; BORDER-BOTTOM: #faa800 1px solid" bgColor="#fff488" align="center"><a  class="s"  onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('<%=WebUrl%>');" href="<%=WebUrl%>">设置自动访问<%=webname%></a></td>
              <td style="BORDER-RIGHT: #faa800 1px solid; BORDER-TOP: #faa800 1px solid; BORDER-LEFT: #faa800 1px solid; BORDER-BOTTOM: #faa800 1px solid" bgColor="#fff488" align="center"><a  class="s"onclick="javascript:window.external.addFavorite('<%=WebUrl%>','<%=webname%>');" href="<%=WebUrl%>">将<%=webname%>加入收藏夹</a></td>

</tr>
</tbody>
</table>
<script src=../conn/window500350.js></script>
<script language="javascript">
function search()
{
if(sowwwsearch.abc1.checked)
   window.open("http://www.google.com/search?hl=zh-CN&lr=lang_zh-CN&q="+sowwwsearch.key.value,"mspg1");
if(sowwwsearch.abc2.checked)
   window.open("http://cn.search.yahoo.com/search/cn?p="+sowwwsearch.key.value,"mspg2");
if(sowwwsearch.abc3.checked)
   window.open("http://nisearch.163.com/Search?q="+sowwwsearch.key.value,"mspg3");
if(sowwwsearch.abc4.checked)
   window.open("http://search.sina.com.cn/cgi-bin/search/search.cgi?_searchkey="+sowwwsearch.key.value,"mspg4");
if(sowwwsearch.abc5.checked)
   window.open("http://site.search.sohu.com/sitesearch.jsp?page_index=0&key_word="+sowwwsearch.key.value,"mspg5");
if(sowwwsearch.abc6.checked)
   window.open("http://cns.3721.com/cns.dll?name="+sowwwsearch.key.value,"mspg6");
if(sowwwsearch.abc7.checked)
   window.open("http://www.baidu.com/baidu?tn=sowww&word="+sowwwsearch.key.value,"mspg7");
return false;   
}
</SCRIPT>
<table width="98%" height="0" border="0" align="center" cellpadding="0" cellspacing="0">
<tbody>
<tr>
<Td>
<FORM name=sowwwsearch onsubmit=return(search())>
</Td>
<td  height=25 class="s" align=center>[超级搜索]<img src="../images/indicator.gif" width="9" height="9"> 关键字：
<INPUT class="blankmenu" size=12 name=key>
<INPUT name=abc1 type=checkbox id="abc13" value=google>
google<INPUT name=abc7 type=checkbox id="abc73" value=yahoo CHECKED>
百度<INPUT name=abc2 type=checkbox id="abc23" value=yahoo>
雅虎<INPUT name=abc3 type=checkbox id="abc33" value=yeah>
网易<INPUT name=abc4 type=checkbox id="abc43" value=sina>
新浪<INPUT name=abc5 type=checkbox id="abc53" value=sohu>
搜狐<INPUT name=abc6 type=checkbox id="abc63" value=3721>
3721<input name="Submitsearch" type="image"  value="检索" src='../images/search.gif' align="absmiddle" width="46" height="19" alt="检索"> 
</td>
</form>
</tr>
</tbody>
</table>