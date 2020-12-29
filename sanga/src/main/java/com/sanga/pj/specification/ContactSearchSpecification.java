package com.sanga.pj.specification;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.sanga.pj.entity.About;
import com.sanga.pj.entity.Contact;
import com.sanga.pj.search.ContactSearchCriteria;;

public class ContactSearchSpecification {
	
	public static Specification<Contact> findByCriteria (final ContactSearchCriteria searchCriteria) {
		return new Specification<Contact>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Contact> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<Predicate>();
				 if(searchCriteria.getMainBranch() != null){
					 predicates.add(cb.equal(cb.upper(root.get("mainBranch")), searchCriteria.getMainBranch()));
				 }
				 
				 if(searchCriteria.getEmail() != null){
					 predicates.add(
					            cb.like(
					              cb.upper(root.get("email")),
					              "%" + searchCriteria.getEmail().toUpperCase() + "%"
					            )
					          );
					
				 }
				 
				 if(searchCriteria.getPhone() != null){
					 predicates.add(
					            cb.like(
					              cb.upper(root.get("phone")),
					              "%" + searchCriteria.getPhone().toUpperCase() + "%"
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
