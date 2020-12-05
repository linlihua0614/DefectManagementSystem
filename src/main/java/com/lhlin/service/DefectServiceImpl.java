package com.lhlin.service;

import com.lhlin.dao.DefectDao;
import com.lhlin.entity.Defect;
import com.lhlin.entity.DefectDeal;
import com.lhlin.entity.DefectImg;
import com.lhlin.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
@Service
public class DefectServiceImpl implements DefectService {
    @Autowired
    private DefectDao defectDao;


    @Override
    public Defect getDefectById(String id) {
        return defectDao.getDefectById(id);
    }

    @Override
    public Page<Defect> getDefects(Map<String,Object> map) {
        if(map.get("pageNum")==null || map.get("pageSize")==null){
            return  new Page<Defect>(0,10,0);
        }
        if(!(map.get("pageNum") instanceof Integer) || !(map.get("pageSize") instanceof Integer)){
            return  new Page<Defect>(0,10,0);
        }
        List<Defect> defects = defectDao.getDefects(map);
        if(defects==null || defects.isEmpty()){
            return  new Page<Defect>(0,10,0);
        }

        int totalNum = defects.size();
        Page<Defect> page = new Page<Defect>((Integer)map.get("pageNum"),(Integer)map.get("pageSize"),totalNum);
        int startIndex = page.getStartIndex();
        int pageNum = page.getPageNum();
        map.put("startIndex",startIndex);
        map.put("pageNum",pageNum);
        List<Defect> pdefects = defectDao.getDefects(map);
        page.setList(pdefects);
        return page;
    }

    @Override
    public int add(Defect defect) {
        return defectDao.add(defect);
    }

    @Override
    public int update(Defect defect) {
        return defectDao.update(defect);
    }

    @Override
    public int updateDeal(Defect defect) {
        return defectDao.updateDeal(defect);
    }

    @Override
    public void delete(String id) {
        defectDao.delete(id);
    }

    @Override
    public int addDefectImg(DefectImg defectImg) {
        return defectDao.addDefectImg(defectImg);
    }

    @Override
    public int delAllDefectImgByDefectId(String defectId) {
        return defectDao.delAllDefectImgByDefectId(defectId);
    }

    @Override
    public List<DefectImg> getDefectImg(String defectId) {
        return defectDao.getDefectImg(defectId);
    }

    @Override
    public int addDefectDeal(DefectDeal defectDeal) {
        return defectDao.addDefectDeal(defectDeal);
    }

    @Override
    public List<DefectDeal> getDefectDeals(String defectId) {
        return defectDao.getDefectDeals(defectId);
    }

    @Override
    public int deleteDefectDealByDefectId(String id) {
        return defectDao.deleteDefectDealByDefectId(id);
    }

}
