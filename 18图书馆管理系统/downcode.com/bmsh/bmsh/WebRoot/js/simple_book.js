function _searchBook(){
	ds_book.baseParams.conditions = grid_simple_book.getTopToolbar().items.get(1).getValue();
	ds_book.load({params : {start : 0,limit : 20}});
}

var grid_simple_book = new Ext.grid.GridPanel({
	region : 'center',
	loadMask : {msg : '数据加载中...'},
	enableColumnMove : false,
	cm : cm_book,
	ds : ds_book,
	sm : new Ext.grid.RowSelectionModel({singleSelect : true}),
	autoExpandColumn : 'address',
	viewConfig : {forceFit : true},
	plugins : expander,
	tbar : [' ',new Ext.form.TextField({
		name : 'textSearchBook',
		width : 200,
		emptyText : '多条件可用逗号或者空格隔开!',
		listeners : {
			'specialkey' : function(field, e) {
				if (e.getKey() == Ext.EventObject.ENTER) {
					_searchBook();
				}
			}
		}
	}), {text : '查询',iconCls : 'icon-search',handler : _searchBook}],
	bbar : new Ext.PagingToolbar({
		pageSize : 20,
		store : ds_book,
		displayInfo : true,
		displayMsg : '第 {0} - {1} 条 共 {2} 条',
		emptyMsg : "没有记录"
	}),
	listeners : {
		'rowdblclick' : function(grid, rowIndex) {
			ds_loanlog.baseParams.bookId = grid.getStore().getAt(rowIndex).data.bookId;
			ds_loanlog.load({params : {start : 0,limit : 10}});
		}
	}
});

var simple_book_panel = new Ext.Panel({
	title : '图书信息查询',
	iconCls : 'icon-plugin',
	region : 'center',
	border : 'layout',
	frame : true,
	layout : 'border',
	defaults : {collapsible : true,split : true},
	items : [
		{region : 'center',layout : 'border',items : [grid_simple_book]}, 
		{region : 'south',
		layout : 'fit',
		title : '图书借还记录',
		height : 250,
		minSize : 150,
		maxSize : 286,
		items : [new LoanLogPanel()]
	}]
});

var p_simple_book = {
	id : 'simple_book-panel',
	border : false,
	layout : 'border',
	items : [simple_book_panel]
};