var Book = Ext.data.Record.create([
	{name : 'bookId',mapping : 'bookId',type : 'int'}, 
	{name : 'bookName',	mapping : 'bookName',type : 'string'}, 
	{name : 'author',mapping : 'author',type : 'string'}, 
	{name : 'press',mapping : 'press',type : 'string'}, 
	{name : 'price',mapping : 'price',type : 'string'}, 
	{name : 'editionNo',mapping : 'editionNo',type : 'string'}, 
	{name : 'isbn',	mapping : 'isbn',type : 'string'}, 
	{name : 'categoryId',mapping : 'categoryId',type : 'int'}, 
	{name : 'categoryName',	mapping : 'categoryName',type : 'string'}, 
	{name : 'wordCount',mapping : 'wordCount',type : 'string'}, 
	{name : 'pageCount',mapping : 'pageCount',type : 'string'}, 
	{name : 'bookSize',	mapping : 'bookSize',type : 'string'}, 
	{name : 'paper',mapping : 'paper',type : 'string'}, 
	{name : 'pack',	mapping : 'pack',type : 'string'}, 
	{name : 'imageUrl',	mapping : 'imageUrl',type : 'string'}, 
	{name : 'address',mapping : 'address',type : 'string'}, 
	{name : 'editorRecommend',mapping : 'editorRecommend',	type : 'string'}, 
	{name : 'description',mapping : 'description',type : 'string'}, 
	{name : 'authorDesc',mapping : 'authorDesc',type : 'string'}, 
	{name : 'state',mapping : 'state',type : 'int'}
]);

var categoryId;

var ds_category_select = new Ext.data.Store({
	url : 'findAllCategoryName.action',
	reader : new Ext.data.JsonReader({
		root : 'root'
	}, [{name : 'categoryId',type : 'int'},
		{name : 'categoryName',type : 'string'}
	])
});

var expander = new Ext.grid.RowExpander({
	tpl : new Ext.Template('<p><table width="480" style="padding-left:20px" border="0" cellspacing="0" cellpadding="0">'
			+ '<tr><td width="133" valign="top"><img src="{imageUrl}" onerror=\'this.src="/bmsh/images/nopic.jpg"\'/></td>'
			+ '<td width="476" colspan="4"><table width="100%"  border="0" cellspacing="6" cellpadding="4">'
			+ '<tr><td width="19%" align="right" nowrap="nowrap">作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</td>'
			+ '<td width="38%" nowrap="nowrap"> {author}</td><td width="15%" align="right" nowrap="nowrap">&nbsp;</td>'
			+ '<td width="28%" nowrap="nowrap">&nbsp;</td></tr><tr><td align="right" nowrap="nowrap">出&nbsp;&nbsp;版&nbsp;&nbsp;社：</td>'
			+ '<td nowrap="nowrap">{press}</td><td align="right" nowrap="nowrap">&nbsp;</td><td nowrap="nowrap">&nbsp;</td></tr><tr>'
			+ '<td align="right" nowrap="nowrap">版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;次：</td>'
			+ '<td nowrap="nowrap">{editionNo}</td><td align="right" nowrap="nowrap">页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数：</td>'
			+ '<td nowrap="nowrap">{pageCount}</td></tr><tr><td align="right" nowrap="nowrap">I &nbsp;&nbsp;S&nbsp;&nbsp;B&nbsp;&nbsp;N：</td>'
			+ '<td nowrap="nowrap">{isbn}</td><td align="right" nowrap="nowrap">开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本：</td>'
			+ '<td nowrap="nowrap">{bookSize}</td></tr><tr><td align="right" nowrap="nowrap">所属类别：</td>'
			+ '<td nowrap="nowrap">{categoryName}</td><td align="right" nowrap="nowrap">纸&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;张：</td>'
			+ '<td nowrap="nowrap">{paper}</td></tr><tr><td align="right" nowrap="nowrap">藏书地址：</td>'
			+ '<td nowrap="nowrap">{address}</td><td align="right" nowrap="nowrap">包&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;装：</td>'
			+ '<td nowrap="nowrap">{pack}</td></tr><tr><td align="right" nowrap="nowrap">定&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：</td>'
			+ '<td nowrap="nowrap"><strong>&yen;</strong>{price}</td><td align="right" nowrap="nowrap">字　&nbsp;&nbsp;&nbsp;数：</td>'
			+ '<td nowrap="nowrap">{wordCount}</td></tr></table></td></tr><tr><td colspan="5" valign="top">&nbsp;</td></tr><tr>'
			+ '<td colspan="5" valign="top"><h4>编辑推荐</h4></td></tr><tr><td colspan="5" valign="top">{editorRecommend}</td>'
			+ '</tr><tr><td colspan="5" valign="top">&nbsp;</td></tr><tr><td colspan="5" valign="top"><h4>内容简介</h4></td>'
			+ '</tr><tr><td colspan="5" valign="top">{description}</td></tr><tr>'
			+ '<td colspan="5" valign="top">&nbsp;</td></tr><tr><td colspan="5" valign="top"><h4>作者简介</h4></td></tr><tr>'
			+ '<td colspan="5" valign="top">{authorDesc}</td></tr></table></p>')
});

var cm_book = new Ext.grid.ColumnModel([expander, 
	{header : '图书名称',	width : 120,dataIndex : 'bookName',	sortable : true}, 
	{header : '作者',width : 40,	dataIndex : 'author',sortable : true}, 
	{header : '定价',width : 30,	dataIndex : 'price',sortable : true}, 
	{header : '所属分类',	width : 90,	sortable : true,dataIndex : 'categoryName'}, 
	{header : '当前读者',width : 40,dataIndex : 'currentReader',menuDisabled : true}, 
	{header : '当前状态',width : 40,dataIndex : 'state',renderer : function(v) {return v == 0 ? '已借出' : '未借出'},	menuDisabled : true}, 
	{header : '藏书地址',	width : 90,	dataIndex : 'address',id : 'address',sortable : true}]
);


var address,_editAddress;// 藏书地址

var cbb_company_for_book_update = new Ext.form.ComboBox({
	name : '_companyName',
	width : 120,
	valueField : 'companyId',
	displayField : 'companyName',
	editable : false,
	selectOnFocus : true,
	mode : 'remote',
	store :  ds_company_select,
	triggerAction : 'all',
	loadingText : '加载中...',
	fieldLabel : '所属分公司',
	listeners : {
		'select' : function() {
			cbb_dept_for_book_update.reset();
			ds_dept_select.baseParams.companyId = cbb_company_for_book_update.getValue();
			ds_dept_select.reload();
			_editAddress = cbb_company_for_book_update.getEl().dom.value;
			bookEditForm.getForm().findField('address').setValue(_editAddress);
		}
	}
});


var cbb_dept_for_book_update = new Ext.form.ComboBox({
	name : '_deptNo',
	editable : false,
	selectOnFocus : true,
	width : 100,
	displayField : 'deptName',
	mode : 'remote',
	store : ds_dept_select,
	triggerAction : 'all',
	loadingText : '加载中...',
	fieldLabel : '所属部门',
	listeners : {
		'beforequery' : function(queryEvent) {
			if (!cbb_company_for_book_update.getValue()) {
				queryEvent.cancel = true;
			}
		},
		'select' : function(combo, record, index) {
			_editAddress += cbb_dept_for_book_update.getValue();
			bookEditForm.getForm().findField('address').setValue(_editAddress);
		}
	}
});



var cbb_company_for_book = new Ext.form.ComboBox({
	name : 'companyName',
	width : 120,
	valueField : 'companyId',
	displayField : 'companyName',
	editable : false,
	selectOnFocus : true,
	mode : 'remote',
	store : ds_company_select,
	triggerAction : 'all',
	loadingText : '加载中...',
	fieldLabel : '所属分公司',
	listeners : {
		'select' : function() {
			cbb_dept_for_book.reset();
			ds_dept_select.baseParams.companyId = cbb_company_for_book.getValue();
			ds_dept_select.reload();
			address = cbb_company_for_book.getEl().dom.value;
			bookForm.getForm().findField('book.address').setValue(address);
		}
	}
});


var cbb_dept_for_book = new Ext.form.ComboBox({
	name : 'deptNo',
	editable : false,
	selectOnFocus : true,
	width : 100,
	displayField : 'deptName',
	mode : 'remote',
	store : ds_dept_select,
	triggerAction : 'all',
	loadingText : '加载中...',
	fieldLabel : '所属部门',
	listeners : {
		'beforequery' : function(queryEvent) {
			if (!cbb_company_for_book.getValue()) {
				queryEvent.cancel = true;
			}
		},
		'select' : function(combo, record, index) {
			address += cbb_dept_for_book.getValue();
			bookForm.getForm().findField('book.address').setValue(address);
		}
	}
});

var bookEditForm = new Ext.FormPanel({
	url : 'updateBook.action',
	labelAlign : 'right',
	labelWidth : 70,
	bodyStyle : 'padding:5px',
	border : false,
	fileUpload : true,
	baseCls : 'x-plain',
	items : [{
		layout : 'column',
		border : false,
		baseCls : 'x-plain',
		items : [{
			columnWidth : .5,
			layout : 'form',
			baseCls : 'x-plain',
			border : false,
			defaultType : 'textfield',
			defaults : {anchor : '93%'},
			items : [{
				xtype : 'hidden',
				name : 'bookId'
			},{
				fieldLabel : '图书名称',
				name : 'bookName',
				allowBlank : false,
				maxLength : 50
			}, {
				xtype : 'combo',
				fieldLabel : '所属分类',
				id : 'category_edit',
				hiddenName : 'categoryId',
				valueField : 'categoryId',
				displayField : 'categoryName',
				mode : 'remote',
				store : new Ext.data.Store({
					autoLoad : true,
					proxy : new Ext.data.HttpProxy({
						url : 'findAllCategoryName.action'
					}),
					reader : new Ext.data.JsonReader({
						root : 'root'
					}, [{name : 'categoryId',type : 'int'},
						{name : 'categoryName',type : 'string'}
					])
				}),
				selectOnFocus : true,
				editable : false,
				triggerAction : 'all',
				loadingText : '加载中...',
				listeners : {
					'select' : function(combo, record, index) {
						this.ownerCt.ownerCt.ownerCt.form.findField('categoryName').setValue(record.data.categoryName);
					}
				}
			},  {xtype : 'hidden',name : 'categoryName'}, 
				{xtype : 'hidden',name : 'imageUrl'},
				{fieldLabel : '作者',name : 'author',maxLength : 50}, 
				{fieldLabel : 'ISBN',name : 'isbn',	maxLength : 50}, 
				{fieldLabel : '字数',	name : 'wordCount',maxLength : 25}, 
				{fieldLabel : '页数',name : 'pageCount',maxLength : 25}, 
				{fieldLabel : '开本',name : 'bookSize',	maxLength : 25}, 
				{fieldLabel : '封面图片',	name : 'upload',inputType : 'file'}]
		}, {
			columnWidth : .5,
			layout : 'form',
			border : false,
			baseCls : 'x-plain',
			defaultType : 'textfield',
			defaults : {anchor : '93%'},
			items : [
				{fieldLabel : '出版社',name : 'press',maxLength : 50}, 
				{fieldLabel : '定价(元)',xtype : 'numberfield',name : 'price',maxValue : 1000}, 
				{fieldLabel : '版次',name : 'editionNo',maxLength : 25}, 
				{fieldLabel : '纸张',name : 'paper',maxLength : 25}, 
				{fieldLabel : '包装',name : 'pack',maxLength : 25}, 
				{xtype : 'hidden',name : 'address',maxLength : 50}, 
				{xtype : 'hidden',value : '1',name : 'state'}, 
				cbb_company_for_book_update, cbb_dept_for_book_update]
		}]
	},{
		xtype : 'panel',
		baseCls : 'x-plain',
		bodyBorder : false,
		layout : 'form',
		defaultType : 'textarea',
		defaults : {anchor:'95%'},
		items : [{fieldLabel : '内容简介',name : 'description',maxLength : 500}, 
				 {fieldLabel : '编辑推荐',name : 'editorRecommend',maxLength : 500}, 
				 {fieldLabel : '作者简介',name : 'authorDesc',maxLength : 500}]
	}],
	buttonAlign : 'center',
	minButtonWidth : 60,
	buttons : [{
		text : '修改',
		handler : function(btn){
			if (bookEditForm.getForm().isValid()) {
				btn.disable();
				bookEditForm.getForm().submit({
					waitTitle : '请稍候',
					waitMsg : '正在修改数据,请稍候...',
					success : function(form,action) {
						Ext.Msg.show({
							title : '成功提示',
							msg : '数据修改成功!',
							buttons : Ext.Msg.OK,
							fn : function(){btn.enable()},
							icon : Ext.Msg.INFO
						});
						var store = grid_book.getStore();
						var book = new Book({
							bookId : form.findField('bookId').getValue(),
							bookName : form.findField('bookName').getValue(),
							categoryId : form.findField('categoryId').getValue(),
							categoryName : Ext.get('category_edit').dom.value,
							author : form.findField('author').getValue(),
							press : form.findField('press').getValue(),
							price : form.findField('price').getValue(),
							editionNo : form.findField('editionNo').getValue(),
							isbn : form.findField('isbn').getValue(),
							wordCount : form.findField('wordCount').getValue(),
							pageCount : form.findField('pageCount').getValue(),
							bookSize : form.findField('bookSize').getValue(),
							paper : form.findField('paper').getValue(),
							pack : form.findField('pack').getValue(),
							imageUrl : action.result.imageUrl,
							address : form.findField('address').getValue(),
							description : form.findField('description').getValue(),
							editorRecommend : form.findField('editorRecommend').getValue(),
							authorDesc : form.findField('authorDesc').getValue(),
							state : form.findField('state').getValue()
						});
						var index = store.indexOf(grid_book.getSelectionModel().getSelected());
						store.remove(grid_book.getSelectionModel().getSelected());
						store.insert(index,book);
						grid_book.getSelectionModel().selectRow(index);
					},
					failure : function(form, action) {
						Ext.Msg.show({
							title : '错误提示',
							msg : action.result.contentTypeIsValid ? '操作失败' : '操作失败,文件类型不正确!',
							buttons : Ext.Msg.OK,
							fn : function() {btn.enable();},
							icon : Ext.Msg.ERROR
						});
					}
				});
			}
		}
	},{
		text : '重置',
		handler : function() {
			var record = grid_book.getSelectionModel().getSelected();
			if(record){
				bookEditForm.getForm().loadRecord(record);
				bookEditForm.getForm().findField('_companyName').setValue('');
				bookEditForm.getForm().findField('_deptNo').setValue('');
				bookEditForm.getForm().findField('upload').setValue('');
			}
		}
	}, {
		text : '取消',
		handler : function() {this.ownerCt.ownerCt.hide();}
	}]
});

var ds_user_select = new Ext.data.Store({
	url : 'findUserByExample.action',
	reader : new Ext.data.JsonReader({
		root : 'root'
	}, [{name : 'userId',type : 'int'}, 
		{name : 'emplName',type : 'string'}
	])
})
		 
var loanLogForm = new Ext.FormPanel({
	url : 'saveLoanLog.action',
	labelAlign : 'right',
	labelWidth : 80,
	bodyStyle : 'padding:5px',
	border : false,
	baseCls : 'x-plain',
	defaultType : 'combo',
	defaults : {anchor:'95%'},
	items : [
	   {xtype : 'hidden',name : 'loanLog.bookId'},
	   {xtype : 'hidden',name : 'loanLog.bookName',id:'bookName'},
	   {xtype : 'textfield',fieldLabel : '图书名称',name : '_bookName',disabled:true},
	   {fieldLabel : '借出天数',
		valueField : 'loanDays',
		displayField : 'loanDays',
		hiddenName : 'loanLog.loanDays', 
		mode : 'local',
		triggerAction : 'all',
		editable : false,
		allowBlank : false,
		store : new Ext.data.SimpleStore({
	        fields: ['loanDays', 'loanDays'],
	        data : [['1','1'],['2','2'],['3','3'],['4','4'],['5','5'],['6','6'],['7','7'],['8','8'],['9','9'],['10','10'],['11','11'],['12','12'],['13','13'],['14','14'],['15','15'],['16','16'],['17','17'],['18','18'],['19','19'],['20','20'],['21','21'],['22','22'],['23','23'],['24','24'],['25','25'],['26','26'],['27','27'],['28','28'],['29','29'],['30','30']]}),
	    listeners : {
	    	'select': function(combo, record){
				var dt = new Date().add(Date.DAY,new Number(record.data.loanDays));
	    		loanLogForm.getForm().findField('_preReturnTime').setValue(dt.format('Y-m-d'));
	    		loanLogForm.getForm().findField('loanLog.preReturnTime').setValue(dt.format('Y-m-d'));
	    	}
	    }},
	    {xtype : 'hidden',name : 'loanLog.preReturnTime'},
	    {xtype : 'textfield',fieldLabel : '预计还书日期',name:'_preReturnTime',disabled : true},
	    {fieldLabel : '所属分公司',
		 name : 'companyName',
		 editable : false,
		 valueField : 'companyId',
		 displayField : 'companyName',
		 mode : 'remote',
		 store : ds_company_select,
		 triggerAction : 'all',
		 loadingText : '加载中...',
		 listeners : {
		 	'select': function(combo,record){
		 		loanLogForm.getForm().findField('deptNo').reset();
		 		loanLogForm.getForm().findField('loanLog.reader').reset();
		 		ds_dept_select.baseParams.companyId = record.data.companyId;
				ds_dept_select.reload();
				ds_user_select.removeAll();
		 	}
		 }},
		{fieldLabel : '所属部门',
		 name : 'deptNo',
		 editable : false,
		 valueField : 'deptId',
		 displayField : 'deptName',
		 mode : 'remote',
		 store : ds_dept_select,
		 triggerAction : 'all',
		 loadingText : '加载中...',
		 listeners : {
			 'beforequery' : function(queryEvent) {
				if (!this.ownerCt.form.findField('companyName').getValue()) {
					queryEvent.cancel = true;
				}
			 },
			 'select' : function(combo, record) {
			 	loanLogForm.getForm().findField('loanLog.reader').reset();
			 	ds_user_select.baseParams['user.deptId'] = record.data.deptId;
			 	ds_user_select.reload();
			 }
		 }
		},{xtype:'hidden',name:'loanLog.readerId'},
		{fieldLabel : '借书人',
		 hiddenName : 'loanLog.reader',
		 editable : false,
		 allowBlank : false,
		 displayField : 'emplName',
		 mode : 'local',
		 triggerAction : 'all',
		 loadingText : '加载中...',
		 store : ds_user_select,
		 listeners : {
		 	'select' : function(combo,record){
		 		loanLogForm.getForm().findField('loanLog.readerId').setValue(record.data.userId);
		 	}
		 }
		}
	  ],
	buttonAlign : 'right',
	minButtonWidth : 60,
	buttons : [{
		text:'借出',
		handler : function(){
			if(this.ownerCt.getForm().isValid()){
				Ext.Msg.confirm('操作提示','确认借出?',function(btn){
					if('yes' == btn){
						loanLogForm.getForm().submit({
							success: function(form){
								Ext.Msg.show({
									title : '成功提示',
									msg : '[' + form.findField('loanLog.bookName').getValue() + '] 成功借出!',
									icon :　Ext.Msg.INFO,
									buttons : Ext.Msg.OK,
									fn:function(){
										window_loan_book.hide();
										var record = grid_book.getSelectionModel().getSelected();
										record.set('state',0);
										grid_book.fireEvent('rowclick',grid_book,grid_book.getStore().indexOf(record));
									}
								});
							},
							failure : function(form,action){
								Ext.Msg.show({
									title : '错误提示',
									msg : '[' + form.findField('loanLog.bookName').getValue() + '] 借出失败!',
									icon :　Ext.Msg.ERROR,
									buttons : Ext.Msg.OK
								});
							}
						});
					}
				});
			}
		}
	},{
		text : '取消',
		handler:function(){
			this.ownerCt.ownerCt.hide();
		}
	}]
});

var bookForm = new Ext.FormPanel({
	url : 'saveBook.action',
	labelAlign : 'right',
	labelWidth : 70,
	bodyStyle : 'padding:5px',
	border : false,
	fileUpload : true,
	baseCls : 'x-plain',
	items : [{
		layout : 'column',
		border : false,
		baseCls : 'x-plain',
		items : [{
			columnWidth : .5,
			layout : 'form',
			baseCls : 'x-plain',
			border : false,
			defaultType : 'textfield',
			defaults : {anchor : '93%'},
			items : [{
				fieldLabel : '图书名称',
				id : 'book.bookName',
				name : 'book.bookName',
				allowBlank : false,
				maxLength : 50
			}, {
				xtype : 'combo',
				fieldLabel : '所属分类',
				id : 'category',
				hiddenName : 'book.categoryId',
				valueField : 'categoryId',
				displayField : 'categoryName',
				mode : 'remote',
				store : ds_category_select,
				selectOnFocus : true,
				editable : false,
				triggerAction : 'all',
				loadingText : '加载中...',
				listeners : {
					'select' : function(combo, record, index) {
						this.ownerCt.ownerCt.ownerCt.form.findField('book.categoryName').setValue(record.data.categoryName);
					}
				}
			},  {xtype : 'hidden',name : 'book.categoryName'}, 
				{fieldLabel : '作者',name : 'book.author',maxLength : 50}, 
				{fieldLabel : 'ISBN',name : 'book.isbn',	maxLength : 50}, 
				{fieldLabel : '字数',	name : 'book.wordCount',maxLength : 25}, 
				{fieldLabel : '页数',name : 'book.pageCount',maxLength : 25}, 
				{fieldLabel : '开本',name : 'book.bookSize',	maxLength : 25}, 
				{fieldLabel : '封面图片',	name : 'upload',inputType : 'file'}]
		}, {
			columnWidth : .5,
			layout : 'form',
			border : false,
			baseCls : 'x-plain',
			defaultType : 'textfield',
			defaults : {anchor : '93%'},
			items : [
				{fieldLabel : '出版社',name : 'book.press',maxLength : 50}, 
				{fieldLabel : '定价(元)',xtype : 'numberfield',name : 'book.price',maxValue : 1000}, 
				{fieldLabel : '版次',name : 'book.editionNo',maxLength : 25}, 
				{fieldLabel : '纸张',name : 'book.paper',maxLength : 25}, 
				{fieldLabel : '包装',name : 'book.pack',maxLength : 25}, 
				{xtype : 'hidden',name : 'book.address',maxLength : 50}, 
				{xtype : 'hidden',value : '1',name : 'book.state'}, 
				cbb_company_for_book, cbb_dept_for_book]
		}]
	}, {
		xtype : 'tabpanel',
		plain : true,
		bodyBorder : false,
		activeTab : 0,
		height : 200,
		defaults : {bodyStyle : 'padding:2px'},
		items : [
			{title : '内容简介',layout : 'fit',items : {xtype : 'textarea',name : 'book.description',maxLength : 500}}, 
			{title : '编辑推荐',layout : 'fit',items : {xtype : 'textarea',name : 'book.editorRecommend',maxLength : 500}}, 
			{title : '作者简介',layout : 'fit',items : {xtype : 'textarea',name : 'book.authorDesc',maxLength : 500}
		}]
	}],
	buttonAlign : 'center',
	minButtonWidth : 60,
	buttons : [{
		text : '添加',
		handler : function(btn) {
			if (bookForm.getForm().isValid()) {
				btn.disable();
				var bnfield = bookForm.getForm().findField('book.bookName');
				bookForm.getForm().submit({
					waitTitle : '请稍候',
					waitMsg : '正在提交表单数据,请稍候...',
					success : function(form, action) {
						var store = grid_book.getStore();
						if (store.data.length <= 20) {
							var description = '', editorRecommend = '', authorDesc = '';
							if (form.findField('book.description')) {
								description = form.findField('book.description').getValue();
							}
							if (form.findField('book.editorRecommend')) {
								editorRecommend = form.findField('book.editorRecommend').getValue();
							}
							if (form.findField('book.authorDesc')) {
								authorDesc = form.findField('book.authorDesc').getValue();
							}
							var book = new Book({
								bookId : action.result.bookId,
								bookName : bnfield.getValue(),
								categoryId : form.findField('book.categoryId').getValue(),
								categoryName : Ext.get('category').dom.value,
								author : form.findField('book.author').getValue(),
								press : form.findField('book.press').getValue(),
								price : form.findField('book.price').getValue(),
								editionNo : form.findField('book.editionNo').getValue(),
								isbn : form.findField('book.isbn').getValue(),
								wordCount : form.findField('book.wordCount').getValue(),
								pageCount : form.findField('book.pageCount').getValue(),
								bookSize : form.findField('book.bookSize').getValue(),
								paper : form.findField('book.paper').getValue(),
								pack : form.findField('book.pack').getValue(),
								imageUrl : action.result.imageUrl,
								address : form.findField('book.address').getValue(),
								description : description,
								editorRecommend : editorRecommend,
								authorDesc : authorDesc,
								state : form.findField('book.state').getValue()
							});
							store.insert(0, [book]);
							if (store.data.length > 20) {
								store.remove(store.getAt(store.data.length- 1));
							}
						}
						Ext.Msg.show({
							title : '提示',
							msg : '[ ' + bnfield.getValue() + ' ]   添加成功!!',
							buttons : Ext.MessageBox.OK,
							icon : Ext.Msg.INFO
						});
						bnfield.reset();
						btn.enable();
					},
					failure : function(form, action) {
						Ext.Msg.show({
							title : '错误提示',
							msg : action.result.contentTypeIsValid ? '操作失败' : '操作失败,文件类型不正确!',
							buttons : Ext.Msg.OK,
							fn : function() {bnfield.focus(true);btn.enable();},
							icon : Ext.Msg.ERROR
						});
					}
				});
			}
		}
	}, {
		text : '重置',
		handler : function() {this.ownerCt.form.reset();}
	}, {
		text : '取消',
		handler : function() {this.ownerCt.ownerCt.hide();}
	}]
});

var window_edit_book = new Ext.Window({
	title : '编辑图书信息',
	width : 620,
	resizable : false,
	autoHeight : true,
	modal : true,
	closeAction : 'hide',
	items : [bookEditForm]
	
});

var window_loan_book = new Ext.Window({
	title : '借书管理',
	width : 400,
	resizable : false,
	autoHeight : true,
	modal : true,
	closeAction : 'hide',
	listeners : {
		'hide' : function(){
			this.findById('bookName').ownerCt.form.reset();			
		}
	},
	items : [loanLogForm]
});

var window_add_book = new Ext.Window({
	title : '添加图书',
	width : 600,
	resizable : false,
	autoHeight : true,
	modal : true,
	closeAction : 'hide',
	listeners : {
		'hide' : function() {
			this.findById('book.bookName').ownerCt.ownerCt.ownerCt.form.reset();
		}
	},
	items : [bookForm]
});

var btn_loan_book = new Ext.Button({
	text : '借书管理',
	handler : function(){
		var record = grid_book.getSelectionModel().getSelected();
		if(record){
			window_loan_book.show();
			loanLogForm.getForm().findField('loanLog.bookId').setValue(record.data.bookId);
			loanLogForm.getForm().findField('loanLog.bookName').setValue(record.data.bookName);
			loanLogForm.getForm().findField('_bookName').setValue(record.data.bookName);
		}
	}
});

var btn_return_book = new Ext.Button({
	text : '确认还书',
	handler : function(){
		var record = grid_book.getSelectionModel().getSelected();
		if(record){
			var bookId = record.data.bookId;
			Ext.Ajax.request({
				url: 'returnBook.action',
   				success: function(){
   					Ext.Msg.show({
						title : '成功提示',
						msg : '还书操作成功!',
						buttons : Ext.Msg.OK,
						icon : Ext.Msg.INFO,
						fn : function(){
							record.set('state',1);
							record.set('currentReader',''),
							grid_book.fireEvent('rowclick',grid_book,grid_book.getStore().indexOf(record));
						}
					});
   				},
   				failure: function(){
   					Ext.Msg.show({
						title : '错误提示',
						msg : '还书操作失败!',
						buttons : Ext.Msg.OK,
						icon : Ext.Msg.ERROR
					});
   				},
   				params: { bookId: bookId}
			});
		}
	}
});

var btn_add_book = new Ext.Button({
	text : '添加图书',
	iconCls : 'icon-add',
	handler : function() {
		window_add_book.show();
	}
});

var btn_edit_book = new Ext.Button({
	text : '编辑图书',
	iconCls : 'icon-edit',
	handler : function(){
		var record = grid_book.getSelectionModel().getSelected();
		if(record){
			window_edit_book.show();
			bookEditForm.getForm().loadRecord(record);
		}
	}
})

var btn_del_book = new Ext.Button({
	text : '删除图书',
	iconCls : 'icon-del',
	handler : function() {
		var record = grid_book.getSelectionModel().getSelected();
		if (record) {
			Ext.Msg.confirm('确认删除', '你确定删除该条记录?', function(btn) {
				if (btn == 'yes') {
					Ext.Ajax.request({
						url : 'deleteBook.action',
						params : {bookId : record.data.bookId},
						success : function() {grid_book.getStore().remove(record);},
						failure : function() {
							Ext.Msg.show({
								title : '错误提示',
								msg : '删除时发生错误!',
								buttons : Ext.Msg.OK,
								icon : Ext.Msg.ERROR
							});
						}
					});
				}
			});
		}
	}
});

var searchBook = function() {
	ds_book.baseParams.conditions = text_search_book.getValue();
	ds_book.load({params : {start : 0,limit : 20}
	});
}

var ds_book = new Ext.data.Store({
	url : 'findAllBook.action',
	reader : new Ext.data.JsonReader(
		{totalProperty : 'totalProperty',root : 'root'}, 
	   [{name : 'bookId',type : 'int'}, 
		{name : 'bookName',type : 'string'}, 
		{name : 'author',type : 'string'}, 
		{name : 'press',type : 'string'},
		{name : 'price',type : 'string'}, 
		{name : 'editionNo',type : 'string'},
		{name : 'isbn',type : 'string'},
		{name : 'categoryId',type : 'int'},
		{name : 'categoryName',type : 'string'},
		{name : 'wordCount',type : 'string'},
		{name : 'pageCount',type : 'string'},
		{name : 'bookSize',type : 'string'},
		{name : 'paper',type : 'string'},
		{name : 'pack',type : 'string'},
		{name : 'imageUrl',type : 'string'},
		{name : 'address',type : 'string'},
		{name : 'editorRecommend',type : 'string'},
		{name : 'description',type : 'string'},
		{name : 'authorDesc',type : 'string'},
		{name : 'state',type : 'int'},
		{name : 'currentReaderId',type : 'int'},
		{name : 'currentReader',type : 'string'},
		{name : 'logId',type : 'int'}
	])
});

var btn_search_book = new Ext.Button({
	text : '查询',
	iconCls : 'icon-search',
	handler : searchBook
});

var text_search_book = new Ext.form.TextField({
	name : 'textSearchBook',
	width : 200,
	emptyText : '多条件可用逗号或者空格隔开!',
	listeners : {
		'specialkey' : function(field, e) {
			if (e.getKey() == Ext.EventObject.ENTER) {
				searchBook();
			}
		}
	}
});

var grid_book = new Ext.grid.GridPanel({
	region : 'center',
	loadMask : {msg : '数据加载中...'},
	enableColumnMove : false,
	cm : cm_book,
	ds : ds_book,
	sm : new Ext.grid.RowSelectionModel({singleSelect : true}),
	autoExpandColumn : 'address',
	viewConfig : {forceFit : true},
	plugins : expander,
	tbar : [btn_add_book, '-',btn_edit_book, '-', btn_del_book, '-', 
		  	text_search_book,btn_search_book,'->',btn_loan_book,'-',btn_return_book],
	bbar : new Ext.PagingToolbar({
		pageSize : 20,
		store : ds_book,
		displayInfo : true,
		displayMsg : '第 {0} - {1} 条 共 {2} 条',
		emptyMsg : "没有记录"
	}),
	listeners : {
		'rowdblclick':function(grid, rowIndex){
			ds_loanlog.baseParams.bookId = grid.getStore().getAt(rowIndex).data.bookId;
			ds_loanlog.load({params : {start : 0,limit : 10}});
		},
		'rowclick':function(grid,rowIndex){
			btn_loan_book.setDisabled(grid.getStore().getAt(rowIndex).data.state == 0 ? true:false);
			btn_return_book.setDisabled(grid.getStore().getAt(rowIndex).data.state == 1 ? true:false);
		}
	}
});

var ds_loanlog =  new Ext.data.Store({
	url : 'findAllLoanLog.action',
	sortInfo : {field: 'loanTime', direction: 'DESC'},
	reader : new Ext.data.JsonReader(
		{totalProperty : 'totalProperty',root : 'root'}, 
	   [{name : 'logId',type : 'int'}, 
		{name : 'bookId',type : 'int'}, 
		{name : 'bookName',type : 'string'}, 
		{name : 'loanTime'},
		{name : 'loanDays',type : 'int'}, 
		{name : 'preReturnTime'},
		{name : 'returnTime'},
		{name : 'readerId',type : 'int'},
		{name : 'reader',type : 'string'},
		{name : 'loannerId',type : 'int'},
		{name : 'loanner',type : 'string'}]
	)
});

var dateFormat = function(v){
	if(v){
		return v.substring(0,10)
	}
	return '未归还';
}

LoanLogPanel = Ext.extend(Ext.grid.GridPanel,{
	constructor:function(){
		LoanLogPanel.superclass.constructor.call(this,{
		loadMask : {msg : '数据加载中...'},
			cm : new Ext.grid.ColumnModel([ 
				{header : '图书名称',	width : 120,dataIndex : 'bookName',id : 'bookName',sortable : true}, 
				{header : '借书人',	width : 90,	dataIndex : 'reader',sortable : true},
				{header : '借出时间',width : 100,	dataIndex : 'loanTime',renderer: dateFormat,sortable : true}, 
				{header : '借出天数',width : 100,	dataIndex : 'loanDays',sortable : true}, 
				{header : '预计还书时间',	width : 100,dataIndex : 'preReturnTime',renderer: dateFormat,sortable : true}, 
				{header : '实际还书时间',	width : 100,dataIndex : 'returnTime',renderer:dateFormat,sortable : true}, 
				{header : '管理员',	width : 100,dataIndex : 'loanner',menuDisabled : true}]
			),
			autoExpandColumn : 'bookName',
			ds : ds_loanlog,
			sm : new Ext.grid.RowSelectionModel({singleSelect : true}),
			bbar : new Ext.PagingToolbar({
					pageSize : 10,
					store : ds_loanlog,
					displayInfo : true,
					displayMsg : '第 {0} - {1} 条 共 {2} 条',
					emptyMsg : "没有记录"}
			)
		});
	}
});


var book_panel = new Ext.Panel({
	title : '图书管理',
	iconCls : 'icon-plugin',
	region : 'center',
	border : 'layout',
	frame : true,
	layout:'border',
	defaults: {
	    collapsible: true,
	    split: true
	},
	items: [{
	    region:'center',
	    layout : 'border',
	    items : [grid_book]
	},{
	    region: 'south',
	    layout :'fit',
		title : '图书借还记录',
	    height: 250,
	    minSize: 150,
	    maxSize: 286,
	    items : [new LoanLogPanel()]
	}]
});
var p_book = {
	id : 'book-panel',
	border : false,
	layout : 'border',
	items : [book_panel]
}
