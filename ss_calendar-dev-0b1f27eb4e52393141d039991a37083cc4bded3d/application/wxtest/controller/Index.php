<?php
/**
 * Created by PhpStorm.
 * User: 6组傅广播
 * Date: 2019/4/9 0009
 * Time: 23:29
 */
namespace app\wxtest\controller;

use think\Controller;

class Index extends Controller
{
    //申请到的企业微信id和secret
    private $appid = "";
    private $secret = "";
    //根据用户传来的code和accessToken获取用户信息（id）
    public function index(){
        $code = input('param.code');
        $token = $this->getToken();
        $url = 'https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token='.$token.'&code='.$code;
        $json= $this->https_request($url);
    }

    /*---------------------------------------------获取accessToken----------------------------------------------------------*/
    function getToken(){
        return $this->checkAccessToken($this->appid,$this->secret);
    }

    /**
     * @param $appid
     * @param $appsecret
     * @return 获取到的accessToken
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    //获取access_token，若过期则重新申请
    function checkAccessToken($appid,$appsecret){
        $condition = array('appid'=>$appid,'appsecret'=>$appsecret);
        $access_token_set=DB('wxtoken')->where($condition)->find();//获取数据

        if($access_token_set){
            //检查是否超时，超时了重新获取
            if($access_token_set['AccessExpires']>time()){
                //未超时，直接返回access_token
                return $access_token_set['access_token'];
            }else{
                //已超时，重新获取
                $url_get='https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid='.$appid.'&corpsecret='.$appsecret;
                $json= $this->https_request($url_get);
                $access_token=$json['access_token'];
                $AccessExpires=time()+intval($json['expires_in']);
                $data['access_token']=$access_token;
                $data['AccessExpires']=$AccessExpires;
                $result = DB('wxtoken')->where($condition)->update($data);//更新数据
                if($result){
                    return $access_token;
                }else{
                    return $access_token;
                }
            }
        }else{
            echo "appid或appsecret不正确";
            return false;
        }
    }

    /**
     * @param $url
     * @return get请求得到的数据
     */
    function https_request ($url){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $out = curl_exec($ch);
        curl_close($ch);
        return  json_decode($out,true);
    }
}