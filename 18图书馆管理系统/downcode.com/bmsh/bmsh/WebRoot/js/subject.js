// 科目管理
var Subject = Ext.data.Record.create([{
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

var cm_subject = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
	header : '科目名称',
	sortable : true,
	menuDisabled : true,
	width : 90,
	dataIndex : 'subjectName',
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

cm_subject.defaultSortable = false;

var window_add_subject = new Ext.Window({
	title : '添加科目',
	width : 350,
	height : 440,
	resizable : false,
	autoHeight : true,
	modal : true,
	closeAction : 'hide',
	listeners : {
		'hide' : function() {
			this.setTitle('添加科目');
			this.findById('subject.subjectName').ownerCt.form.reset();
		}
	},
	items : [new Ext.FormPanel({
		labelWidth : 70,
		labelAlign : 'right',
		url : 'saveSubject.action',
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
			fieldLabel : '科目名称',
			id : 'subject.subjectName',
			name : 'subject.subjectName',
			allowBlank : false,
			maxLength : 20
		}, {
			fieldLabel : '备注',
			name : 'subject.remark',
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
					var cnfield = frm.findField('subject.subjectName');
					frm.submit({
						waitTitle : '请稍候',
						waitMsg : '正在提交表单数据,请稍候...',
						success : function(form, action) {
							var store = grid_subject.getStore();
							var subject = new Subject({
								subjectId : action.result.subjectId,
								subjectName : cnfield.getValue(),
								remark : form.findField('subject.remark').getValue()
							});
							store.insert(0, [subject]);
							window_add_subject.setTitle('[ ' + cnfield.getValue() + ' ]   添加成功!!');
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

var btn_add_subject = new Ext.Button({
	text : '添加科目',
	iconCls : 'icon-add',
	handler : function() {
		window_add_subject.show();
	}
});

var btn_del_subject = new Ext.Button({
	text : '删除科目',
	iconCls : 'icon-del',
	handler : function() {
		var record = grid_subject.getSelectionModel().getSelected();
		if (record) {
			Ext.Msg.confirm('确认删除', '你确定删除该条记录?', function(btn) {
				if (btn == 'yes') {
					Ext.Ajax.request({
						url : 'deleteSubject.action',
						params : {
							subjectId : record.data.subjectId
						},
						success : function() {
							grid_subject.getStore().remove(record);
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

var btn_search_subject = new Ext.Button({
	text : '查询',
	iconCls : 'icon-search',
	handler : function() {
		ds_subject.load();
	}
});

var ds_subject = new Ext.data.Store({
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
	}, {
		name : 'remark',
		type : 'string'
	}])
});

var grid_subject = new Ext.grid.EditorGridPanel({
	title : '科目管理',
	iconCls : 'icon-grid',
	loadMask : {
		msg : '数据加载中...'
	},
	region : 'center',
	cm : cm_subject,
	ds : ds_subject,
	sm : new Ext.grid.RowSelectionModel({
		singleSelect : true
	}),
	enableColumnMove : false,
	trackMouseOver : false,
	frame : true,
	autoExpandColumn : 'remark',
	clicksToEdit : 1,
	tbar : [btn_add_subject, '-', btn_del_subject, '-', btn_search_subject],
	listeners : {
		'afteredit' : function(e) {
			Ext.Ajax.request({
				url : 'updateSubject.action',
				params : {
					fieldName : e.field,
					fieldValue : e.value,
					subjectId : e.record.data.subjectId
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

var p_subject = {
	id : 'subject-panel',
	border : false,
	layout : 'border',
	items : [grid_subject]
};