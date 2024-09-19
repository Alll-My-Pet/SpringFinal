package com.spring_boot_allmypet.project.dao.gallery;

import java.util.List;

import com.spring_boot_allmypet.project.model.gallery.GalleryVO;

public interface IGalleryDAO {

    public List<GalleryVO> getPostsByPetCtgNo(String petCtgNo);

	public List<GalleryVO> getTopPostsByPetCtgNoInLastWeek(String petCtgNo);
	
	public GalleryVO getPostByPostNo(int postNo);

	public List<GalleryVO> searchPostsByPetCtgNo(String petCtgNo, String keyword, int offset, int limit);

	public int countPostsByPetCtgNo(String petCtgNo, String keyword);

	public void insertGalleryPost(GalleryVO galleryVO);

	public String getProfileImage(int postNo);
}
