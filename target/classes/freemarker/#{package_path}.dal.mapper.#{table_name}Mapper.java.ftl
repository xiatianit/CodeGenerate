package ${package}.dal.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ${package}.dal.dataobject.${table_name?substring(1)}DO;

/**
 * ${raw_table_cn}MAPPER
 * 
 * @ClassName: ${table_name?substring(1)}Mapper
 * @Description: by CodeGenerate
 * @author 
 * 
 */

public interface ${table_name?substring(1)}Mapper {

	/** 添加 */
	public int insert${table_name?substring(1)}(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO);

	/** 根据主键查询 */
	public ${table_name?substring(1)}DO select${table_name?substring(1)}ById(Long ${j_primary_key});

	/** 查询列表 */
	public List<${table_name?substring(1)}DO> select${table_name?substring(1)}List(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO);
	
	/** 分页计数 */
	public int select${table_name?substring(1)}Count(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO);
	
	/** 分页查找 */
	public List<${table_name?substring(1)}DO> select${table_name?substring(1)}Page(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO);

	/** 完全修改 */
	public int update${table_name?substring(1)}(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO);

	/** 选择性修改 */
	public int update${table_name?substring(1)}Selective(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO);

	/** 删除 */
	public int delete${table_name?substring(1)}(Long ${j_primary_key});
}