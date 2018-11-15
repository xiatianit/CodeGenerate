package ${package}.dal.dataobject;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * ${raw_table_cn}DO
 * 
 * @ClassName: ${table_name?substring(1)}DO
 * @Description: by CodeGenerate
 * @author 
 * 
 */
@Data
@ToString
public class ${table_name?substring(1)}DO implements Serializable {

	<#list table_columns as column>
	/** 
	 * ${column.columnComments} <#if column.isPrimary = "1">( 主键 )</#if> 
	 */
	private ${column.dataType} ${column.dataName};
	</#list>
}