package com.cloud.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;

import com.cloud.dao.BaseDAO;

public class BaseDAOImpl<T> implements BaseDAO<T, Serializable>{

	//TODO 泛型类型
	Class<T> clazz;
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	protected Session getCurrentSession(){
		return this.sessionFactory.getCurrentSession();
	}
	
	public BaseDAOImpl(){
		Class<T> entityClass = null;
		Type genType = getClass().getGenericSuperclass();  
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();  
		clazz = (Class) params[0]; 
	}
	
	public T load(Serializable id) {
		return  (T)this.getCurrentSession().load(clazz, id);
	}

	public T get(Serializable id) {
		return (T) this.getCurrentSession().get(clazz, id);
	}

	public List<T> finaAll() {
		String className = clazz.getSimpleName();
		return this.getCurrentSession().createQuery("FROM "+className).list();
	}

	public void persist(T entity) {
		this.getCurrentSession().persist(entity);
	}

	public Serializable save(T entity) {
		return this.getCurrentSession().save(entity);
	}

	public void update(T entity) {
		this.getCurrentSession().update(entity);
	}

	public void delete(Serializable id) {
		T entity = this.load(id);
		this.getCurrentSession().delete(entity);
	}

	public void flush() {
		this.getCurrentSession().flush();
	}

	public List<?> getHQLList(String hql, String[] columns, Object[] objs) {
		Session session = this.getCurrentSession();
		Query query = session.createQuery(hql);
		if(columns != null){
			for(int i = 0;i<columns.length;i++){
				query.setParameter(columns[i], objs[i]);
			}
		}
		List list = query.list();
		return list;
	}

	public List<?> getList(int page,int pageSize, String hql, String[] columns, Object[] objs) {
		Session session = this.getCurrentSession();
		Query query = session.createQuery(hql);
		if(columns != null){
			for(int i = 0;i<columns.length;i++){
				query.setParameter(columns[i], objs[i]);
			}
		}
		query.setFirstResult((page - 1)*pageSize);
		query.setMaxResults(pageSize);
		List list = query.list();
		return list;
	}

	public int getCount(String hql, String[] columns, Object[] objs) {
		int count = 0;
		Session session = this.getCurrentSession();
		Query query = session.createQuery(hql);
		if(columns != null){
			for(int i = 0;i<columns.length;i++){
				query.setParameter(columns[i], objs[i]);
			}
		}
		count = (new Integer(query.uniqueResult().toString())).intValue(); 
		return count;
	}

	public List<?> getSQLList(String sql, Object[] objs,Class clazz) {
		Session session = this.getCurrentSession();
		Query query = session.createSQLQuery(sql).addEntity(clazz);
		if(objs != null){
			for(int i =0;i<objs.length;i++){
				query.setParameter(i, objs[i]);
			}
		}
		List list = query.list();
		return list;
	}

	public void updateHQL(String hql, String[] columns, Object[] objs) {
		Session session = this.getCurrentSession();
		Query query = session.createQuery(hql);
		if(columns != null){
			for(int i = 0;i<columns.length;i++){
				query.setParameter(columns[i], objs[i]);
			}
		}
		query.executeUpdate();
	}

}
