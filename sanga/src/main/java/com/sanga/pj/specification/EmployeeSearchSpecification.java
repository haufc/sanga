package com.sanga.pj.specification;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.sanga.pj.entity.Employee;
import com.sanga.pj.search.EmployeeSearchCriteria;;

public class EmployeeSearchSpecification {
	public static Specification<Employee> findByCriteria (final EmployeeSearchCriteria searchCriteria) {
		return new Specification<Employee>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Employee> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<Predicate>();
				 if(searchCriteria.getName() != null){
					 predicates.add(
					            cb.like(
					              cb.upper(root.get("name")),
					              "%" + searchCriteria.getName().toUpperCase() + "%"
					            )
					          );
					
				 }
				 
				 if(searchCriteria.getPosition() != null){
					 predicates.add(
					            cb.like(
					              cb.upper(root.get("position")),
					              "%" + searchCriteria.getPosition().toUpperCase() + "%"
					            )
					          );
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
