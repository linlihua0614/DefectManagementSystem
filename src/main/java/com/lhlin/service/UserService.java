package com.lhlin.service;

import com.lhlin.entity.User;
import com.lhlin.util.Page;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
public interface UserService {
    public User getUserByUserName(String userName);

    public Page<User> getUsers(Map<String,Object> map);

    public int add(User user);

    public int update(User user);

}
