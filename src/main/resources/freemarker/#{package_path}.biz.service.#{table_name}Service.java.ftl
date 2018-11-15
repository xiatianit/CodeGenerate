package ${package}.biz.service;

import java.util.List;


import ${package}.dal.dataobject.${table_name?substring(1)}DO;

/**
 * ${raw_table_cn}Service
 *
 * @ClassName: ${table_name?substring(1)}Service
 * @Description: by CodeGenerate
 * @author 
 * 
 */
public interface ${table_name?substring(1)}Service {

	/**
	 * 根据id查询
	 * 
	 * @param ${j_primary_key}
	 * @return
	 */
	 ${table_name?substring(1)}DO query${table_name?substring(1)}ById(long ${j_primary_key});

	/**
	 * 分页查询
	 * 
	 * @param ${table_name?substring(1)?uncap_first}DO
	 * @return
	 */
	 List<${table_name?substring(1)}DO> query${table_name?substring(1)}ByPage(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO);
	
	/**
	 * 查询列表
	 * 
	 * @param ${table_name?substring(1)?uncap_first}DO
	 * @return
	 */
	 List<${table_name?substring(1)}DO> query${table_name?substring(1)}List(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO);

	/**
	 * 创建
	 * 
	 * @param ${table_name?substring(1)?uncap_first}DO
	 * @return
	 */
	 void create${table_name?substring(1)}(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO);

	/**
	 * 修改
	 * 
	 * @param ${table_name?substring(1)?uncap_first}DO
	 * @return
	 */
	 int modify${table_name?substring(1)}(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO);

	/**
	 * 选择性修改
	 * 
	 * @param ${table_name?substring(1)?uncap_first}DO
	 * @return
	 */
	  int modify${table_name?substring(1)}Selective(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO);

	/**
	 * 删除
	 * 
	 * @param ${j_primary_key}
	 * @return
	 */
	 int remove${table_name?substring(1)}(long ${j_primary_key});
	
}