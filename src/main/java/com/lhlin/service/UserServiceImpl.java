package com.lhlin.service;

import com.lhlin.dao.UserDao;
import com.lhlin.entity.User;
import com.lhlin.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2020/7/18 0018.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User getUserByUserName(String userName) {
        return userDao.getUserByUserName(userName);
    }

    @Override
    public Page<User> getUsers(Map<String,Object> map) {
        if(map.get("pageNum")==null || map.get("pageSize")==null){
            return  new Page<User>(0,10,0);
        }
        if(!(map.get("pageNum") instanceof Integer) || !(map.get("pageSize") instanceof Integer)){
            return  new Page<User>(0,10,0);
        }
        List<User> users = userDao.getUsers(map);
        if(users==null || users.isEmpty()){
            return  new Page<User>(0,10,0);
        }

        int totalNum = users.size();
        Page<User> page = new Page<User>((Integer)map.get("pageNum"),(Integer)map.get("pageSize"),totalNum);
        int startIndex = page.getStartIndex();
        int pageNum = page.getPageNum();
        map.put("startIndex",startIndex);
        map.put("pageNum",pageNum);
        List<User> pusers = userDao.getUsers(map);
        page.setList(pusers);
        return page;
    }

    @Override
    public int add(User user) {
        return userDao.add(user);
    }

    @Override
    public int update(User user) {
        return userDao.update(user);
    }

}
