package com.sanga.pj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.sanga.pj.entity.Project;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long>, JpaSpecificationExecutor<Project>{
	List<Project> findByProjectType(String projectType);
	List<Project> findTop6ByIsDisplayOrderByIdDesc(Integer isDisplay);
	@Query("select count(e) from Project e")
	long countAllProject();
}
