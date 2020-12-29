package com.sanga.pj.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.sanga.pj.entity.About;
import java.lang.String;
import java.util.List;

@Repository
public interface AboutRepository extends JpaRepository<About, Long> , JpaSpecificationExecutor<About>{
	
	List<About> findByAboutType(String aboutType);
}
