package com.spring_boot_allmypet.project.service.mypage;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.spring_boot_allmypet.project.model.mypage.AnimalDealers;
import com.spring_boot_allmypet.project.model.mypage.AnimalDealers.Body;
import com.spring_boot_allmypet.project.model.mypage.AnimalDealers.Row;

@Service  
public class AnimalDealerService {

    public AnimalDealers loadAnimalDealers(String filePath) {
        XmlMapper xmlMapper = new XmlMapper();
        AnimalDealers dealers = null;
        try {
            dealers = xmlMapper.readValue(new File(filePath), AnimalDealers.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return dealers;
    }

    public Row findDealerByLicenseNumber(AnimalDealers dealers, String licenseNumber) {
        if (dealers != null && dealers.getBody() != null) {
            Body body = dealers.getBody();
            if (body.getRows() != null) {
                for (Row row : body.getRows()) {
                    if (licenseNumber.equals(row.getMgtNo())) {
                        return row;
                    }
                }
            }
        }
        return null;
    }
}
