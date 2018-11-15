package ${package}.dal.dataobject.businessObject;

import java.util.Date;

/**
 * ${raw_table_cn}业务BO
 * 
 * @ClassName: ${table_name}BO
 * @Description: by CodeGenerate
 * @author 
 * 
 */
public class Query${table_name}BO{

	<#list table_columns as column>
	/** 
	 * ${column.columnComments} <#if column.isPrimary = "1">( 主键 )</#if> 
	 */
	private ${column.dataType} ${column.dataName};
	</#list>
	
	<#list table_columns as column>
	public ${column.dataType} get${column.dataName?cap_first}() {
		return ${column.dataName};
	}
	
	public void set${column.dataName?cap_first}(${column.dataType} ${column.dataName}) {
		this.${column.dataName} = ${column.dataName};
	}

	</#list>
	/* -------------------- 非DB字段 -------------------- */
}