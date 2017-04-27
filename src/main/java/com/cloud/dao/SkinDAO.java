package com.cloud.dao;

import java.io.Serializable;

import com.cloud.entity.Skin;

public interface SkinDAO extends BaseDAO<Skin, Serializable>{
	public Skin getSkinByUserId(int userId);
}
