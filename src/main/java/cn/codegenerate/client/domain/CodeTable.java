package cn.codegenerate.client.domain;

import java.util.List;

public class CodeTable {

	private String version = "1";// 版本
	// 版本1：添加了gmt_create_id和gmt_modified_id字段

	private String tableName;// 表名
	private String tableComments;// 表备注
	private String tableNameCn;// 表汉字名称
	private String tableNamePolished;// 表名称，去除下划线的
	private String tableNameFirstlow;// 表名称，去除下划线的  首字母小写

	private Boolean selected = Boolean.FALSE;// 是否被选中
	private String hasDeleteField;// 是否有  【是否删除】项目

	private CodeColumn mainColumn = null;// 主键
	private List<CodeColumn> columns;// 表中的列

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTableComments() {
		return tableComments;
	}

	public void setTableComments(String tableComments) {
		this.tableComments = tableComments;
	}

	public String getTableNamePolished() {
		return tableNamePolished;
	}

	public void setTableNamePolished(String tableNamePolished) {
		this.tableNamePolished = tableNamePolished;
	}

	public CodeColumn getMainColumn() {
		return mainColumn;
	}

	public void setMainColumn(CodeColumn mainColumn) {
		this.mainColumn = mainColumn;
	}

	public List<CodeColumn> getColumns() {
		return columns;
	}

	public void setColumns(List<CodeColumn> columns) {
		this.columns = columns;
	}

	public int getColumnSize() {
		return null == columns ? 0 : columns.size();
	}

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}

	public String getTableNameCn() {
		return tableNameCn;
	}

	public void setTableNameCn(String tableNameCn) {
		this.tableNameCn = tableNameCn;
	}

	public String getTableNameFirstlow() {
		return tableNameFirstlow;
	}

	public void setTableNameFirstlow(String tableNameFirstlow) {
		this.tableNameFirstlow = tableNameFirstlow;
	}

	public String getHasDeleteField() {
		return hasDeleteField;
	}

	public void setHasDeleteField(String hasDeleteField) {
		this.hasDeleteField = hasDeleteField;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	@Override
	public String toString() {
		return "CodeTable [version=" + version + ", tableName=" + tableName + ", tableComments=" + tableComments
				+ ", tableNameCn=" + tableNameCn + ", tableNamePolished=" + tableNamePolished + ", tableNameFirstlow="
				+ tableNameFirstlow + ", selected=" + selected + ", hasDeleteField=" + hasDeleteField + ", mainColumn="
				+ mainColumn + ", columns=" + columns + "]";
	}

}
