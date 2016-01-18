package com.pkasso.web.util;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.pkasso.web.dao.domain.Category;
import com.pkasso.web.dao.domain.Project;
import com.pkasso.web.dao.domain.Slide;

public class DBUtil {
	
	private SessionFactory sessionFactory;
	
   
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Category> getCategories() {
		Session session = this.sessionFactory.openSession();
		List<Category> categories = session.createQuery("from Category").list();
		session.close();
		return categories;
	}
	
	public Category getCategory(String name) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("from Category where name=:cat_name");
		query.setParameter("cat_name", name);
		List<Category> categories = query.list();
		session.close();
		if(CollectionUtils.isEmpty(categories)) {
			return null;
		}
		return categories.get(0);
	}
	
	public void addCategory(Category category) {
		Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.persist(category);
        tx.commit();
        session.close();
        System.out.println("Category added..");
	}
	
	public void addProject(Project project) {
		Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.persist(project);
        tx.commit();
        session.close();
        System.out.println("Project added..");
	}
	
	public void addSlide(Slide slide) {
		Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.persist(slide);
        tx.commit();
        session.close();
        System.out.println("Slide added..");
	}

	public int getProjectId() {
		Session session = this.sessionFactory.openSession();
		List<com.pkasso.web.dao.domain.Project> project = session.createQuery("from Project order by id DESC").list();
		if(project == null) {
			return 0;
		}
		session.close();
		return project.get(0).getId();
	}

	public List<Slide> getSlides(int projectId) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("from Slide S where S.projectId=:id order by S.id");
		query.setParameter("id", projectId);
		List<com.pkasso.web.dao.domain.Slide> slides = query.list();
		session.close();
		return slides;
	}
	
	public Slide getSlide(int id) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("from Slide S where S.id=:id");
		query.setParameter("id", id);
		List<com.pkasso.web.dao.domain.Slide> slides = query.list();
		session.close();
		if(CollectionUtils.isEmpty(slides)) {
			return null;
		}
		return slides.get(0);
	}
	
	public List<Project> getProjects(int categoryId) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("from Project S where S.categoryId=:id");
		query.setParameter("id", categoryId);
		List<Project> projects = query.list();
		session.close();
		return projects;
	}

	public com.pkasso.web.dao.domain.Project getProject(int projectId) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("from Project S where S.id=:id");
		query.setParameter("id", projectId);
		List<Project> projects = query.list();
		session.close();
		if(CollectionUtils.isEmpty(projects)) {
			return null;
		}
		return projects.get(0);
	}

	public Category getCategory(int categoryId) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("from Category where id=:cat_id");
		query.setParameter("cat_id", categoryId);
		List<Category> categories = query.list();
		session.close();
		if(CollectionUtils.isEmpty(categories)) {
			return null;
		}
		return categories.get(0);
	}
	
	public void deleteProject(int projectId) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("delete from Project P where P.id=:id");
		query.setParameter("id", projectId);
		query.executeUpdate();
		session.close();
	}
	
	public void deleteSlides(int projectId) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("delete from Slide P where P.projectId=:id");
		query.setParameter("id", projectId);
		query.executeUpdate();
		session.close();
	}

}
