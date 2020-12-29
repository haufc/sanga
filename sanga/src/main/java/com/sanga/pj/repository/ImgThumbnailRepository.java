package com.sanga.pj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.sanga.pj.entity.ImgThumbnail;

@Repository
public interface ImgThumbnailRepository extends JpaRepository<ImgThumbnail, Long>{
	public List<ImgThumbnail> findByProjectId(Long id);
	
	@Query(value="delete from ImgThumbnail where id in :ids", nativeQuery=true)
	public void deleteAllById(@Param("ids")List<Long> ids);
}
