package cn.codegenerate.client.bo;

import java.io.File;

/**
 * @ClassName: ProjectFreemarkBO
 * @Description: 项目模板生成基础数据
 * @author lijiabei
 * @date 2015年3月27日 下午4:02:10
 */
public class ProjectFreemarkBO {

	/** 项目工程的基础内容路径 */
	private String projectTmpletePath;
	/** 模板文件的路径 */
	private String freemarkpath;
	/** 包主路径 */
	private String packagePath = "";
	/** 用户临时路径 其下生成2份文件，project为项目文件夹 project.zip为压缩包 */
	private String userPath = "";
	/** 用户临时路径 其下的project */
	private String userProjectPath = "";
	/** 用户临时路径 其下的project Java*/
	private String userProjectPathJava = "";
	/** 用户临时路径 其下的project Xml*/
	private String userProjectPathXml = "";
	/** 用户临时路径 其下的project.zip */
	private String userProjectPathZip = "";

	public String getProjectTmpletePath() {
		return projectTmpletePath;
	}

	public void setProjectTmpletePath(String projectTmpletePath) {
		this.projectTmpletePath = projectTmpletePath;
	}

	public String getFreemarkpath() {
		return freemarkpath;
	}

	public void setFreemarkpath(String freemarkpath) {
		this.freemarkpath = freemarkpath;
	}

	public String getPackagePath() {
		return packagePath;
	}

	public void setPackagePath(String packagePath) {
		this.packagePath = packagePath;
	}

	public String getUserPath() {
		return userPath;
	}

	public void setUserPath(String userPath) {
		this.userPath = userPath;
		this.userProjectPath = userPath + File.separator + "project";
		this.userProjectPathZip = userPath + File.separator + "project.zip";
	}

	public String getUserProjectPath() {
		return userProjectPath;
	}

	public void setUserProjectPath(String userProjectPath) {
		this.userProjectPath = userProjectPath;
	}

	public String getUserProjectPathZip() {
		return userProjectPathZip;
	}

	public void setUserProjectPathZip(String userProjectPathZip) {
		this.userProjectPathZip = userProjectPathZip;
	}

	public String getUserProjectPathJava() {
		return userProjectPathJava;
	}

	public void setUserProjectPathJava(String userProjectPathJava) {
		this.userProjectPathJava = userProjectPathJava;
	}

	public String getUserProjectPathXml() {
		return userProjectPathXml;
	}

	public void setUserProjectPathXml(String userProjectPathXml) {
		this.userProjectPathXml = userProjectPathXml;
	}

	@Override
	public String toString() {
		return "ProjectFreemarkBO [projectTmpletePath=" + projectTmpletePath + ", freemarkpath=" + freemarkpath
				+ ", packagePath=" + packagePath + ", userPath=" + userPath + ", userProjectPath=" + userProjectPath
				+ ", userProjectPathZip=" + userProjectPathZip + "]";
	}

}
