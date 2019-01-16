var Company = Ext.data.Record.create([{
	name : 'companyId',
	mapping : 'companyId',
	type : 'int'
}, {
	name : 'companyName',
	mapping : 'companyName',
	type : 'string'
}, {
	name : 'address',
	mapping : 'address',
	type : 'string'
}, {
	name : 'tellPhone',
	mapping : 'tellPhone',
	type : 'string'
}, {
	name : 'leader',
	mapping : 'leader',
	type : 'string'
}, {
	name : 'mobilePhone',
	mapping : 'mobilePhone',
	type : 'string'
}, {
	name : 'remark',
	mapping : 'remark',
	type : 'string'
}]);

var cm_company = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
	header : '公司名称',
	width : 90,
	sortable : true,
	dataIndex : 'companyName',
	editor : new Ext.form.TextField({
		allowBlank : false,
		maxLength : 50
	})
}, {
	header : '公司地址',
	width : 200,
	dataIndex : 'address',
	menuDisabled : true,
	editor : new Ext.form.TextField({
		maxLength : 70
	})
}, {
	header : '公司电话',
	width : 85,
	dataIndex : 'tellPhone',
	menuDisabled : true,
	resizable : false,
	editor : new Ext.form.TextField({
		maxLength : 20
	})
}, {
	header : '负责人',
	width : 60,
	dataIndex : 'leader',
	resizable : false,
	editor : new Ext.form.TextField({
		allowBlank : false,
		maxLength : 20
	})
}, {
	header : '联系电话',
	width : 85,
	dataIndex : 'mobilePhone',
	resizable : false,
	menuDisabled : true,
	editor : new Ext.form.TextField({
		maxLength : 20
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

cm_company.defaultSortable = false;

var window_add_company = new Ext.Window({
	title : '添加分公司',
	width : 350,
	height : 440,
	resizable : false,
	autoHeight : true,
	modal : true,
	closeAction : 'hide',
	listeners : {
		'hide' : function() {
			this.setTitle('添加分公司');
			this.findById('company.companyName').ownerCt.form.reset();
		}
	},
	items : [new Ext.FormPanel({
		labelWidth : 70,
		labelAlign : 'right',
		url : 'saveCompany.action',
		border : false,
		baseCls : 'x-plain',
		bodyStyle : 'padding:5px 5px 0',
		anchor : '100%',
		defaults : {
			width : 233,
			msgTarget : 'side' // 验证信息显示右边
		},
		defaultType : 'textfield',
		items : [{
			fieldLabel : '公司名称',
			id : 'company.companyName',
			name : 'company.companyName',
			allowBlank : false,
			maxLength : 50
		}, {
			fieldLabel : '公司地址',
			name : 'company.address',
			maxLength : 70
		}, {
			fieldLabel : '公司电话',
			name : 'company.tellPhone',
			maxLength : 20
		}, {
			fieldLabel : '负责人',
			name : 'company.leader',
			allowBlank : false,
			maxLength : 20
		}, {
			fieldLabel : '联系电话',
			name : 'company.mobilePhone',
			maxLength : 20
		}, {
			fieldLabel : '备注',
			name : 'company.remark',
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
					var cnfield = frm.findField('company.companyName'); // 获得公司名称输入框
					frm.submit({
						waitTitle : '请稍候',
						waitMsg : '正在提交表单数据,请稍候...',
						success : function(form, action) {
							var store = grid_company.getStore();
							if (store.data.length <= 20) {
								var company = new Company({
									companyId : action.result.companyId,
									companyName : cnfield.getValue(),
									address : form.findField('company.address').getValue(),
									tellPhone : form.findField('company.tellPhone').getValue(),
									leader : form.findField('company.leader').getValue(),
									mobilePhone : form.findField('company.mobilePhone').getValue(),
									remark : form.findField('company.remark').getValue()
								});
								store.insert(0, [company]);
								if (store.data.length > 20) {
									store.remove(store.getAt(store.data.length - 1));
								}
							}
							window_add_company.setTitle('[ ' + cnfield.getValue() + ' ]   添加成功!!');
							cnfield.reset();
							btn.enable();
						},
						failure : function() {
							Ext.Msg.show({
								title : '错误提示',
								msg : '"' + cnfield.getValue() + '" ' + '名称可能已经存在!',
								buttons : Ext.Msg.OK,
								fn : function() {
									cnfield.focus(true);
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

var btn_add_company = new Ext.Button({
	text : '添加分公司',
	iconCls : 'icon-add',
	handler : function() {
		window_add_company.show();
	}
});

var btn_del_company = new Ext.Button({
	text : '删除分公司',
	iconCls : 'icon-del',
	handler : function() {
		var record = grid_company.getSelectionModel().getSelected();
		if (record) {
			Ext.Msg.confirm('确认删除', '你确定删除该条记录?', function(btn) {
				if (btn == 'yes') {
					Ext.Ajax.request({
						url : 'deleteCompany.action',
						params : {
							companyId : record.data.companyId
						},
						success : function() {
							grid_company.getStore().remove(record);
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

var text_search_company = new Ext.form.TextField({
	name : 'textSearchCompany',
	width : 200,
	emptyText : '多条件可用逗号或者空格隔开!',
	listeners : {
		'specialkey' : function(field, e) {
			if (e.getKey() == Ext.EventObject.ENTER) {
				searchCompany();
			}
		}
	}
});

// grid的查找方法
var searchCompany = function() {
	// 传参数一定要用这种方式,否则翻页的时候不会根据这些参数查询
	ds_company.baseParams.conditions = text_search_company.getValue();
	ds_company.load({
		params : {
			start : 0,
			limit : 20
		}
	});
}

var btn_search_company = new Ext.Button({
	text : '查询',
	iconCls : 'icon-search',
	handler : searchCompany
});

var ds_company = new Ext.data.Store({
	proxy : new Ext.data.HttpProxy({
		url : 'findAllCompany.action'
	}),
	reader : new Ext.data.JsonReader({
		totalProperty : 'totalProperty',
		root : 'root'
	}, [{
		name : 'companyId',
		type : 'int'
	}, {
		name : 'companyName',
		type : 'string'
	}, {
		name : 'address',
		type : 'string'
	}, {
		name : 'tellPhone',
		type : 'string'
	}, {
		name : 'leader',
		type : 'string'
	}, {
		name : 'mobilePhone',
		type : 'string'
	}, {
		name : 'remark',
		type : 'string'
	}])
});

var grid_company = new Ext.grid.EditorGridPanel({
	title : '分公司管理',
	iconCls : 'icon-grid',
	loadMask : {msg : '数据加载中...'},
	region : 'center',
	cm : cm_company,
	ds : ds_company,
	sm : new Ext.grid.RowSelectionModel({singleSelect : true}),
	enableColumnMove : false,
	trackMouseOver : false,
	frame : true,
	autoExpandColumn : 'remark',
	clicksToEdit : 1,
	tbar : [btn_add_company, '-', btn_del_company, '-', text_search_company, btn_search_company],
	bbar : new Ext.PagingToolbar({
		pageSize : 20,
		store : ds_company,
		displayInfo : true,
		displayMsg : '第 {0} - {1} 条  共 {2} 条',
		emptyMsg : "没有记录"
	}),
	listeners : {
		'afteredit' : function(e) {
			Ext.Ajax.request({
				url : 'updateCompany.action',
				params : {
					fieldName : e.field,
					fieldValue : e.value,
					companyId : e.record.data.companyId
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

var p_company = {
	id : 'company-panel',
	border : false,
	layout : 'border',
	items : [grid_company]
};