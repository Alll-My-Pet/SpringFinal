package com.spring_boot_allmypet.project.service.gallery;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.spring_boot_allmypet.project.dao.gallery.IGalleryDAO;
import com.spring_boot_allmypet.project.model.gallery.GalleryVO;

@Service
public class GalleryService implements IGalleryService {
	@Autowired
	@Qualifier("IGalleryDAO")
	IGalleryDAO dao;

	@Override
	public List<GalleryVO> getTopPostsByPetCtgNoInLastWeek(String petCtgNo) {
	    return dao.getTopPostsByPetCtgNoInLastWeek(petCtgNo);
	}

    @Override
    public List<GalleryVO> getPostsByPetCtgNo(String petCtgNo) {
        return dao.getPostsByPetCtgNo(petCtgNo);
    }
    
    @Override
    public GalleryVO getPostByPostNo(int postNo) {
        return dao.getPostByPostNo(postNo);
    }
    
    @Override
    public List<GalleryVO> searchPostsByPetCtgNo(String petCtgNo, String keyword, int offset, int limit) {
        return dao.searchPostsByPetCtgNo(petCtgNo, keyword, offset, limit);
    }

    @Override
    public int countPostsByPetCtgNo(String petCtgNo, String keyword) {
        return dao.countPostsByPetCtgNo(petCtgNo, keyword);
    }
    
    public void insertGalleryPost(GalleryVO galleryVO) {
        dao.insertGalleryPost(galleryVO);
    }

	public String getProfileImage(int postNo) {
		return dao.getProfileImage(postNo);
	}
}