package com.lhlin.dao;

import com.lhlin.entity.Defect;
import com.lhlin.entity.DefectDeal;
import com.lhlin.entity.DefectImg;
import com.lhlin.entity.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
public interface DefectDao {
    public Defect getDefectById(String id);

    public List<Defect> getDefects(Map<String,Object> map);

    public int add(Defect defect);

    public int update(Defect defect);

    public int updateDeal(Defect defect);

    public void delete(String id);

    public int addDefectImg(DefectImg defectImg);

    public int delAllDefectImgByDefectId(String defectId);

    public List<DefectImg> getDefectImg(String defectId);

    public int addDefectDeal(DefectDeal defectDeal);

    public List<DefectDeal> getDefectDeals(String defectId);

    public int deleteDefectDealByDefectId(String id);
}
