<?php
/**
 * Created by PhpStorm.
 * User: zhangjunlan
 * Date: 2019-04-10
 * Time: 09:58
 */

class index
{
    public function showPage(){
        // 数据库操作


        // 返回视图



        //列表
        public function user_position_list() {
            $list = Db::table('user_position')
                ->select();
            $this->assign("list", $list);
            return $this->fetch();
        }

        //作废
        function invalid($user_id) {
            $data = array();
            $data['is_delete'] = 1;
            $data['delete_time'] =  Db::raw('now()');
            Db::table('user_position')->where('id', $user_id)->update($data);
            $this->redirect('/index/index/user_position_list');
        }
        //恢复
        function restore($user_id) {
            $data = array();
            $data['is_delete'] = 0;
            $data['delete_time'] =  Db::raw('now()');
            Db::table('user_position')->where('id', $user_id)->update($data);
            $this->redirect('/index/index/user_position_list');
        }
    }
    }
}