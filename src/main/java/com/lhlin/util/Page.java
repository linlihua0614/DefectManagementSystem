package com.lhlin.util;

import java.util.List;

/**
 * Created by Administrator on 2020/8/22 0022.
 */
public class Page<T> {
    //已知数据
    private int pageNum;    //当前页,从请求那边传过来。
    private int pageSize = 10;    //每页显示的数据条数。
    private int totalNum;    //总的记录条数。查询数据库得到的数据

    //需要计算得来
    private int totalPage;    //总页数，通过totalRecord和pageSize计算可以得来
    //开始索引，也就是我们在数据库中要从第几行数据开始拿，有了startIndex和pageSize，
    //就知道了limit语句的两个数据，就能获得每页需要显示的数据了
    private int startIndex;


    //将每页要显示的数据放在list集合中
    private List<T> list;


    //通过pageNum，pageSize，totalRecord计算得来tatalPage和startIndex
    //构造方法中将pageNum，pageSize，totalRecord获得
    public Page(int pageNum,int pageSize,int totalNum) {
        this.pageNum = pageNum<=0?1:pageNum;
        this.pageSize = pageSize<=0?10:pageSize;
        this.totalNum = totalNum<0?0:totalNum;

        //totalPage 总页数
        if(this.totalNum%this.pageSize==0){
            //说明整除，正好每页显示pageSize条数据，没有多余一页要显示少于pageSize条数据的
            this.totalPage = this.totalNum / this.pageSize;
        }else{
            //不整除，就要在加一页，来显示多余的数据。
            this.totalPage = this.totalNum / this.pageSize +1;
        }

        if(this.totalPage<this.pageNum){
            this.pageNum = this.totalPage;
        }

        //开始索引
        this.startIndex = (this.pageNum-1)*this.pageSize <0?0:(this.pageNum-1)*this.pageSize ;

    }
    //get、set方法。
    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

}
