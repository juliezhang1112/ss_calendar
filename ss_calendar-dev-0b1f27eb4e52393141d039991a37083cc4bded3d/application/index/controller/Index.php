<?php
namespace app\index\controller;
use think\Controller;
use app\index\model\ScheduleTime;
use think\Db;
use think\Request;

class Index extends Controller
{	
	
    public function index()
    {
    	/**
         * ThinkPHP版本为5.0.24
    	 * 测试index界面
    	 * by 第12组 黄捷
    	 */
        return $this->fetch();
       /* return '<style type="text/css">*{ padding: 0; margin: 0; } .think_default_text{ padding: 4px 48px;} a{color:#2E5CD5;cursor: pointer;text-decoration: none} a:hover{text-decoration:underline; } body{ background: #fff; font-family: "Century Gothic","Microsoft yahei"; color: #333;font-size:18px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.6em; font-size: 42px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p> ThinkPHP V5<br/><span style="font-size:30px">十年磨一剑 V1.1 - 为API开发设计的高性能框架</span></p><p>This is a test</p></div>';*/
    }

    /**
     * @purpose：
     *  添加每天时间段
     * @Author 第12组 黄捷
     * @Date 2019-4-7
     * 
     */
    public function time()
    {
        
        // 显示未删除的时间端，is_delete标记为零         
    	$list = new ScheduleTime();
        $list = $list->where('is_delete',0)
                     ->select();        
        // 使用模板渲染的foreach标签         
        $this->assign('list',$list);
        return $this->fetch();
    }

    //编辑时间
    public function timechange()
    {
        // 获取post数据，考虑权限控制吗？如果有机器无限制post或者get会怎样？网站的安全控制策略
        $id = Request::instance()->param('id');
        $name = Request::instance()->param('name');

        $timeRec = new ScheduleTime();
        // 查询符合条件的时段描述
        $timeRec = $timeRec->where('id',$id)
                            ->find();
        $timeRec->name = $name;
        $timeRec->update_time = date("Y-m-d H:i:s");
        $res = $timeRec->save();
        if($res)
        {
            return "更新成功";
        }
        return "更新失败";        
    }

    //删除时间
    public function timedelete()
    {
        // 获取post数据
        $id = Request::instance()->param('id');
        $name = Request::instance()->param('name');

        $timeRec = new ScheduleTime();
        // 查询符合条件的时段描述
        $timeRec = $timeRec->where('id',$id)
                            ->find();
        $timeRec->is_delete = 1;
        $timeRec->delete_time = date("Y-m-d H:i:s");
        $res = $timeRec->save();
        if($res)
        {
            return "删除成功";
        }
        return "删除失败";        
    }

    //编辑时间
    public function timeadd()
    {
        // 获取post数据        
        $name = Request::instance()->param('name');
        $timeRec = new ScheduleTime();       
        $timeRec->name = $name;
        $timeRec->is_delete = 0;
        // create_time数据库自己更新
        $res = $timeRec->save();
        if($res)
        {
            return "更新成功";
        }
        return "更新失败";        
    }
}
