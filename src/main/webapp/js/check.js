/**
 * Created by Administrator on 2020/9/6 0006.
 */
function is_empty(str){
    if(str==null || str==undefined || str.trim()==""){
        return true;
    }
    return false;
}

function is_allow_length(str,maxLength){
    if(str.length<=maxLength){
        return true;
    }
    return false
}

function is_allow_username(username){
    if (/^(\d|[a-zA-Z])+$/.test(username)){
        return true;
    }
    return false;
}
