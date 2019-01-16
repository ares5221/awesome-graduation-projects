var Dept = Ext.data.Record.create([{
	name : 'deptId',
	mapping : 'deptId',
	type : 'int'
}, {
	name : 'deptName',
	mapping : 'deptName',
	type : 'string'
}, {
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

var ds_company_select = new Ext.data.Store({
	url : 'findAllCompanyName.action',
	reader : new Ext.data.JsonReader({
		root : 'root'
	}, [{
		name : 'companyId',
		type : 'int'
	}, {
		name : 'companyName',
		type : 'string'
	}])
});

var cm_dept = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
	header : '部门名称',
	width : 90,
	dataIndex : 'deptName',
	sortable : true,
	editor : new Ext.form.TextField({
		allowBlank : false,
		maxLength : 50
	})
}, {
	header : '所属分公司',
	width : 90,
	sortable : true,
	dataIndex : 'companyName',
	editor : new Ext.form.ComboBox({
		store : ds_company_select,
		displayField : 'companyName',
		valueField : 'companyName',
		mode : 'remote',
		allowBlank : false,
		editable : false,
		triggerAction : 'all',
		listWidth : 130, // 因为列宽度默认比较小,所以设定下拉列表宽度
		listeners : {
			'select' : function(combo, record, index) {
				companyId = record.data.companyId; // 获得分公司id,保存到全局
			}
		}
	})
}, {
	header : '部门地址',
	width : 200,
	dataIndex : 'address',
	menuDisabled : true,
	editor : new Ext.form.TextField({
		maxLength : 70
	})
}, {
	header : '部门电话',
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
	menuDisabled : true,
	editor : new Ext.form.TextField({
		allowBlank : false,
		maxLength : 20
	})
}, {
	header : '联系电话',
	width : 85,
	dataIndex : 'mobilePhone',
	menuDisabled : true,
	resizable : false,
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

cm_dept.defaultSortable = false;

var window_add_dept = new Ext.Window({
	title : '添加部门',
	width : 350,
	height : 440,
	resizable : false,
	autoHeight : true,
	modal : true,
	closeAction : 'hide',
	listeners : {
		'hide' : function() {
			this.setTitle('添加部门');
			this.findById('dept.deptName').ownerCt.form.reset();
		}
	},
	items : [new Ext.FormPanel({
		labelWidth : 70,
		labelAlign : 'right',
		url : 'saveDept.action',
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
			fieldLabel : '部门名称',
			id : 'dept.deptName',
			name : 'dept.deptName',
			allowBlank : false,
			maxLength : 50
		}, {
			xtype : 'combo',
			fieldLabel : '所属分公司',
			id : 'company',
			hiddenName : 'dept.companyId',
			valueField : 'companyId',
			displayField : 'companyName',
			mode : 'remote',
			store : ds_company_select,
			selectOnFocus : true,
			editable : false,
			allowBlank : false,
			triggerAction : 'all',
			loadingText : '加载中...',
			emptyText : '公司名称',
			listeners : { // 获得下拉文本内容,解决id,value都要的情况
				'select' : function(combo, record, index) {
					this.ownerCt.form.findField('dept.companyName').setValue(record.data.companyName);
				}
			}
		}, {
			xtype : 'hidden',
			name : 'dept.companyName'
		}, {
			fieldLabel : '部门地址',
			name : 'dept.address',
			maxLength : 70
		}, {
			fieldLabel : '部门电话',
			name : 'dept.tellPhone',
			maxLength : 20
		}, {
			fieldLabel : '负责人',
			name : 'dept.leader',
			allowBlank : false,
			maxLength : 20
		}, {
			fieldLabel : '联系电话',
			name : 'dept.mobilePhone',
			maxLength : 20
		}, {
			fieldLabel : '备注',
			name : 'dept.remark',
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
					var dnfield = frm.findField('dept.deptName');
					frm.submit({
						waitTitle : '请稍候',
						waitMsg : '正在提交表单数据,请稍候...',
						success : function(form, action) {
							var store = grid_dept.getStore();
							if (store.data.length <= 20) {
								var dept = new Dept({
									deptId : action.result.deptId,
									deptName : dnfield.getValue(),
									companyId : form.findField('dept.companyId').getValue(),
									companyName : Ext.get('company').dom.value,
									address : form.findField('dept.address').getValue(),
									tellPhone : form.findField('dept.tellPhone').getValue(),
									leader : form.findField('dept.leader').getValue(),
									mobilePhone : form.findField('dept.mobilePhone').getValue(),
									remark : form.findField('dept.remark').getValue()
								});
								store.insert(0, [dept]);
								if (store.data.length > 20) {
									store.remove(store.getAt(store.data.length - 1));
								}
							}
							window_add_dept.setTitle('[ ' + dnfield.getValue() + ' ]   添加成功!!');
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

var btn_add_dept = new Ext.Button({
	text : '添加部门',
	iconCls : 'icon-add',
	handler : function() {
		window_add_dept.show();
	}
});

var btn_del_dept = new Ext.Button({
	text : '删除部门',
	iconCls : 'icon-del',
	handler : function() {
		var record = grid_dept.getSelectionModel().getSelected();
		if (record) {
			Ext.Msg.confirm('确认删除', '你确定删除该条记录?', function(btn) {
				if (btn == 'yes') {
					Ext.Ajax.request({
						url : 'deleteDept.action',
						params : {
							deptId : record.data.deptId
						},
						success : function() {
							grid_dept.getStore().remove(record);
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

var searchDept = function() {
	ds_dept.baseParams.conditions = text_search_dept.getValue();// + ',' +
																// cbb_company_for_dept.getValue();
	ds_dept.load({
		params : {
			start : 0,
			limit : 20
		}
	});
}

var btn_search_dept = new Ext.Button({
	text : '查询',
	iconCls : 'icon-search',
	handler : searchDept
});

var cbb_company_for_dept = new Ext.form.ComboBox({
	name : 'companyName',
	width : 120,
	displayField : 'companyName',
	mode : 'remote',
	store : ds_company_select,
	selectOnFocus : true,
	triggerAction : 'all',
	loadingText : '加载中...',
	emptyText : '公司名称'
});

var text_search_dept = new Ext.form.TextField({
	name : 'textSearchDept',
	width : 200,
	emptyText : '多条件可用逗号或者空格隔开!',
	listeners : {
		'specialkey' : function(field, e) {
			if (e.getKey() == Ext.EventObject.ENTER) {
				searchDept();
			}
		}
	}
});

var ds_dept = new Ext.data.Store({
	proxy : new Ext.data.HttpProxy({
		url : 'findAllDept.action'
	}),
	reader : new Ext.data.JsonReader({
		totalProperty : 'totalProperty',
		root : 'root'
	}, [{
		name : 'deptId',
		type : 'int'
	}, {
		name : 'deptName',
		type : 'string'
	}, {
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

var companyId; // 存储部门修改时分公司下拉的分公司id

var grid_dept = new Ext.grid.EditorGridPanel({
	title : '部门管理',
	iconCls : 'icon-plugin',
	region : 'center',
	loadMask : {
		msg : '数据加载中...'
	},
	cm : cm_dept,
	ds : ds_dept,
	sm : new Ext.grid.RowSelectionModel({
		singleSelect : true
	}),
	enableColumnMove : false,
	trackMouseOver : false,
	frame : true,
	autoExpandColumn : 'remark',
	clicksToEdit : 1,
	tbar : [btn_add_dept, '-', btn_del_dept, '-', // cbb_company_for_dept,
													// '-', '&nbsp;&nbsp;',
			text_search_dept, btn_search_dept],
	bbar : new Ext.PagingToolbar({
		pageSize : 20,
		store : ds_dept,
		displayInfo : true,
		displayMsg : '第 {0} - {1} 条  共 {2} 条',
		emptyMsg : "没有记录"
	}),
	listeners : {
		'afteredit' : function(e) {
			Ext.Ajax.request({
				url : 'updateDept.action',
				params : {
					fieldName : e.field,
					fieldValue : e.value,
					companyId : e.field == 'companyName' ? companyId : null,
					deptId : e.record.data.deptId
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

var p_dept = {
	id : 'dept-panel',
	border : false,
	layout : 'border',
	items : [grid_dept]
}
