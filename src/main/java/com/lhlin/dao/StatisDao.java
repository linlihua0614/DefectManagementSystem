package com.lhlin.dao;

import com.lhlin.entity.*;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
public interface StatisDao {
    public List<Seriousness> getSeriousness(Seriousness seriousness);

    public List<Priority> getPriority(Priority priority);
}
