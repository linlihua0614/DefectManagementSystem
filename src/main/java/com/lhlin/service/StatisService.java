package com.lhlin.service;

import com.lhlin.entity.*;
import com.lhlin.util.Page;

import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2020/7/18 0018.
 */
public interface StatisService {
    public List<Seriousness> getSeriousness(Seriousness seriousness);

    public List<Priority> getPriority(Priority priority);

}
