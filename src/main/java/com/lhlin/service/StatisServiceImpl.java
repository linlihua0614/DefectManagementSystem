package com.lhlin.service;

import com.lhlin.dao.DefectDao;
import com.lhlin.dao.StatisDao;
import com.lhlin.entity.*;
import com.lhlin.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
@Service
public class StatisServiceImpl implements StatisService {
    @Autowired
    private StatisDao statisDao;


    @Override
    public List<Seriousness> getSeriousness(Seriousness seriousness) {
        return statisDao.getSeriousness(seriousness);
    }

    @Override
    public List<Priority> getPriority(Priority priority) {
        return statisDao.getPriority(priority);
    }
}
