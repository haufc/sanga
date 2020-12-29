package com.sanga.pj.service;

import java.io.IOException;
import java.util.List;
import com.sanga.pj.entity.ImgThumbnail;

public interface ImgThumbnailService {
	List<ImgThumbnail> getThumbnails();
	List<ImgThumbnail> getThumbnailByProjectIds(Long projectId);
	ImgThumbnail getById(Long id);
	ImgThumbnail saveImgThumbnail(ImgThumbnail imgThumbnail) throws IOException ;
	void deleteImgThumbnail(ImgThumbnail imgThumbnail);
}
