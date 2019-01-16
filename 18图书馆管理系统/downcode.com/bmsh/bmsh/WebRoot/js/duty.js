// 职务管理
var Duty = Ext.data.Record.create([{
	name : 'dutyId',
	mapping : 'dutyId',
	type : 'int'
}, {
	name : 'dutyName',
	mapping : 'dutyName',
	type : 'string'
}, {
	name : 'remark',
	mapping : 'remark',
	type : 'string'
}]);

var cm_duty = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
	header : '职务名称',
	sortable : true,
	menuDisabled : true,
	width : 90,
	dataIndex : 'dutyName',
	editor : new Ext.form.TextField({
		allowBlank : false,
		maxLength : 20
	})
}, {
	header : '备注',
	id : 'remark',
	dataIndex : 'remark',
	menuDisabled : true,
	editor : new Ext.form.TextField({
		maxLength : 100
	})
}]);

cm_duty.defaultSortable = false;

var window_add_duty = new Ext.Window({
	title : '添加职务',
	width : 350,
	height : 440,
	resizable : false,
	autoHeight : true,
	modal : true,
	closeAction : 'hide',
	listeners : {
		'hide' : function() {
			this.setTitle('添加职务');
			this.findById('duty.dutyName').ownerCt.form.reset();
		}
	},
	items : [new Ext.FormPanel({
		labelWidth : 70,
		labelAlign : 'right',
		url : 'saveDuty.action',
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
			fieldLabel : '职务名称',
			id : 'duty.dutyName',
			name : 'duty.dutyName',
			allowBlank : false,
			maxLength : 20
		}, {
			fieldLabel : '备注',
			name : 'duty.remark',
			xtype : 'textarea',
			maxLength : 100
		}],
		buttonAlign : 'right',
		minButtonWidth : 60,
		buttons : [{
			text : '添加',
			handler : function(btn) {
				var frm = this.ownerCt.form;
				if (frm.isValid()) {
					btn.disable();
					var cnfield = frm.findField('duty.dutyName');
					frm.submit({
						waitTitle : '请稍候',
						waitMsg : '正在提交表单数据,请稍候...',
						success : function(form, action) {
							var store = grid_duty.getStore();
							var duty = new Duty({
								dutyId : action.result.dutyId,
								dutyName : cnfield.getValue(),
								remark : form.findField('duty.remark').getValue()
							});
							store.insert(0, [duty]);
							window_add_duty.setTitle('[ ' + cnfield.getValue() + ' ]   添加成功!!');
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

var btn_add_duty = new Ext.Button({
	text : '添加职务',
	iconCls : 'icon-add',
	handler : function() {
		window_add_duty.show();
	}
});

var btn_del_duty = new Ext.Button({
	text : '删除职务',
	iconCls : 'icon-del',
	handler : function() {
		var record = grid_duty.getSelectionModel().getSelected();
		if (record) {
			Ext.Msg.confirm('确认删除', '你确定删除该条记录?', function(btn) {
				if (btn == 'yes') {
					Ext.Ajax.request({
						url : 'deleteDuty.action',
						params : {
							dutyId : record.data.dutyId
						},
						success : function() {
							grid_duty.getStore().remove(record);
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

var btn_search_duty = new Ext.Button({
	text : '查询',
	iconCls : 'icon-search',
	handler : function() {
		ds_duty.load();
	}
});

var ds_duty = new Ext.data.Store({
	proxy : new Ext.data.HttpProxy({
		url : 'findAllDuty.action'
	}),
	reader : new Ext.data.JsonReader({
		root : 'root'
	}, [{
		name : 'dutyId',
		type : 'int'
	}, {
		name : 'dutyName',
		type : 'string'
	}, {
		name : 'remark',
		type : 'string'
	}])
});

var grid_duty = new Ext.grid.EditorGridPanel({
	title : '职务管理',
	iconCls : 'icon-grid',
	loadMask : {
		msg : '数据加载中...'
	},
	region : 'center',
	cm : cm_duty,
	ds : ds_duty,
	sm : new Ext.grid.RowSelectionModel({
		singleSelect : true
	}),
	enableColumnMove : false,
	trackMouseOver : false,
	frame : true,
	autoExpandColumn : 'remark',
	clicksToEdit : 1,
	tbar : [btn_add_duty, '-', btn_del_duty, '-', btn_search_duty],
	listeners : {
		'afteredit' : function(e) {
			Ext.Ajax.request({
				url : 'updateDuty.action',
				params : {
					fieldName : e.field,
					fieldValue : e.value,
					dutyId : e.record.data.dutyId
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

var p_duty = {
	id : 'duty-panel',
	border : false,
	layout : 'border',
	items : [grid_duty]
};