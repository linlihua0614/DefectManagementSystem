package com.lhlin.service;

import com.lhlin.dao.ProjectDao;
import com.lhlin.entity.Project;
import com.lhlin.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
@Service
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectDao projectDao;

    @Override
    public Project getProjByName(String projName) {
        return projectDao.getProjByName(projName);
    }

    @Override
    public Project getProjById(Integer id) {
        return projectDao.getProjById(id);
    }

    @Override
    public Page<Project> getProjs(Map<String, Object> map) {
        if(map.get("pageNum")==null || map.get("pageSize")==null){
            return  new Page<Project>(0,10,0);
        }
        if(!(map.get("pageNum") instanceof Integer) || !(map.get("pageSize") instanceof Integer)){
            return  new Page<Project>(0,10,0);
        }
        List<Project> projs = projectDao.getProjs(map);
        if(projs==null || projs.isEmpty()){
            return  new Page<Project>(0,10,0);
        }

        int totalNum = projs.size();
        Page<Project> page = new Page<Project>((Integer)map.get("pageNum"),(Integer)map.get("pageSize"),totalNum);
        int startIndex = page.getStartIndex();
        int pageNum = page.getPageNum();
        map.put("startIndex",startIndex);
        map.put("pageNum",pageNum);
        List<Project> pprojs = projectDao.getProjs(map);
        page.setList(pprojs);
        return page;
    }

    @Override
    public List<Project> getAllAvailable() {
        return projectDao.getAllAvailable();
    }

    @Override
    public List<Project> getMyDeal(String loginUser) {
        return projectDao.getMyDeal(loginUser);
    }

    @Override
    public int add(Project proj) {
        return projectDao.add(proj);
    }

    @Override
    public int update(Project proj) {
        return projectDao.update(proj);
    }
}
