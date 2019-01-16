Ext.BLANK_IMAGE_URL = '/bmsh/resources/images/default/s.gif';
Ext.QuickTips.init();
var start = {
	id : 'start-panel',
	title : '欢迎使用',
	layout : 'fit',
	bodyStyle : 'padding:25px',
	html : '<img src="/bmsh/images/bg.jpg"/>'
};

Ext.onReady(function() {
	setTimeout(function() {
		Ext.get('loading').remove();
		Ext.getDom('header').style.visibility = 'visible';
		var vp = new Ext.Viewport({
			layout : 'border',
			defaults : {
				collapsible : true,
				split : true
			},
			items : [{
				xtype : 'box',
				region : 'north',
				applyTo : 'header',
				height : 30,
				split : false
			}, {
				title : currentUser,
				id : 'accordion-panel',
				layout : 'border',
				region : 'west',
				margins : '2 0 5 5',
				width : 200,
				minSize : 200,
				maxSize : 250,
				bodyStyle : 'background-color:#DFE8F6',
				defaults : {
					border : false
				},
				bbar : [{
					text : '开始',
					iconCls : 'icon-plugin',
					menu : new Ext.menu.Menu({
						items : [{
							text : '关于系统',
							iconCls : 'icon-info',
							handler : function() {
								new Ext.Window({
									closeAction : 'close',
									resizable : false,
									bodyStyle : 'padding: 7',
									modal : true,
									title : '关于本系统',
									html : '本系统采用目前较为流行的技术实现,<br>前台使用了ExtJs技术,所以实现了跨浏览器<br>' +
											'本程序在IE6,IE7,FireFox3均测试通过!<br><br>主要技术: Struts2 + Spring2.5 + iBatis2.3 + ExtJs2.2<br><br>'
											+ '数&nbsp;&nbsp;据&nbsp;&nbsp;库: Microsoft SQL Server 2000',
									width : 300,
									height : 200
								}).show();
							}
						}, {
							text : '退出系统',
							iconCls : 'icon-delete',
							handler : function() {
								Ext.Msg.confirm('操作提示', '您确定要退出本系统?', function(btn) {
									if ('yes' == btn) {
										Ext.Ajax.request({
											url : 'logout.action',
											success : function() {
												location = '/bmsh/index.jsp';
											},
											failure : function() {
												Ext.Msg.show({
													title : '错误提示',
													msg : '退出系统失败!',
													icon : Ext.Msg.ERROR,
													buttons : Ext.Msg.OK
												});
											}
										});
									}
								});
							}
						}]
					})
				}],
				items : [{
					layout : 'accordion',
					region : 'center',
					items : [{
						title : '导航菜单',
						iconCls : 'icon-nav',
						border : false,
						items : [{
							xtype : 'treepanel',
							border : false,
							rootVisible : false,
							autoScroll : true,
							loader : new Ext.tree.TreeLoader({
								dataUrl : nav == 'manager'
										? '/bmsh/js/tree-data-manager.json'
										: '/bmsh/js/tree-data-simple.json'
							}),
							root : new Ext.tree.AsyncTreeNode(),
							listeners : {
								'click' : function(n) {
									try {
										var sn = this.selModel.selNode || {};
										if (n.leaf && n.id != sn.id) {
											Ext.getCmp('content-panel').layout.setActiveItem(n.id.substring(0, n.id
													.indexOf('-'))
													+ '-panel');
										}
									} catch (e) {
									}
								}
							}
						}]
					}]
				}]
			}, {
				id : 'content-panel',
				region : 'center',
				layout : 'card',
				margins : '2 5 5 0',
				activeItem : 0,
				border : false,
				items : [start, p_company, p_user, p_dept, p_duty, p_subject, p_category, p_book, p_simple_book]
			}]
		});
	}, 250);
});
