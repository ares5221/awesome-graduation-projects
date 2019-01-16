// --------------分类相关--------------
var Category = Ext.data.Record.create([{
	name : 'categoryId',
	mapping : 'categoryId',
	type : 'int'
}, {
	name : 'categoryName',
	mapping : 'categoryName',
	type : 'string'
}, {
	name : 'subjectId',
	mapping : 'subjectId',
	type : 'int'
}, {
	name : 'subjectName',
	mapping : 'subjectName',
	type : 'string'
}, {
	name : 'remark',
	mapping : 'remark',
	type : 'string'
}]);

var subjectId;

var ds_subject_select = new Ext.data.Store({
	proxy : new Ext.data.HttpProxy({
		url : 'findAllSubject.action'
	}),
	reader : new Ext.data.JsonReader({
		root : 'root'
	}, [{
		name : 'subjectId',
		type : 'int'
	}, {
		name : 'subjectName',
		type : 'string'
	}])
});

var cm_category = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
	header : '分类名称',
	width : 90,
	dataIndex : 'categoryName',
	sortable : true,
	editor : new Ext.form.TextField({
		allowBlank : false,
		maxLength : 50
	})
}, {
	header : '所属科目',
	width : 90,
	sortable : true,
	dataIndex : 'subjectName',
	editor : new Ext.form.ComboBox({
		store : ds_subject_select,
		displayField : 'subjectName',
		valueField : 'subjectName',
		mode : 'remote',
		allowBlank : false,
		editable : false,
		triggerAction : 'all',
		listWidth : 130,
		listeners : {
			'select' : function(combo, record, index) {
				subjectId = record.data.subjectId;
			}
		}
	})
}, {
	header : '备注',
	id : 'remark',
	dataIndex : 'remark',
	menuDisabled : true,
	editor : new Ext.form.TextField({
		maxLength : 200
	})
}]);

cm_category.defaultSortable = false;

var window_add_category = new Ext.Window({
	title : '添加分类',
	width : 350,
	height : 440,
	resizable : false,
	autoHeight : true,
	modal : true,
	closeAction : 'hide',
	listeners : {
		'hide' : function() {
			this.setTitle('添加分类');
			this.findById('category.categoryName').ownerCt.form.reset();
		}
	},
	items : [new Ext.FormPanel({
		labelWidth : 70,
		labelAlign : 'right',
		url : 'saveCategory.action',
		border : false,
		baseCls : 'x-plain',
		bodyStyle : 'padding:5px 5px 0',
		anchor : '100%',
		defaults : {
			width : 233,
			msgTarget : 'side'
		},
		defaultType : 'textfield',
		items : [{
			fieldLabel : '分类名称',
			id : 'category.categoryName',
			name : 'category.categoryName',
			allowBlank : false,
			maxLength : 50
		}, {
			xtype : 'combo',
			fieldLabel : '所属科目',
			id : 'subject',
			hiddenName : 'category.subjectId',
			valueField : 'subjectId',
			displayField : 'subjectName',
			mode : 'remote',
			store : ds_subject_select,
			selectOnFocus : true,
			editable : false,
			allowBlank : false,
			triggerAction : 'all',
			loadingText : '加载中...',
			emptyText : '科目名称',
			listeners : { // 获得下拉文本内容,解决id,value都要的情况
				'select' : function(combo, record, index) {
					this.ownerCt.form.findField('category.subjectName').setValue(record.data.subjectName);
				}
			}
		}, {
			xtype : 'hidden',
			name : 'category.subjectName'
		}, {
			fieldLabel : '备注',
			name : 'category.remark',
			xtype : 'textarea',
			maxLength : 200
		}],
		buttonAlign : 'right',
		minButtonWidth : 60,
		buttons : [{
			text : '添加',
			handler : function(btn) {
				var frm = this.ownerCt.form;
				if (frm.isValid()) {
					btn.disable();
					var dnfield = frm.findField('category.categoryName');
					frm.submit({
						waitTitle : '请稍候',
						waitMsg : '正在提交表单数据,请稍候...',
						success : function(form, action) {
							var store = grid_category.getStore();
							if (store.data.length <= 20) {
								var category = new Category({
									categoryId : action.result.categoryId,
									categoryName : dnfield.getValue(),
									subjectId : form.findField('category.subjectId').getValue(),
									subjectName : Ext.get('subject').dom.value,
									remark : form.findField('category.remark').getValue()
								});
								store.insert(0, [category]);
								if (store.data.length > 20) {
									store.remove(store.getAt(store.data.length - 1));
								}
							}
							window_add_category.setTitle('[ ' + dnfield.getValue() + ' ]   添加成功!!');
							dnfield.reset();
							btn.enable();
						},
						failure : function() {
							Ext.Msg.show({
								title : '错误提示',
								msg : '"' + dnfield.getValue() + '" ' + '名称可能已经存在!',
								buttons : Ext.Msg.OK,
								fn : function() {
									dnfield.focus(true);
									btn.enable();
								},
								icon : Ext.Msg.ERROR
							});
						}
					});
				}
			}
		}, {
			text : '重置',
			handler : function() {
				this.ownerCt.form.reset();
			}
		}, {
			text : '取消',
			handler : function() {
				this.ownerCt.ownerCt.hide();
			}
		}]
	})]
});

var btn_add_category = new Ext.Button({
	text : '添加分类',
	iconCls : 'icon-add',
	handler : function() {
		window_add_category.show();
	}
});

var btn_del_category = new Ext.Button({
	text : '删除分类',
	iconCls : 'icon-del',
	handler : function() {
		var record = grid_category.getSelectionModel().getSelected();
		if (record) {
			Ext.Msg.confirm('确认删除', '你确定删除该条记录?', function(btn) {
				if (btn == 'yes') {
					Ext.Ajax.request({
						url : 'deleteCategory.action',
						params : {
							categoryId : record.data.categoryId
						},
						success : function() {
							grid_category.getStore().remove(record);
						},
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

var searchCategory = function() {
	ds_category.baseParams.conditions = text_search_category.getValue();// + ','
																		// +
																		// cbb_company_for_dept.getValue();
	ds_category.load({
		params : {
			start : 0,
			limit : 20
		}
	});
}

var btn_search_category = new Ext.Button({
	text : '查询',
	iconCls : 'icon-search',
	handler : searchCategory
});

var cbb_subject_for_category = new Ext.form.ComboBox({
	name : 'subjectName',
	width : 120,
	displayField : 'subjectName',
	mode : 'remote',
	store : ds_subject_select,
	selectOnFocus : true,
	triggerAction : 'all',
	loadingText : '加载中...',
	emptyText : '科目名称'
});

var text_search_category = new Ext.form.TextField({
	name : 'textSearchCategory',
	width : 200,
	emptyText : '多条件可用逗号或者空格隔开!',
	listeners : {
		'specialkey' : function(field, e) {
			if (e.getKey() == Ext.EventObject.ENTER) {
				searchCategory();
			}
		}
	}
});

var ds_category = new Ext.data.Store({
	proxy : new Ext.data.HttpProxy({
		url : 'findAllCategory.action'
	}),
	reader : new Ext.data.JsonReader({
		totalProperty : 'totalProperty',
		root : 'root'
	}, [{
		name : 'categoryId',
		type : 'int'
	}, {
		name : 'categoryName',
		type : 'string'
	}, {
		name : 'subjectId',
		type : 'int'
	}, {
		name : 'subjectName',
		type : 'string'
	}, {
		name : 'remark',
		type : 'string'
	}])
});

var grid_category = new Ext.grid.EditorGridPanel({
	title : '分类管理',
	iconCls : 'icon-plugin',
	region : 'center',
	loadMask : {
		msg : '数据加载中...'
	},
	cm : cm_category,
	ds : ds_category,
	sm : new Ext.grid.RowSelectionModel({
		singleSelect : true
	}),
	enableColumnMove : false,
	trackMouseOver : false,
	frame : true,
	autoExpandColumn : 'remark',
	clicksToEdit : 1,
	tbar : [btn_add_category, '-', btn_del_category, '-', // cbb_company_for_dept,
															// '-',
															// '&nbsp;&nbsp;',
			text_search_category, btn_search_category],
	bbar : new Ext.PagingToolbar({
		pageSize : 20,
		store : ds_category,
		displayInfo : true,
		displayMsg : '第 {0} - {1} 条  共 {2} 条',
		emptyMsg : "没有记录"
	}),
	listeners : {
		'afteredit' : function(e) {
			Ext.Ajax.request({
				url : 'updateCategory.action',
				params : {
					fieldName : e.field,
					fieldValue : e.value,
					subjectId : e.field == 'subjectName' ? subjectId : null,
					categoryId : e.record.data.categoryId
				},
				success : function() {
					// alert("数据修改成功！");
				},
				failure : function() {
					Ext.Msg.show({
						title : '错误提示',
						msg : '修改数据发生错误,操作将被回滚!',
						fn : function() {
							e.record.set(e.field, e.originalValue);
						},
						buttons : Ext.Msg.OK,
						icon : Ext.Msg.ERROR
					});
				}
			});
		}
	}
});

var p_category = {
	id : 'category-panel',
	border : false,
	layout : 'border',
	items : [grid_category]
}
