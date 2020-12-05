package com.lhlin.dao;

import com.lhlin.entity.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
public interface UserDao {
    public User getUserByUserName(String userName);

    public List<User> getUsers(Map<String,Object> map);

    public int add(User user);

    public int update(User user);
}
