package com.sanga.pj.specification;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.sanga.pj.entity.About;
import com.sanga.pj.entity.Employee;
import com.sanga.pj.search.AboutSearchCriteria;;

public class AboutSearchSpecification {
	
	public static Specification<About> findByCriteria (final AboutSearchCriteria searchCriteria) {
		return new Specification<About>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<About> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<Predicate>();
				 if(searchCriteria.getAboutType() != null){
					 predicates.add(cb.equal(cb.upper(root.get("aboutType")), searchCriteria.getAboutType()));
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
