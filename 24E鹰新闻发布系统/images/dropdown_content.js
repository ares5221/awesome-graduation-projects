if (mtDropDown.isSupported()) {
  var ms = new mtDropDownSet(mtDropDown.direction.down, 0, 4, mtDropDown.reference.bottomLeft);
  var menu1 = ms.addMenu(document.getElementById("menu1"));

  menu1.addItem("&nbsp;&nbsp;红盟通告&nbsp;&nbsp;", "news.asp?upid=64&id=65&title=红盟通告");
  menu1.addItem("&nbsp;&nbsp;业界信息&nbsp;&nbsp;", "news.asp?id=66&title=业界信息&upid=64");
  menu1.addItem("&nbsp;&nbsp;安全漏洞&nbsp;&nbsp;", "news.asp?id=80&title=安全漏洞&upid=64");
  menu1.addItem("&nbsp;&nbsp;黑客新闻&nbsp;&nbsp;", "news.asp?id=82&title=黑客新闻&upid=64");
  menu1.addItem("&nbsp;&nbsp;病毒公告&nbsp;&nbsp;", "news.asp?id=83&title=病毒公告&upid=64");
  menu1.addItem("&nbsp;&nbsp;黑客文化&nbsp;&nbsp;", "news.asp?id=89&title=黑客文化&upid=64");
  menu1.addItem("&nbsp;&nbsp;高手投稿&nbsp;&nbsp;", "mailto:fairy@xqit.net");

  var menu2 = ms.addMenu(document.getElementById("menu2"));
  menu2.addItem("&nbsp;&nbsp;红客之门&nbsp;&nbsp;", "news.asp?id=72&title=红客之门&upid=71");
  menu2.addItem("&nbsp;&nbsp;程序设计&nbsp;&nbsp;", "news.asp?id=73&title=程序设计&upid=71");
  menu2.addItem("&nbsp;&nbsp;技术资料&nbsp;&nbsp;", "news.asp?id=85&title=技术资料&upid=71");  
  menu2.addItem("&nbsp;&nbsp;漏洞研究&nbsp;&nbsp;", "news.asp?id=90&title=漏洞研究&upid=71");

  var menu3 = ms.addMenu(document.getElementById("menu3"));
  menu3.addItem("&nbsp;&nbsp;协议分类&nbsp;&nbsp;", "news.asp?id=75&title=协议分类&upid=74");
  menu3.addItem("&nbsp;&nbsp;服务器区&nbsp;&nbsp;", "news.asp?id=76&title=服务器区&upid=74");
  menu3.addItem("&nbsp;&nbsp;网络技巧&nbsp;&nbsp;", "news.asp?id=81&title=网络技巧&upid=74");
  menu3.addItem("&nbsp;&nbsp;入侵分析&nbsp;&nbsp;", "news.asp?id=91&title=入侵分析&upid=74");

  var menu4 = ms.addMenu(document.getElementById("menu4"));
  menu4.addItem("&nbsp;&nbsp;本站原创&nbsp;&nbsp;", "download.asp?id=3&title=本站原创");
  menu4.addItem("&nbsp;&nbsp;精品教程&nbsp;&nbsp;", "download.asp?id=3&title=精品教程");
  menu4.addItem("&nbsp;&nbsp;教学资料&nbsp;&nbsp;", "download.asp?id=3&title=教学资料");
  menu4.addItem("&nbsp;&nbsp;加密解密&nbsp;&nbsp;", "download.asp?id=6&title=加密解密");
  menu4.addItem("&nbsp;&nbsp;漏洞扫描&nbsp;&nbsp;", "download.asp?id=7&title=漏洞扫描");
  menu4.addItem("&nbsp;&nbsp;溢出工具&nbsp;&nbsp;", "download.asp?id=8&title=溢出工具");
  menu4.addItem("&nbsp;&nbsp;远程控制&nbsp;&nbsp;", "download.asp?id=9&title=远程控制");
  menu4.addItem("&nbsp;&nbsp;攻击软件&nbsp;&nbsp;", "download.asp?id=10&title=攻击软件");
  menu4.addItem("&nbsp;&nbsp;黑客必备&nbsp;&nbsp;", "download.asp?id=11&title=黑客必备");
  menu4.addItem("&nbsp;&nbsp;动画教程&nbsp;&nbsp;", "download.asp?id=12&title=动画教程");
  
  var menu5 = ms.addMenu(document.getElementById("menu5"));
  menu5.addItem("&nbsp;&nbsp;中国历史&nbsp;&nbsp;", "news.asp?id=78&title=中国历史&upid=77");
  menu5.addItem("&nbsp;&nbsp;红盟历史&nbsp;&nbsp;", "news.asp?id=79&title=红盟历史&upid=77");
  menu5.addItem("&nbsp;&nbsp;爱国交流&nbsp;&nbsp;", "news.asp?id=93&title=爱国交流&upid=77");
  menu5.addItem("&nbsp;&nbsp;红盟重组&nbsp;&nbsp;", "news.asp?id=94&title=红盟重组&upid=77");

  mtDropDown.renderAll();
 }