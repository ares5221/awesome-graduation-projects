
<script  language="JavaScript">
function change()
{
    
	if (document.form1.dfl.value=="房地产")
	{
	   房地产();
	   document.form1.hyfl.value="房地产";
	   return;
   	}
	
	if (document.form1.dfl.value=="化工")
	{
	   化工();
	   document.form1.hyfl.value="化工";
	   return;
   	}
	
	if (document.form1.dfl.value=="安全、防护")
	{
	   安全、防护();
	   document.form1.hyfl.value="安全、防护";
	   return;
   	}
	
	if (document.form1.dfl.value=="服饰")
	{
	   服饰();
	   document.form1.hyfl.value="服饰";
	   return;
   	}
	
	if (document.form1.dfl.value=="印刷、出版")
	{
	   印刷、出版();
	   document.form1.hyfl.value="印刷、出版";
	   return;
   	}
	
	if (document.form1.dfl.value=="环保")
	{
	   环保();
	   document.form1.hyfl.value="环保";
	   return;
   	}
	
	if (document.form1.dfl.value=="能源")
	{
	   能源();
	   document.form1.hyfl.value="能源";
	   return;
   	}
	
	if (document.form1.dfl.value=="交通运输 ")
	{
	   交通运输 ();
	   document.form1.hyfl.value="交通运输 ";
	   return;
   	}
	
	if (document.form1.dfl.value=="商业服务")
	{
	   商业服务();
	   document.form1.hyfl.value="商业服务";
	   return;
   	}
	
	if (document.form1.dfl.value=="包装、纸 ")
	{
	   包装、纸 ();
	   document.form1.hyfl.value="包装、纸 ";
	   return;
   	}
	
	if (document.form1.dfl.value=="医药、保养")
	{
	   医药、保养();
	   document.form1.hyfl.value="医药、保养";
	   return;
   	}
	
	if (document.form1.dfl.value=="电脑、软件")
	{
	   电脑、软件();
	   document.form1.hyfl.value="电脑、软件";
	   return;
   	}
	
	if (document.form1.dfl.value=="冶金矿产")
	{
	   冶金矿产();
	   document.form1.hyfl.value="冶金矿产";
	   return;
   	}
	
	if (document.form1.dfl.value=="建材")
	{
	   建材();
	   document.form1.hyfl.value="建材";
	   return;
   	}
	
	if (document.form1.dfl.value=="人才、教育")
	{
	   人才、教育();
	   document.form1.hyfl.value="人才、教育";
	   return;
   	}
	
	if (document.form1.dfl.value=="农业")
	{
	   农业();
	   document.form1.hyfl.value="农业";
	   return;
   	}
	
	if (document.form1.dfl.value=="电子电工")
	{
	   电子电工();
	   document.form1.hyfl.value="电子电工";
	   return;
   	}
	
	if (document.form1.dfl.value=="纺织皮革")
	{
	   纺织皮革();
	   document.form1.hyfl.value="纺织皮革";
	   return;
   	}
	
	if (document.form1.dfl.value=="玩具")
	{
	   玩具();
	   document.form1.hyfl.value="玩具";
	   return;
   	}
	
	if (document.form1.dfl.value=="通讯")
	{
	   通讯();
	   document.form1.hyfl.value="通讯";
	   return;
   	}
	
	if (document.form1.dfl.value=="工业用品")
	{
	   工业用品();
	   document.form1.hyfl.value="工业用品";
	   return;
   	}
	
	if (document.form1.dfl.value=="家居用品")
	{
	   家居用品();
	   document.form1.hyfl.value="家居用品";
	   return;
   	}
	
	if (document.form1.dfl.value=="家用电器")
	{
	   家用电器();
	   document.form1.hyfl.value="家用电器";
	   return;
   	}
	
	if (document.form1.dfl.value=="汽摩及配件")
	{
	   汽摩及配件();
	   document.form1.hyfl.value="汽摩及配件";
	   return;
   	}
	
	if (document.form1.dfl.value=="运动、休闲")
	{
	   运动、休闲();
	   document.form1.hyfl.value="运动、休闲";
	   return;
   	}
	
	if (document.form1.dfl.value=="食品、饮料")
	{
	   食品、饮料();
	   document.form1.hyfl.value="食品、饮料";
	   return;
   	}
	
	if (document.form1.dfl.value=="办公、文教")
	{
	   办公、文教();
	   document.form1.hyfl.value="办公、文教";
	   return;
   	}
	
	if (document.form1.dfl.value=="库存积压品")
	{
	   库存积压品();
	   document.form1.hyfl.value="库存积压品";
	   return;
   	}
	
	if (document.form1.dfl.value=="工艺、礼品")
	{
	   工艺、礼品();
	   document.form1.hyfl.value="工艺、礼品";
	   return;
   	}
	
	if (document.form1.dfl.value=="其他")
	{
	   其他();
	   document.form1.hyfl.value="其他";
	   return;
   	}
	
}

function 房地产()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("土地租赁","土地租赁");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("地皮转让","地皮转让");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("名优承建","名优承建");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("新兴配套","新兴配套");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("楼盘推荐","楼盘推荐");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("楼盘租赁","楼盘租赁");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("二手楼盘","二手楼盘");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("物业管理","物业管理");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("名优发展商","名优发展商");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("名优设计院","名优设计院");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("名优策划商","名优策划商");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("代理机构","代理机构");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 化工()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("肥料","肥料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("农药","农药");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("涂料","涂料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("油漆 ","油漆 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("催化剂及化学助剂","催化剂及化学助剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("活性炭","活性炭");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("橡胶及制品","橡胶及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("日用化学品","日用化学品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化工设备 ","化工设备 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("塑料及制品","塑料及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("食品添加剂","食品添加剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化学仪器 ","化学仪器 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("合成药","合成药");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("印刷油墨","印刷油墨");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化学矿 ","化学矿 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("颜料","颜料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化工设计加工","化工设计加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("无机化工原料","无机化工原料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("染料","染料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("树脂","树脂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化学试剂","化学试剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存化工品","库存化工品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("合成纤维","合成纤维");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("饲料添加剂","饲料添加剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("石油及制品","石油及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他聚合物","其他聚合物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("胶粘剂","胶粘剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("有机化工原料","有机化工原料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("信息用化学品","信息用化学品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("火药","火药");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化工项目合作","化工项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("实验室用品","实验室用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("橡胶生产加工机械","橡胶生产加工机械");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化工废料","化工废料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化工产品设计加工","化工产品设计加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化学纤维","化学纤维");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("仪器、仪表","仪器、仪表");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("玻璃生产加工机械","玻璃生产加工机械");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("香料、香精","香料、香精");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("玻璃及制品","玻璃及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("塑料生产加工机械","塑料生产加工机械");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 安全、防护()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("防盗设施","防盗设施");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("报警装置","报警装置");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("防弹器材","防弹器材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("作业保护","作业保护");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("交通安全","交通安全");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("消防器材 ","消防器材 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("防身用具","防身用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("防暴器材","防暴器材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("救生器材 ","救生器材 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("监视、监控设备","监视、监控设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("锁具 ","锁具 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("保险柜 ","保险柜 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("运动护具","运动护具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("民用爆破","民用爆破");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("保安及紧急服务","保安及紧急服务");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("警用器材 ","警用器材 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("军需用品","军需用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("避雷产品","避雷产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存安全防护产品","库存安全防护产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("门铃、可视门铃","门铃、可视门铃");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 服饰()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("运动服饰","运动服饰");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("休闲服装","休闲服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("泳装","泳装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("皮革服装","皮革服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("丝绸服装","丝绸服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("牛仔服装","牛仔服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("特制服装","特制服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("民族服装","民族服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工作服、制服","工作服、制服");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("婴儿服装","婴儿服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("儿童服装","儿童服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("外衣、外套","外衣、外套");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("衬衣","衬衣");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("T恤","T恤");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("西服","西服");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("夹克","夹克");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("裤子","裤子");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("大衣、风衣","大衣、风衣");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("毛衣","毛衣");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("鞋子、靴子","鞋子、靴子");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("袜子、手套","袜子、手套");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("围巾","围巾");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("帽子","帽子");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("领带","领带");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("辅料、饰品","辅料、饰品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("缝纫设备","缝纫设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("相关设备","相关设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("服装设计加工","服装设计加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存服装","库存服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("内衣、睡衣","内衣、睡衣");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("服饰鞋帽设计加工","服饰鞋帽设计加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("鞋及鞋材","鞋及鞋材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("女士手袋","女士手袋");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("梭织服装","梭织服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("男装","男装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("羽绒服装、防寒服","羽绒服装、防寒服");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("整熨洗涤设备","整熨洗涤设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("服饰鞋帽项目合作","服饰鞋帽项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("皮夹，腰包","皮夹，腰包");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("针织服装","针织服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("品牌服装","品牌服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("女装","女装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("裤子","裤子");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("婚纱、礼服","婚纱、礼服");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("羊毛、羊绒衫","羊毛、羊绒衫");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("服装加工设备","服装加工设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("鞋加工及修理设备","鞋加工及修理设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存鞋及鞋材","库存鞋及鞋材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 印刷、出版()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("印刷出版物","印刷出版物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("油墨","油墨");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("排版，制版设备","排版，制版设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("印刷设备及配件","印刷设备及配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("音像制品及电子读物","音像制品及电子读物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("报纸","报纸");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("广播、电视节目","广播、电视节目");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("台历、挂历、贺卡","台历、挂历、贺卡");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("二手印刷设备","二手印刷设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电影","电影");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("广告材料","广告材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("出版、发行商","出版、发行商");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("簿、本、册","簿、本、册");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("不干胶制品","不干胶制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 环保()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("废纸 ","废纸 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("水处理","水处理");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("降噪音设备","降噪音设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("废气处理","废气处理");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("废料处理","废料处理");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("废物再利用","废物再利用");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纺织废料","纺织废料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化工废料","化工废料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("皮革废料","皮革废料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("金属废料","金属废料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("废气处理","废气处理");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("公共环卫设施","公共环卫设施");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("环保项目合作","环保项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 能源()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("石油及制品","石油及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("煤","煤");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("发电机、发电机组","发电机、发电机组");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("天然气、煤气","天然气、煤气");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("太阳能及再生能源","太阳能及再生能源");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电力","电力");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("石油加工设备","石油加工设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("UPS与电源","UPS与电源");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("矿业设备","矿业设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("能源项目合作","能源项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电池","电池");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 交通运输 ()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("自行车、三轮车及配件","自行车、三轮车及配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("集装箱","集装箱");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("铁路运输设备","铁路运输设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("船舶","船舶");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电梯、缆车","电梯、缆车");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("航空、航天 ","航空、航天 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("废气处理","废气处理");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("运输、仓储","运输、仓储");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("交通安全","交通安全");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("船舶及配件","船舶及配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("飞行器及配件","飞行器及配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("二手交通产品及用具","二手交通产品及用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("轮胎","轮胎");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存交通产品及用具","库存交通产品及用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("交通项目合作","交通项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 商业服务()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("旅游","旅游");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("宾馆、酒店","宾馆、酒店");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("商展、会议","商展、会议");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("经济技术合作","经济技术合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("通信、投递","通信、投递");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("进出口代理","进出口代理");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("贸易、代理","贸易、代理");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("广告、策划","广告、策划");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("信息咨询","信息咨询");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("网络营销","网络营销");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("移民、签证","移民、签证");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("劳务输出","劳务输出");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("拍卖","拍卖");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("经纪、中介","经纪、中介");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("典当、租赁","典当、租赁");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("设计、加工","设计、加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("运输、仓储","运输、仓储");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("法律、公证","法律、公证");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("金融、财税","金融、财税");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("翻译","翻译");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("商务服务","商务服务");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("教育、培训","教育、培训");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("招聘","招聘");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("婚介、交友","婚介、交友");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("婚庆、礼仪","婚庆、礼仪");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("医疗服务","医疗服务");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("维修、安装、清洗","维修、安装、清洗");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("超市、百货、便利店","超市、百货、便利店");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("保险","保险");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("印刷出版服务","印刷出版服务");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 包装、纸 ()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("纸制包装用品","纸制包装用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("胶带","胶带");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("废纸","废纸");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("文化用纸","文化用纸");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纸品、纸浆","纸品、纸浆");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("包装袋","包装袋");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("包装箱","包装箱");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("包装材料","包装材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("包装相关设备","包装相关设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("造纸设备","造纸设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("标签、标牌","标签、标牌");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("包装、印刷服务","包装、印刷服务");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("器皿、容器","器皿、容器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家用纸品","家用纸品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其它用途用纸","其它用途用纸");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("木制包装用品","木制包装用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("金属包装用品","金属包装用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("包装品、纸品相关项目合作","包装品、纸品相关项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("玻璃包装用品","玻璃包装用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("壁纸","壁纸");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("索具","索具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("塑料包装用品","塑料包装用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纸品加工机械","纸品加工机械");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("造纸设备","造纸设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("麻制包装用品","麻制包装用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("托盘","托盘");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("造纸助剂","造纸助剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 医药、保养()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("个人保养","个人保养");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化学药品","化学药品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("中成药","中成药");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("中西药材","中西药材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("医药原料、中间体","医药原料、中间体");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("酶制剂","酶制剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("生物工程","生物工程");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("保健品","保健品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("减肥增重产品","减肥增重产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("性用品","性用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("医疗用具","医疗用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("医疗设备 ","医疗设备 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("医用材料","医用材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("畜用药","畜用药");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("制药设备","制药设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("医疗服务","医疗服务");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("保健食品及药品","保健食品及药品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("康复产品","康复产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("医学资料 ","医学资料 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("医药卫生项目合作","医药卫生项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("保健茶 ","保健茶 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("药酒，保健酒","药酒，保健酒");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("普药","普药");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("处方药","处方药");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("保健用品","保健用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("特殊药品","特殊药品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("功能饮料","功能饮料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("酶(酵素)制剂","酶(酵素)制剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("生物制品","生物制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存医药用品","库存医药用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 电脑、软件()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("数码产品","数码产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电脑整机","电脑整机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("笔记本电脑","笔记本电脑");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("服务器、工作站","服务器、工作站");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电子记事簿","电子记事簿");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("网络设备、配件","网络设备、配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("计算机配件","计算机配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("扫描仪","扫描仪");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电脑外设","电脑外设");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("打印机","打印机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("UPS与电源","UPS与电源");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("耗材","耗材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("二手设备、配件","二手设备、配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("语音设备","语音设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("网络工程","网络工程");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("软件开发","软件开发");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("信息技术合作","信息技术合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("IC卡","IC卡");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("显示器 ","显示器 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("信息技术合作","信息技术合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("主机配件","主机配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电脑相关用品","电脑相关用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存电脑产品","库存电脑产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("软件","软件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("插卡类","插卡类");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("计算机","计算机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 冶金矿产()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("钢铁及制品","钢铁及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("管件、管材","管件、管材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("金属丝网","金属丝网");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("金属矿产","金属矿产");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("有色金属","有色金属");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("铝合金","铝合金");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("有色金属合金及制品","有色金属合金及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("有色金属制品","有色金属制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("非金属矿产及制品","非金属矿产及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("非金属矿物制品","非金属矿物制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("新型材料","新型材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("磁性材料","磁性材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("废旧物资 ","废旧物资 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("冶金设备","冶金设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("矿业设备","矿业设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("冶炼加工","冶炼加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存有色金属 ","库存有色金属 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存冶金矿产","库存冶金矿产");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("冶金矿产项目合作","冶金矿产项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("稀土及稀土制品","稀土及稀土制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("铁合金及制品","铁合金及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("铸锻件","铸锻件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("粉末冶金","粉末冶金");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("金属线、管、板制造设备","金属线、管、板制造设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 建材()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("卫浴洁具","卫浴洁具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("厨房设备","厨房设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("壁纸","壁纸");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("门窗","门窗");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("锁具","锁具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("门铃","门铃");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("地板、地砖","地板、地砖");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("建筑装饰五金","建筑装饰五金");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("水泥及制品、沙子","水泥及制品、沙子");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("石灰、石膏","石灰、石膏");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("防水材料","防水材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("木材、板材","木材、板材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("砖瓦","砖瓦");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("墙体材料、天花板","墙体材料、天花板");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("建筑玻璃","建筑玻璃");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("建筑陶瓷","建筑陶瓷");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("塑料建材","塑料建材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("建筑涂料","建筑涂料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("粘结剂","粘结剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("金属建材","金属建材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("耐火材料","耐火材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("隔音材料","隔音材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("隔热、保温材料","隔热、保温材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("特种建材","特种建材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("建筑及相关设备","建筑及相关设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工程承包","工程承包");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("施工材料","施工材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("建筑装璜设计","建筑装璜设计");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("作业保护","作业保护");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存建材","库存建材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("管件、管材","管件、管材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("绝缘材料","绝缘材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("石材","石材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("活动房","活动房");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("不动产 ","不动产 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("砖、瓦及砌块","砖、瓦及砌块");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("厨房设施","厨房设施");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("涂料@(","涂料@(");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("堆垛搬运机械","堆垛搬运机械");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("木材加工、家具制造机械","木材加工、家具制造机械");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("建筑项目合作","建筑项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("混凝土及制品","混凝土及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("卫浴设施","卫浴设施");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("陶瓷、搪瓷生产加工机械 ","陶瓷、搪瓷生产加工机械 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 人才、教育()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("高等院校","高等院校");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("远程培训","远程培训");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("民办院校","民办院校");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("资格技能认证","资格技能认证");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("招生、考试","招生、考试");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("人力资源","人力资源");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("外语、留学","外语、留学");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("成考、自考","成考、自考");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("重点小学","重点小学");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("重点中学","重点中学");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("合作办学","合作办学");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 农业()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("粮食","粮食");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("蔬菜及制品","蔬菜及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("水果及制品","水果及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("干果","干果");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("豆类","豆类");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("食用菌","食用菌");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("茶叶及制品","茶叶及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("烟草","烟草");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("水产及制品","水产及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("牲畜","牲畜");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("农禽","农禽");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("蛋类","蛋类");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("饲料","饲料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("肥料","肥料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("农药","农药");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("竹木、藤苇、干草","竹木、藤苇、干草");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("植物 ","植物 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("动物","动物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("养殖","养殖");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("动植物油 ","动植物油 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("木炭","木炭");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("种苗","种苗");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("花草、树木 ","花草、树木 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("园艺用具","园艺用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("农机","农机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("林业","林业");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("渔业","渔业");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("畜牧","畜牧");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("添加剂","添加剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("盆景","盆景");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("农产品加工","农产品加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存农产品","库存农产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("棉类","棉类");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("咖啡、可可及制品","咖啡、可可及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("麻类","麻类");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("动物提取物","动物提取物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("动植物种苗","动植物种苗");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家禽","家禽");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("养殖动物","养殖动物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("羽毛，羽绒，羊绒","羽毛，羽绒，羊绒");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("动物毛鬃","动物毛鬃");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("农用品、农用机械","农用品、农用机械");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("畜牧养殖业设备及用具","畜牧养殖业设备及用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("粮油加工机械","粮油加工机械");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("原棉、麻、毛、丝初加工设备","原棉、麻、毛、丝初加工设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("含油子仁、果仁、籽","含油子仁、果仁、籽");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("植物提取物","植物提取物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("蚕茧，蚕丝","蚕茧，蚕丝");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("生皮，毛皮","生皮，毛皮");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("肠衣","肠衣");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("林业设备及用具","林业设备及用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("渔业设备及用具","渔业设备及用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("饲料加工机械","饲料加工机械");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("屠宰及肉类初加工设备","屠宰及肉类初加工设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("农林牧渔项目合作","农林牧渔项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 电子电工()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("线路版","线路版");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("计算器","计算器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("仪器、仪表","仪器、仪表");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电线电缆","电线电缆");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("插头、插座","插头、插座");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电子化学品","电子化学品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("磁性材料","磁性材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("光仪及配件","光仪及配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存电子产品","库存电子产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电子设计加工","电子设计加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("蓄电池","蓄电池");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电动工具","电动工具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电动机 ","电动机 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("开关","开关");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("配电装置、开关柜、照明箱","配电装置、开关柜、照明箱");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("变压器、稳压器","变压器、稳压器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("继电器","继电器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("整流器","整流器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("雷达及无线导航","雷达及无线导航");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电子元器件、组件","电子元器件、组件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("数控设备","数控设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("照明与灯具","照明与灯具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("充电器","充电器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电力控制和保护","电力控制和保护");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电力配件与材料","电力配件与材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("广播、电视设备","广播、电视设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("发电机","发电机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("绝缘材料","绝缘材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("天线","天线");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电池","电池");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("光电子、激光仪器","光电子、激光仪器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("显示设备","显示设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("发电机、发电机组","发电机、发电机组");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("半导体材料","半导体材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电工陶瓷材料","电工陶瓷材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电热设备","电热设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("广电、电信设备","广电、电信设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电子电工产品制造设备","电子电工产品制造设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 纺织皮革()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("床上用品","床上用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("地毯","地毯");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("毛巾、浴巾","毛巾、浴巾");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家用纺织","家用纺织");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纱线、绒线","纱线、绒线");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纺织辅料","纺织辅料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("皮革制品","皮革制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工艺纺织","工艺纺织");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("毛织物","毛织物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("丝织物","丝织物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("麻织物","麻织物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("针织物","针织物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化纤织物","化纤织物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("混纺织物","混纺织物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("无纺布","无纺布");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存纺织品","库存纺织品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纺织、皮革原料","纺织、皮革原料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纺织设备和器材","纺织设备和器材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("棉织物","棉织物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("面料","面料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("坯布","坯布");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纺织皮革相关项目合作","纺织皮革相关项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("色织、扎染、印花布","色织、扎染、印花布");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工业用布、无纺布","工业用布、无纺布");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("抽纱及其他工艺纺织","抽纱及其他工艺纺织");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("皮革助剂","皮革助剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("皮革废料","皮革废料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("皮革及制品设计加工","皮革及制品设计加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("皮革加工机械","皮革加工机械");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纺织助剂","纺织助剂");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纺织废料","纺织废料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纺织品设计加工","纺织品设计加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 玩具()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("电动玩具","电动玩具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("益智玩具","益智玩具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("塑料玩具","塑料玩具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("填充、绒毛玩具","填充、绒毛玩具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电子宠物","电子宠物");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("玩具模型","玩具模型");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("木制玩具","木制玩具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("娃娃","娃娃");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存玩具","库存玩具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("玩具车、枪","玩具车、枪");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工美礼品玩具项目合作","工美礼品玩具项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("玩具配件","玩具配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电子玩具","电子玩具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("玩具珠、球","玩具珠、球");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("童车及配件","童车及配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工美礼品玩具设计加工","工美礼品玩具设计加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 通讯()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("交换机","交换机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电话机、可视电话","电话机、可视电话");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("移动电话","移动电话");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("集团电话","集团电话");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("无线通信 ","无线通信 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("对讲机","对讲机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("寻呼机","寻呼机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("传真机","传真机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("网络通信产品","网络通信产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("GPS系统","GPS系统");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("通讯产品配件部件 ","通讯产品配件部件 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("通信电缆 ","通信电缆 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("磁卡、IP卡、IC卡","磁卡、IP卡、IC卡");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("相关产品","相关产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("广电、电信设备","广电、电信设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("拨号器","拨号器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("天线","天线");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("通讯、声讯系统","通讯、声讯系统");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("雷达及无线导航","雷达及无线导航");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("通讯产品制造设备","通讯产品制造设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("锂电池、镍氢电池","锂电池、镍氢电池");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("来电显示器","来电显示器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("充电器","充电器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("控制和调整设备","控制和调整设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 工业用品()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("机械设计加工","机械设计加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工业设备库存","工业设备库存");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("内燃机","内燃机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("量器量具","量器量具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("作业保护","作业保护");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("印刷设备","印刷设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("农机、农具","农机、农具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("林业设备 ","林业设备 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("渔业设备及用具","渔业设备及用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("畜牧业设备","畜牧业设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("食品设备","食品设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("缝纫设备","缝纫设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纺织设备和器材","纺织设备和器材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("数控设备","数控设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("仪器、仪表","仪器、仪表");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家电制造设备","家电制造设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("轻工设备","轻工设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("制药设备","制药设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("压缩、分离设备","压缩、分离设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("包装相关设备","包装相关设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("造纸设备","造纸设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化工设备","化工设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("冶金设备","冶金设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("矿业设备","矿业设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("金属加工设备","金属加工设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("建筑及相关设备","建筑及相关设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("发电机","发电机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("蓄电池","蓄电池");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("绝缘材料","绝缘材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("照明与灯具","照明与灯具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("节能装置","节能装置");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("通用零部件","通用零部件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("五金工具","五金工具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("锅炉及动力设备","锅炉及动力设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("风机","风机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("化工原料","化工原料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("散热、制冷设备","散热、制冷设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("泵类及真空设备","泵类及真空设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("焊接设备与材料","焊接设备与材料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("磨具、磨料","磨具、磨料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("搬运机械","搬运机械");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("木工工具","木工工具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("机械及工业制品项目合作","机械及工业制品项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("气动工具","气动工具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("减速机、变速机","减速机、变速机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("液压机械及部件","液压机械及部件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存设备及工业用品","库存设备及工业用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他专用机械及设备","其他专用机械及设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("模具及相关制造","模具及相关制造");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 家居用品()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("缝纫编织","缝纫编织");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家用纺织","家用纺织");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("灭害","灭害");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("门铃","门铃");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家俱","家俱");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("干电池","干电池");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("净水器、饮水机","净水器、饮水机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("照明与灯具","照明与灯具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家用纸品","家用纸品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("饰品","饰品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("宠物及用品","宠物及用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("刀、剪、刷","刀、剪、刷");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("婴儿用品","婴儿用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("餐具","餐具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("珠宝首饰、金银器","珠宝首饰、金银器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("钟表","钟表");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("伞、雨具","伞、雨具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("卫浴用品","卫浴用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("相框、画框","相框、画框");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("床上用品","床上用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("箱、包、袋","箱、包、袋");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("打火机、烟具","打火机、烟具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("清洁用具","清洁用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存积压品","库存积压品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家用塑料制品","家用塑料制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("厨房设施","厨房设施");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("日用化学品","日用化学品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("熏香及熏香炉","熏香及熏香炉");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家用金属制品","家用金属制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家用玻璃制品","家用玻璃制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家用木制品","家用木制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("童车及配件","童车及配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家居用品项目合作","家居用品项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("定时器","定时器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("园艺用具","园艺用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("保温容器","保温容器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("个人保养","个人保养");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家用陶瓷、搪瓷制品","家用陶瓷、搪瓷制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 家用电器()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("电动牙刷","电动牙刷");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("视听器材","视听器材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家电项目合作","家电项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电视机","电视机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("空调机","空调机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("洗衣机","洗衣机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("热水器","热水器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("饮水机","饮水机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("微波炉","微波炉");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("吸尘器","吸尘器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电熨斗","电熨斗");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("果汁机","果汁机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电风扇","电风扇");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电吹风","电吹风");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("消毒柜","消毒柜");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("洗碗机","洗碗机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("抽油烟机 ","抽油烟机 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("灭蚊器 ","灭蚊器 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("定时器","定时器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("净水器","净水器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("空气净化器","空气净化器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电饭煲","电饭煲");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("遥控器","遥控器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("抽湿器、加湿器","抽湿器、加湿器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("冰箱、冷柜","冰箱、冷柜");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("取暖器","取暖器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家电制造设备","家电制造设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存家用电器","库存家用电器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("氧气机","氧气机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("搅拌机","搅拌机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 汽摩及配件()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("汽车","汽车");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("汽车配件","汽车配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("摩托车及配件","摩托车及配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("行业专用运输设备","行业专用运输设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("停车场、加油站设备","停车场、加油站设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("汽车保养","汽车保养");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("相关产品 ","相关产品 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存汽摩及配件","库存汽摩及配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("二手车辆","二手车辆");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("交通安全","交通安全");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("汽摩产品制造设备","汽摩产品制造设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("轮胎 ","轮胎 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("专用车辆","专用车辆");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("汽摩附属及相关产品","汽摩附属及相关产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 运动、休闲()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("旅游用品","旅游用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("休闲食品","休闲食品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("休闲服装","休闲服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("钓鱼 ","钓鱼 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("游戏","游戏");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("扑克","扑克");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("棋类","棋类");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("乐器","乐器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("宠物及用品","宠物及用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("体育用品","体育用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("娱乐设施 ","娱乐设施 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纪念品","纪念品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("运动休闲用品项目合作","运动休闲用品项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("宾馆酒店用品","宾馆酒店用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("健身","健身");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存运动休闲产品","库存运动休闲产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("旅行服务","旅行服务");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 食品、饮料()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("水果及制品","水果及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("香烟","香烟");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("糖类","糖类");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("茶叶及制品","茶叶及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("蜜制品","蜜制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("调味品","调味品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("休闲食品","休闲食品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("食品饮料加工设备","食品饮料加工设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("糕饼面包","糕饼面包");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("饮料","饮料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("食用油","食用油");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("面条、粉丝","面条、粉丝");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("禽畜肉及制品","禽畜肉及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("豆制品","豆制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("速食品","速食品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("罐头食品","罐头食品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("食品添加","食品添加");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("食品库存 ","食品库存 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("酒类","酒类");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("水产及制品","水产及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("淀粉 ","淀粉 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("蛋制品","蛋制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("乳制品","乳制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("速冻食品","速冻食品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("炊事设备","炊事设备");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("保健食品","保健食品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("食品饮料加工","食品饮料加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("食品饮料项目合作","食品饮料项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("咖啡、可可及制品","咖啡、可可及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 办公、文教()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("背包，书包","背包，书包");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("电话、集团电话","电话、集团电话");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("复印机","复印机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("投影机","投影机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("办公家具","办公家具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("耗材","耗材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("传真机","传真机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("碎纸机","碎纸机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("绘图机","绘图机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("文具","文具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("教学设施","教学设施");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("光学及照相器材","光学及照相器材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("打印机","打印机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("考勤机","考勤机");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("视讯会议系统","视讯会议系统");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("办公纸张","办公纸张");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("教学模型、用具","教学模型、用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("实验室用品","实验室用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("办公、文教项目合作","办公、文教项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("计算器","计算器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("簿、本、册","簿、本、册");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 库存积压品()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("库存农产品","库存农产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存食品","库存食品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存服装","库存服装");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存建材","库存建材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存家用电器 ","库存家用电器 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存化工品","库存化工品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存冶金矿产","库存冶金矿产");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存车辆 ","库存车辆 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存电子产品","库存电子产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("家居用品库存","家居用品库存");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存工艺品","库存工艺品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存玩具","库存玩具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存纺织品","库存纺织品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工业设备库存","工业设备库存");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存汽配","库存汽配");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存电脑软硬件","库存电脑软硬件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存汽摩及配件","库存汽摩及配件");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存通讯产品","库存通讯产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存运动休闲产品","库存运动休闲产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存交通产品及用具","库存交通产品及用具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存食品、饮料","库存食品、饮料");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存皮革及制品","库存皮革及制品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存鞋及鞋材","库存鞋及鞋材");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存医药用品","库存医药用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存设备及工业用品","库存设备及工业用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存电子产品","库存电子产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存安全防护产品","库存安全防护产品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 工艺、礼品()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("工艺纺织","工艺纺织");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("节日用品","节日用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("古董和收藏品","古董和收藏品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("字画","字画");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("雕塑","雕塑");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("盆景","盆景");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("仿生工艺","仿生工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("编织工艺","编织工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("玉石工艺","玉石工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("竹木工艺","竹木工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("陶瓷工艺","陶瓷工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("玻璃工艺","玻璃工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("水晶工艺","水晶工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纸制工艺","纸制工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("金属工艺","金属工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("塑料工艺","塑料工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("泥塑工艺","泥塑工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("油漆工艺","油漆工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("树脂工艺","树脂工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("雕刻工艺","雕刻工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("烙画工艺","烙画工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("天然工艺","天然工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("宗教工艺","宗教工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("民间工艺","民间工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("仿古工艺","仿古工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("玩具","玩具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工艺设计 ","工艺设计 ");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("库存工艺品，礼品","库存工艺品，礼品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("蜡烛及烛台","蜡烛及烛台");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("珠宝首饰、金银器","珠宝首饰、金银器");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("饰品","饰品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("纪念品","纪念品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("广告礼品","广告礼品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("抽纱及其他工艺纺织","抽纱及其他工艺纺织");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工美礼品玩具设计加工","工美礼品玩具设计加工");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("钥匙扣，链","钥匙扣，链");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("熏香及熏香炉","熏香及熏香炉");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("相框、画框","相框、画框");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("打火机、烟具","打火机、烟具");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("石料工艺","石料工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("木制工艺","木制工艺");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工美礼品玩具项目合作","工美礼品玩具项目合作");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("殡葬用品","殡葬用品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("工艺礼品","工艺礼品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("装饰盒","装饰盒");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("针钩及编结工艺品","针钩及编结工艺品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("植物编织工艺品","植物编织工艺品");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}

function 其他()
{
   for(i=0;i<100;i++) document.form1.sfl.options.remove(0);
   var sfloption,i;
   i=1
   sfloption=new Option("行业小类","");
   document.form1.sfl.options[0]=sfloption;
   
   sfloption=new Option("其他","其他");
   document.form1.sfl.options[i]=sfloption;
   i=i+1
   
}


function sflchange()
{
  var thisform=document.form1;
  thisform.hyfl.value=thisform.dfl.value+">"+thisform.sfl.value;
  return;
}
 </script>