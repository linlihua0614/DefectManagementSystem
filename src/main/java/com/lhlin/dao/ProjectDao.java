package com.lhlin.dao;

import com.lhlin.entity.Project;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
public interface ProjectDao {
    public Project getProjByName(String projName);

    public Project getProjById(Integer id);

    public List<Project> getProjs(Map<String, Object> map);

    public List<Project> getAllAvailable();

    public List<Project> getMyDeal(String loginUser);

    public int add(Project proj);

    public int update(Project proj);
}
