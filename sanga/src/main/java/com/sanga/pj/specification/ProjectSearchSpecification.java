package com.sanga.pj.specification;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.sanga.pj.entity.Project;
import com.sanga.pj.search.ProjectSearchCriteria;

public class ProjectSearchSpecification {
	public static Specification<Project> findByCriteria (final ProjectSearchCriteria projectSearchCriteria) {
		return new Specification<Project>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Project> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<Predicate>();
				 if(projectSearchCriteria.getName() != null){
					 predicates.add(cb.like(cb.upper(root.get("name")), '%' + projectSearchCriteria.getName().toUpperCase()+ '%'));
				 }
				 
				 if (predicates.size() > 0) {
					 return cb.and(predicates.stream().toArray(Predicate[]::new));
				 } else {
					 return null;
				 }
			}
		};
	}
}
