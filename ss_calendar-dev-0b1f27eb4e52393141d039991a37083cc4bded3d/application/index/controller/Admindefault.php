<?php
/**
 * Created by PhpStorm.
 * User: yym
 * Date: 2019-04-08
 * Time: 09:49
 */

namespace app\index\controller;


use think\Controller;

class Admindefault extends Controller
{
    //进入事项页面的方法
    public function gotoScheduleItem(){
        $model = model('ScheduleItem');
        $scheduleitems = $model->getAllItems();
        $this->assign('scheduleitems',$scheduleitems);
        return $this->fetch('scheduleitem');
    }
    //添加事项的方法
    public function  addScheduleItem()
    {
        $des = $_POST['des'];
        $model = model('ScheduleItem');
        $isHasSame = $model->getItemByName($des);
        if ($isHasSame == null) {
            $res = $model->insertScheduleItem($des);
            if($res ==1){
                $this->success("新增成功",'gotoScheduleItem');
            }
            else{
                $this->error("添加失败，请重新尝试");
            }
        }
        else{
            $this->error("名称重复");
        }
    }
    //删除事项
    public function deleteScheduleItem(){
     $id = $_POST['id'];
     $model = model('ScheduleItem');
     $res = $model->deleteScheduleItem($id);
     if($res == 1){
         $this->success("删除成功",'admindefault/gotoscheduleitem');
     }
     else{
         $this->error(  "删除失败，请重新操作!");
     }
    }
    //编辑事项方法
    public function editScheduleItem(){
        $id = $_POST['id'];
        $des = $_POST['des'];
        $model = model('ScheduleItem');
        $isSame = $model->getItemByName($des);
        if($isSame ==null){
            $res = $model->updateScheduleItem($id,$des);
            if($res ==1){
                $this->success("编辑成功",'gotoscheduleitem');
            }
            else{
                $this->error(  "编辑失败，请重新操作!");
            }
        }
        else{
            $this->error(  "修改事项名称与已有重复，请重新修改!");
        }
    }
}