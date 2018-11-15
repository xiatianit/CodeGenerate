<?xml version="1.0" encoding="UTF-8" ?> 
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package}.dal.mapper.${table_name?substring(1)}Mapper">
	<resultMap type="${package}.dal.dataobject.${table_name?substring(1)}DO" id="${table_name?substring(1)}Result">
		<id property="${j_primary_key}" column="${primary_key}" />
		<#list table_columns as column><#if column.isPrimary != "1">
		<result property="${column.dataName}" column="${column.columnName}" />
		</#if></#list>
	</resultMap>

	<sql id="selectFields">
		<#list table_columns as column>
		<#if column.columnNameKeep??>
		${raw_table?substring(0,1)}.${column.columnNameKeep}<#if column_has_next>,</#if>
		<#else>
		${raw_table?substring(0,1)}.${column.columnName}<#if column_has_next>,</#if>
		</#if>
		</#list>
	</sql>
	
	<sql id="searchCondition">
		<#if code_table.hasDeleteField??>
		${raw_table?substring(0,1)}.is_delete = 0
		</#if>
		<#list table_columns as column>
		<#if column.columnName != "is_delete">
		<if test="${column.dataName} != null">
		<#if column.columnNameKeep??>
			<#if column_index != 0 || code_table.hasDeleteField??>AND </#if>${raw_table?substring(0,1)}.${column.columnNameKeep} = #${r"{"}${column.dataName}}
		<#else>
			<#if column_index != 0 || code_table.hasDeleteField??>AND </#if>${raw_table?substring(0,1)}.${column.columnName} = #${r"{"}${column.dataName}}
		</#if>
		</if>
		</#if>
		</#list>
	</sql>
	
	<!-- 添加 -->
	<insert id="insert${table_name?substring(1)}" parameterType="${package}.dal.dataobject.${table_name?substring(1)}DO">
		INSERT INTO ${raw_table}(
			<#list table_columns as column>
			<#if column.isPrimary != "1">
			<#if column.columnNameKeep??>
			${column.columnNameKeep}<#if column_has_next>,</#if>
			<#else>
			${column.columnName}<#if column_has_next>,</#if>
			</#if>
			</#if>
			</#list>
		) VALUES (
			<#list table_columns as column>
			<#if column.isPrimary != "1">
			<#if column.columnName == "gmt_modified" || column.columnName == "gmt_create">
			NOW()<#if column_has_next>,</#if>
			<#elseif column.columnName == "is_delete">
			0<#if column_has_next>,</#if>
			<#else>
			#${r"{"}${column.dataName}}<#if column_has_next>,</#if>
			</#if>
			</#if>
			</#list>
		)
	</insert>
	
	<!-- 根据主键查询 -->
	<select id="select${table_name?substring(1)}ById" parameterType="java.lang.Long" resultMap="${table_name?substring(1)}Result">
		SELECT
			<include refid="selectFields" />
		FROM 
			${raw_table} ${raw_table?substring(0,1)}
		WHERE 
			${raw_table?substring(0,1)}.${primary_key} = #${r"{"}${j_primary_key}}
	</select>

	<!-- 查询列表 -->
	<select id="select${table_name?substring(1)}List" parameterType="${package}.dal.dataobject.${table_name?substring(1)}DO" resultMap="${table_name?substring(1)}Result">
		SELECT 
			<include refid="selectFields" />
		FROM 
			${raw_table} ${raw_table?substring(0,1)}
		<where>
			<include refid="searchCondition" />
		</where>
	</select>
	
	<!-- 分页计数 -->
	<select id="select${table_name?substring(1)}Count" parameterType="${package}.dal.dataobject.${table_name?substring(1)}DO" resultType="java.lang.Integer">
		SELECT 
			COUNT(1)
		FROM 
			${raw_table} ${raw_table?substring(0,1)}
		<where>
			<include refid="searchCondition" />
		</where>
	</select>
	
	<!-- 分页查找 -->
	<select id="select${table_name?substring(1)}Page" parameterType="${package}.dal.dataobject.${table_name?substring(1)}DO" resultMap="${table_name?substring(1)}Result">
		SELECT 
			<include refid="selectFields" />
		FROM 
			${raw_table} ${raw_table?substring(0,1)}
		<where>
			<include refid="searchCondition" />
		</where>
		ORDER BY ${raw_table?substring(0,1)}.${primary_key} DESC
		LIMIT ${r'#{pageIndex}, #{pageSize}'}
	</select>

	<!-- 完全修改 -->
	<update id="update${table_name?substring(1)}" parameterType="${package}.dal.dataobject.${table_name?substring(1)}DO">
		UPDATE 
			${raw_table} 
		SET
		<#list table_columns as column>
			<#if column.isPrimary != "1">
			<#if column.columnNameKeep??>
			${column.columnNameKeep} = #${r"{"}${column.dataName}}<#if column_has_next>,</#if>
			<#else>
			${column.columnName} = #${r"{"}${column.dataName}}<#if column_has_next>,</#if>
			</#if>
			</#if>
		</#list>
		WHERE 
			${primary_key} = #${r"{"}${j_primary_key}}
	</update>
	
	<!-- 选择性修改 -->
	<update id="update${table_name?substring(1)}Selective" parameterType="${package}.dal.dataobject.${table_name?substring(1)}DO">
		UPDATE 
			${raw_table} 
		SET
		<#list table_columns as column>
			<#if column.isPrimary != "1">
			<#if column.columnName == "gmt_create">
			<#elseif column.columnNameKeep??>
			<if test="${column.dataName} != null">
				${column.columnNameKeep} = #${r"{"}${column.dataName}}<#if column_has_next>,</#if>
			</if>
			<#elseif column.columnName == "gmt_modified">
			${column.columnName} = NOW()<#if column_has_next>,</#if>
			<#else>
			<if test="${column.dataName} != null">
				${column.columnName} = #${r"{"}${column.dataName}}<#if column_has_next>,</#if>
			</if>
			</#if>
			</#if>
		</#list>
		WHERE 
			${primary_key} = #${r"{"}${j_primary_key}}
	</update>

	<!-- 删除 -->
	<update id="delete${table_name?substring(1)}" parameterType="java.lang.Long">
		<#if code_table.hasDeleteField??>
		UPDATE 
			${raw_table}
		SET
			is_delete = 1,
			<#if code_table.version == "2">
			<if test="currentUserId != null">
				gmt_modified_id = #${r"{"}currentUserId},
			</if>
			</#if>
			gmt_modified = NOW()
		WHERE 
			${primary_key} = #${r"{"}${j_primary_key}}
		<#else>
		<!-- 没有is_delete字段 -->
		delete FROM
			${raw_table}
		WHERE
			${primary_key} = #${r"{"}${j_primary_key}}
		</#if>
	</update>

</mapper>