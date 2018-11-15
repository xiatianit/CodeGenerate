package ${package}.biz.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import ${package}.dal.mapper.${table_name?substring(1)}Mapper;
import ${package}.dal.dataobject.${table_name?substring(1)}DO;
import ${package}.biz.service.${table_name?substring(1)}Service;


/**
 * @ClassName: ${table_name?substring(1)}ServiceImpl
 * @Description: by CodeGenerate
 * @author 
 * 
 */
public class ${table_name?substring(1)}ServiceImpl implements ${table_name?substring(1)}Service {

	 private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private ${table_name?substring(1)}Mapper master${table_name?substring(1)}Mapper;
    @Autowired
	private ${table_name?substring(1)}Mapper slave${table_name?substring(1)}Mapper;
	
	@Override
	public ${table_name?substring(1)}DO query${table_name?substring(1)}ById(long ${j_primary_key}) {

		${table_name?substring(1)}DO ${table_name?uncap_first} = this.slave${table_name?substring(1)}Mapper.select${table_name?substring(1)}ById(${j_primary_key});
		return ${table_name?uncap_first};		
	}

	@Override
	public List<${table_name?substring(1)}DO> query${table_name?substring(1)}ByPage(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO) {

		<#--int record = this.slave${table_name?substring(1)}Mapper.select${table_name?substring(1)}Count(query);
		query.setRecord(record);
		if (record < 1 || query.getTotalPages() < query.getPageNo()) {
			return null;
		}-->
		List<${table_name?substring(1)}DO> list = this.slave${table_name?substring(1)}Mapper.select${table_name?substring(1)}Page(${table_name?substring(1)?uncap_first}DO);
		return list;
	}
	
	@Override
	public List<${table_name?substring(1)}DO> query${table_name?substring(1)}List(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO) {
		List<${table_name?substring(1)}DO> list = this.slave${table_name?substring(1)}Mapper.select${table_name?substring(1)}List(${table_name?substring(1)?uncap_first}DO);
		return list;
	}

	@Override
	public void create${table_name?substring(1)}(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO) {
		this.master${table_name?substring(1)}Mapper.insert${table_name?substring(1)}(${table_name?substring(1)?uncap_first}DO);
	}

	@Override
	public int modify${table_name?substring(1)}(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO) {
		int num = this.master${table_name?substring(1)}Mapper.update${table_name?substring(1)}(${table_name?substring(1)?uncap_first}DO);
		return num;
	}

	@Override
	public int modify${table_name?substring(1)}Selective(${table_name?substring(1)}DO ${table_name?substring(1)?uncap_first}DO) {
		int num = this.master${table_name?substring(1)}Mapper.update${table_name?substring(1)}Selective(${table_name?substring(1)?uncap_first}DO);
		return num;
	}

	@Override
	public int remove${table_name?substring(1)}(long ${j_primary_key}) {
		int num = this.master${table_name?substring(1)}Mapper.delete${table_name?substring(1)}(${j_primary_key});
		return num;
	}
	
}