package com.imovie.model;

import javax.persistence.*;

@MappedSuperclass
public class BaseBean {
	
	@Version
	private Integer version;           //版本列，hibernate自动维护，乐观锁

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}
}
