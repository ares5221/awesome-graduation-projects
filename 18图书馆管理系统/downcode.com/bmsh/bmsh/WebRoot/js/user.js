// 用户管理
var User = Ext.data.Record.create([
	{name : 'userId',mapping : 'userId',type : 'int'}, 
	{name : 'emplName',mapping : 'emplName',type : 'string'}, 
	{name : 'emplNo',mapping : 'emplNo',type : 'string'}, 
	{name : 'mobilePhone',mapping : 'mobilePhone',type : 'string'}, 
	{name : 'sex',mapping : 'sex',type : 'string'}, 
	{name : 'age',mapping : 'age',type : 'int'}, 
	{name : 'userName',mapping : 'userName',type : 'string'}, 
	{name : 'password',mapping : 'password',type : 'string'}, 
	{name : 'userId',mapping : 'userId',type : 'int'}, 
	{name : 'userName',mapping : 'userName',type : 'string'}, 
	{name : 'deptId',mapping : 'deptId',type : 'int'}, 
	{name : 'deptName',mapping : 'deptName',type : 'string'}, 
	{name : 'dutyId',mapping : 'dutyId',type : 'int'}, 
	{name : 'dutyName',mapping : 'dutyName',type : 'string'}, 
	{name : 'manager',mapping : 'manager',type : 'bool'}, 
	{name : 'remark',mapping : 'remark',type : 'string'}]);

var ds_duty_select = new Ext.data.Store({
	url : 'findAllDuty.action',
	reader : new Ext.data.JsonReader({root : 'root'}, 
	[{name : 'dutyId'}, {name : 'dutyName'}])
});

var ds_dept_select = new Ext.data.Store({
	url : 'findDeptByCompany.action',
	reader : new Ext.data.JsonReader({root : 'root'}, 
	[{name : 'deptId'}, {name : 'deptName'}])
});

Ext.grid.CheckColumn = function(config) {
	Ext.apply(this, config);
	if (!this.id) {
		this.id = Ext.id();
	}
	this.renderer = this.renderer.createDelegate(this);
};

Ext.grid.CheckColumn.prototype = {
	init : function(grid) {
		this.grid = grid;
		this.grid.on('render', function() {
			var view = this.grid.getView();
			view.mainBody.on('mousedown', this.onMouseDown, this);
		}, this);
	},

	onMouseDown : function(e, t) {
		if (t.className && t.className.indexOf('x-grid3-cc-' + this.id) != -1) {
			e.stopEvent();
			var index = this.grid.getView().findRowIndex(t);
			var cindex = this.grid.getView().findCellIndex(t);
			var record = this.grid.store.getAt(index);
			var field = this.grid.colModel.getDataIndex(cindex);
			var e = {
				grid : this.grid,
				record : record,
				field : field,
				originalValue : record.data[this.dataIndex],
				value : !record.data[this.dataIndex],
				row : index,
				column : cindex,
				cancel : false
			};
			if (this.grid.fireEvent("validateedit", e) !== false && !e.cancel) {
				delete e.cancel;
				record.set(this.dataIndex, !record.data[this.dataIndex]);
				this.grid.fireEvent("afteredit", e);
			}
		}
	},

	renderer : function(v, p, record) {
		p.css += ' x-grid3-check-col-td';
		return '<div class="x-grid3-check-col' + (v ? '-on' : '') + ' x-grid3-cc-' + this.id + '">&#160;</div>';
	}
};

var checkColumn = new Ext.grid.CheckColumn({
	header : "管理员?",
	dataIndex : 'manager',
	width : 55
});

var cm_user = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
	header : '用户名',
	width : 85,
	dataIndex : 'userName'
}, {
	header : '密码',
	width : 85,
	dataIndex : 'password',
	sortable : false,
	menuDisabled : true,
	editor : new Ext.form.TextField({
		allowBlank : false,
		minLength : 6,
		maxLength : 20
	})
}, {
	header : '用户姓名',
	sortable : false,
	menuDisabled : true,
	width : 90,
	dataIndex : 'emplName',
	editor : new Ext.form.TextField({
		allowBlank : false,
		maxLength : 20
	})
}, {
	header : '用户编码',
	width : 85,
	dataIndex : 'emplNo',
	hidden : true,
	menuDisabled : true,
	editor : new Ext.form.TextField({
		maxLength : 20
	})
}, {
	header : '手机号码',
	width : 85,
	dataIndex : 'mobilePhone',
	menuDisabled : true,
	editor : new Ext.form.TextField({
		maxLength : 20
	})
}, {
	header : '性别',
	width : 60,
	dataIndex : 'sex',
	hidden : true,
	sortable : false,
	menuDisabled : true,
	editor : new Ext.form.ComboBox({
		mode : 'local',
		editable : false,
		store : new Ext.data.SimpleStore({
			data : [['男', '男'], ['女', '女']],
			fields : ['text', 'value']
		}),
		displayField : 'text',
		valueField : 'value',
		mode : 'local',
		triggerAction : 'all'
	})
}, {
	header : '年龄',
	width : 40,
	dataIndex : 'age',
	sortable : false,
	hidden : true,
	menuDisabled : true,
	editor : new Ext.form.NumberField({
		decimalPrecision : 1,
		fieldLabel : '年龄',
		maxLength : 3,
		maxLengthText : '年龄不符合实际',
		maxValue : 120,
		maxText : '最大允许年龄为120岁'
	})
}, {
	header : '所属分公司',
	width : 85,
	sortable : false,
	dataIndex : 'companyName',
	menuDisabled : true,
	editor : new Ext.form.ComboBox({
		store : ds_company_select,
		displayField : 'companyName',
		valueField : 'companyName',
		mode : 'remote',
		allowBlank : false,
		editable : false,
		triggerAction : 'all',
		listWidth : 130,
		listeners : {
			'select' : function(combo, record) {
				companyId = record.data.companyId;
				ds_dept_select.baseParams.companyId = companyId;
				ds_dept_select.reload();
			}
		}
	})
}, {
	header : '所属部门',
	width : 85,
	dataIndex : 'deptName',
	sortable : false,
	menuDisabled : true,
	editor : new Ext.form.ComboBox({
		valueField : 'deptName',
		displayField : 'deptName',
		mode : 'remote',
		store : ds_dept_select,
		editable : false,
		allowBlank : false,
		triggerAction : 'all',
		listWidth : 130,
		listeners : {
			'select' : function(combo, record) {// 当选择部门后,获得部门的id保存到全局
				deptId = record.data.deptId;
			},
			'beforequery' : function(queryEvent) {// 在执行下拉查询时,先判断是否参数companyId(单击行时被附值,更换分公司也被赋值)是否存在
				if (!companyId) {
					queryEvent.cancel = true;
				}
			},
			'focus' : function() {
				// 当获得焦点时,设置查询参数,重新加载数据,注意:如果不是每次参数都有可能不一样,不推荐使用这个监听器
				// 因为它每次都要重新加载数据
				ds_dept_select.baseParams.companyId = companyId;
				ds_dept_select.reload();
			}
		}
	})
}, {
	header : '职称',
	width : 85,
	dataIndex : 'dutyName',
	menuDisabled : true,
	sortable : false,
	editor : new Ext.form.ComboBox({
		store : ds_duty_select,
		displayField : 'dutyName',
		valueField : 'dutyName',
		mode : 'remote',
		allowBlank : false,
		editable : false,
		triggerAction : 'all',
		listWidth : 100,
		listeners : {
			'select' : function(combo, record) {
				dutyId = record.data.dutyId;
			}
		}
	})
}, checkColumn, {
	header : '备注',
	id : 'remark',
	dataIndex : 'remark',
	menuDisabled : true,
	sortable : false,
	editor : new Ext.form.TextField({
		maxLength : 200
	})
}]);

cm_user.defaultSortable = true;

var btn_add_user = new Ext.Button({
	text : '添加用户',
	iconCls : 'icon-add',
	handler : function() {
		window_add_user.show();
	}
});

var btn_del_user = new Ext.Button({
	text : '删除用户',
	iconCls : 'icon-del',
	handler : function() {
		var record = grid_user.getSelectionModel().getSelected();
		if (record) {
			Ext.Msg.confirm('确认删除', '你确定删除该条记录?', function(btn) {
				if (btn == 'yes') {
					Ext.Ajax.request({
						url : 'deleteUser.action',
						params : {userId : record.data.userId},
						success : function() {grid_user.getStore().remove(record);},
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

var text_search_user = new Ext.form.TextField({
	name : 'textSearchUser',
	width : 200,
	emptyText : '多条件可用逗号或者空格隔开!',
	listeners : {
		'specialkey' : function(field, e) {
			if (e.getKey() == Ext.EventObject.ENTER) {
				searchUser();
			}
		}
	}
});

var searchUser = function() {
	ds_user.baseParams.conditions = text_search_user.getValue(); 
	ds_user.load({params : {start : 0,limit : 20}});
}

var btn_search_user = new Ext.Button({
	text : '查询',
	iconCls : 'icon-search',
	handler : searchUser
});

var ds_user = new Ext.data.Store({
	url : 'findAllUser.action',
	reader : new Ext.data.JsonReader({totalProperty : 'totalProperty',root : 'root'}, 
	[{name : 'userId',type : 'int'}, 
	{name : 'userName',type : 'string'}, 
	{name : 'password',type : 'string'}, 
	{name : 'mobilePhone',type : 'string'}, 
	{name : 'emplName',type : 'string'}, 
	{name : 'emplNo',type : 'string'}, 
	{name : 'sex',type : 'string'}, 
	{name : 'age',type : 'int'},
	{name : 'companyId',type : 'int'},
	{name : 'companyName',type : 'string'},
	{name : 'deptId',type : 'int'},
	{name : 'deptName',type : 'string'},
	{name : 'dutyId',type : 'int'},
	{name : 'dutyName',type : 'string'},
	{name : 'manager',type : 'bool'},
	{name : 'remark',type : 'string'}])
});

var companyId, dutyId, deptId;

var grid_user = new Ext.grid.EditorGridPanel({
	title : '用户管理',
	iconCls : 'icon-grid',
	loadMask : {msg : '数据加载中...'},
	region : 'center',
	cm : cm_user,
	ds : ds_user,
	plugins : checkColumn,
	sm : new Ext.grid.RowSelectionModel({singleSelect : true}),
	enableColumnMove : false,
	trackMouseOver : false,
	frame : true,
	autoExpandColumn : 'remark',
	clicksToEdit : 1,
	tbar : [btn_add_user, '-', btn_del_user, '-',text_search_user, btn_search_user],
	bbar : new Ext.PagingToolbar({
		pageSize : 20,
		store : ds_user,
		displayInfo : true,
		displayMsg : '第 {0} - {1} 条  共 {2} 条',
		emptyMsg : "没有记录"
	}),
	listeners : {
		'afteredit' : function(e) {
			Ext.Ajax.request({
				url : 'updateUser.action',
				params : {
					fieldName : e.field,
					fieldValue : e.value,
					companyId : e.field == 'companyName' ? companyId : null,
					deptId : e.field == 'deptName' ? deptId : null,
					dutyId : e.field == 'dutyName' ? dutyId : null,
					userId : e.record.data.userId
				},
				success : function() {
					if (e.field == 'companyName') {// 如果公司修改成功则同步当前显示修改记录的公司id
						e.record.set('companyId', companyId);
					}
				},
				failure : function() {
					Ext.Msg.show({
						title : '错误提示',
						msg : '修改数据发生错误,操作将被回滚!',
						fn : function() {e.record.set(e.field, e.originalValue);},
						buttons : Ext.Msg.OK,
						icon : Ext.Msg.ERROR
					});
				}
			});
		},
		'cellclick' : function(grid, rowIndex) { // 为了部门下拉能够提取到分公司id的参数
			companyId = grid.getStore().getAt(rowIndex).data.companyId;
		}
	}
});

var window_add_user = new Ext.Window({
	title : '添加用户',
	width : 320,
	resizable : false,
	autoHeight : true,
	modal : true,
	closeAction : 'hide',
	listeners : {
		'hide' : function() {
			this.setTitle('添加用户');
			this.findById('user.userName').ownerCt.form.reset();
		}
	},
	items : [new Ext.FormPanel({
		border : false,
		baseCls : 'x-plain',
		bodyStyle : 'padding:5px 5px 0',
		labelAlign : 'right',
		labelWidth : 70,
		url : 'saveUser.action',
		defaults : {anchor : '93%',msgTarget : 'side'},
		defaultType : 'textfield',
		items : [{
			fieldLabel : '用户名',
			id : 'user.userName',
			name : 'user.userName',
			allowBlank : false,
			maxLength : 30
		}, {
			fieldLabel : '密码',
			id : 'password1',
			name : 'user.password',
			allowBlank : false,
			minLength : 6,
			maxLength : 30
		}, {
			xtype : 'combo',
			fieldLabel : '所属分公司',
			id : 'company',
			hiddenName : 'user.companyId',
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
			listeners : {
				'select' : function(combo, record, index) {
					this.ownerCt.findById('dept').reset(); // 可以通过findById来获得同一个表单中的ComboBox
					ds_dept_select.baseParams.companyId = this.ownerCt.form.findField('user.companyId').getValue();
					ds_dept_select.reload();
					this.ownerCt.form.findField('user.companyName').setValue(record.data.companyName);
				}
			}
		}, {
			xtype : 'hidden',
			name : 'user.companyName'
		}, {
			xtype : 'combo',
			fieldLabel : '所属部门',
			id : 'dept',
			hiddenName : 'user.deptId',
			valueField : 'deptId',
			displayField : 'deptName',
			mode : 'remote',
			store : ds_dept_select,
			selectOnFocus : true,
			editable : false,
			allowBlank : false,
			triggerAction : 'all',
			loadingText : '加载中...',
			emptyText : '部门名称',
			listeners : {
				'select' : function(combo, record, index) {
					this.ownerCt.form.findField('user.deptName').setValue(record.data.deptName);
				},
				'beforequery' : function(queryEvent) {
					if (!this.ownerCt.form.findField('user.companyId').getValue()) {
						queryEvent.cancel = true;
					}
				}
			}
		}, {xtype : 'hidden',name : 'user.deptName'}, 
		   {xtype : 'combo',
			fieldLabel : '职称',
			id : 'duty',
			hiddenName : 'user.dutyId',
			valueField : 'dutyId',
			displayField : 'dutyName',
			mode : 'remote',
			store : ds_duty_select,
			selectOnFocus : true,
			editable : false,
			allowBlank : false,
			triggerAction : 'all',
			loadingText : '加载中...',
			emptyText : '请选择职称',
			listeners : {
				'select' : function(combo, record, index) {
					this.ownerCt.form.findField('user.dutyName').setValue(record.data.dutyName);
				}
			}
		}, {xtype : 'hidden',name : 'user.dutyName'}, 
		   {fieldLabel : '用户编码',name : 'user.emplNo',maxLength : 20}, 
		   {fieldLabel : '用户姓名',name : 'user.emplName',allowBlank : false,maxLength : 20}, 
		   {xtype : 'combo',
			fieldLabel : '性别',
			mode : 'local',
			name : 'user.sex',
			editable : false,
			store : new Ext.data.SimpleStore({
				data : [['男', '男'], ['女', '女']],
				fields : ['text', 'value']
			}),
			displayField : 'text',
			valueField : 'value',
			mode : 'local',
			triggerAction : 'all',
			emptyText : '请选择性别'
		}, {
			xtype : 'numberfield',
			decimalPrecision : 1,
			fieldLabel : '年龄',
			maxLength : 3,
			maxLengthText : '年龄不符合实际',
			maxValue : 120,
			maxText : '最大允许年龄为120岁',
			name : 'user.age'
		}, {fieldLabel : '联系电话',name : 'user.mobilePhone',allowBlank : false,maxLength : 20}, 
		   {fieldLabel : '备注',name : 'user.remark',xtype : 'textarea',maxLength : 100}
		],
		buttonAlign : 'right',
		minButtonWidth : 60,
		buttons : [{
			text : '添加',
			handler : function(btn) {
				var frm = this.ownerCt.form;
				if (frm.isValid()) {
					btn.disable();
					var unfield = frm.findField('user.userName');
					frm.submit({
						waitTitle : '请稍候',
						waitMsg : '正在提交表单数据,请稍候...',
						success : function(form, action) {
							var store = grid_user.getStore();
							if (store.data.length <= 20) {
								var user = new User({
									userId : action.result.userId,
									userName : unfield.getValue(),
									companyId : form.findField('user.companyId').getValue(),
									companyName : Ext.get('company').dom.value,
									deptId : form.findField('user.deptId').getValue(),
									deptName : Ext.get('dept').dom.value,
									dutyId : form.findField('user.dutyId').getValue(),
									dutyName : Ext.get('duty').dom.value,
									emplName : form.findField('user.emplName').getValue(),
									emplNo : form.findField('user.emplNo').getValue(),
									sex : form.findField('user.sex').getValue(),
									age : form.findField('user.age').getValue(),
									password : form.findField('user.password').getValue(),
									mobilePhone : form.findField('user.mobilePhone').getValue(),
									remark : form.findField('user.remark').getValue()
								});
								store.insert(0, [user]);
								if (store.data.length > 20) {
									store.remove(store.getAt(store.data.length - 1));
								}
							}
							window_add_user.setTitle('[ ' + unfield.getValue() + ' ]   添加成功!!');
							unfield.reset();
							btn.enable();
						},
						failure : function() {
							Ext.Msg.show({
								title : '错误提示',
								msg : '"' + unfield.getValue() + '" ' + '名称可能已经存在!',
								buttons : Ext.Msg.OK,
								fn : function() {
									unfield.focus(true);
									btn.enable();
								},
								icon : Ext.Msg.ERROR
							});
						}
					});
				}
			}
		}, {text : '重置',handler : function() {this.ownerCt.form.reset();}
		}, {text : '取消',handler : function() {this.ownerCt.ownerCt.hide();}
		}]
	})]
});

var p_user = {
	id : 'user-panel',
	border : false,
	layout : 'border',
	items : [grid_user]
};