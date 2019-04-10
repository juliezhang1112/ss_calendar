<?php
namespace app\index\model;
use think\Model;
use think\Db;

/**
 * @Purpose:
 * schedule_time 数据表交互，增删改用户可选时间，如上午、下午等
 * @Author 第12组 黄捷
 * @Date 2019-4-7
 * @Time 11：53 
 */
class ScheduleTime extends Model
{
	protected $table = 'schedule_time';

}