# -*- coding: UTF-8 -*-
require 'thread'
require 'socket'
require 'json'
$html=%q{<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<title>reboot</title>
<style>
  a:hover{color: #f54f59;text-decoration:underline;}a:link{color: #4c66af;text-decoration: none;}a:visited{color: #4c66af;text-decoration: none;}*{margin:0;padding:0;}body{text-align:center;background-color:#fff;}svg{height: 100px;width: 100px;margin-top: 100px;}
</style>
</head>
<body>
<?xml version="1.0" standalone="no"?><!DOCTYPE  svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"><svg t="1573124310660" class="icon" viewBox="0 0 1179 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1580" xmlns:xlink="http://www.w3.org/1999/xlink" width="230.2734375" height="200"><defs><style type="text/css"></style></defs><path d="M597.215632 994.574713h403.714943s43.549425-8.945287 43.549425-114.64092 94.16092-577.677241-459.976092-577.677241-457.151264 541.425287-457.151264 541.425287-25.423448 160.77977 54.848735 157.013333 415.014253-6.12046 415.014253-6.120459z" fill="#FFFFFF" p-id="1581"></path><path d="M1071.786667 712.798161h72.503908v136.297931h-72.503908zM36.016552 712.798161h72.503908v136.297931H36.016552z" fill="#EA5D5C" p-id="1582"></path><path d="M305.68366 559.40926l556.254412-1.165018 0.398364 190.20464-556.254412 1.165018-0.398364-190.20464Z" fill="#4C66AF" p-id="1583"></path><path d="M1129.931034 680.312644h-59.556781c-3.295632-152.069885-67.56046-258.942529-172.079081-324.384368l115.347127-238.462529a47.08046 47.08046 0 1 0-42.372414-20.48l-114.640919 236.57931a625.934713 625.934713 0 0 0-269.30023-53.200919 625.228506 625.228506 0 0 0-270.006437 54.848736l-115.817931-235.402299a47.08046 47.08046 0 1 0-42.372414 20.715402l117.701149 238.462529c-103.812414 65.441839-167.135632 173.02069-169.960459 324.61977H47.786667a47.08046 47.08046 0 0 0-47.08046 47.08046v117.701149a47.08046 47.08046 0 0 0 47.08046 47.08046h58.615172v57.908965a70.62069 70.62069 0 0 0 70.62069 70.62069l823.908046-1.647816a70.62069 70.62069 0 0 0 70.620689-70.62069v-57.908965h59.085977a47.08046 47.08046 0 0 0 47.08046-47.08046v-117.701149A47.08046 47.08046 0 0 0 1129.931034 680.312644zM94.16092 847.212874H47.08046v-117.70115h47.08046v117.70115z m929.83908 103.106206a23.54023 23.54023 0 0 1-23.54023 23.54023l-823.908046 1.647816a23.54023 23.54023 0 0 1-23.54023-23.540229v-258.942529c0-329.563218 303.668966-365.57977 434.788046-365.815173s435.494253 34.604138 436.20046 363.931954z m105.46023-105.224827h-47.08046v-117.70115h47.08046v117.70115z" fill="#3F4651" p-id="1584"></path><path d="M464.684138 135.827126l22.363218-19.53839 40.018391 62.381609a30.131494 30.131494 0 0 0 25.423448 13.888735h2.824828a30.131494 30.131494 0 0 0 25.188046-19.067586l20.715402-79.095172 21.186207 74.387126v2.118621a30.366897 30.366897 0 0 0 52.494713 6.826667l30.366896-57.202759 13.182529 12.947126a30.131494 30.131494 0 0 0 21.186207 8.709886h57.673563a23.54023 23.54023 0 0 0 23.54023-23.54023 23.54023 23.54023 0 0 0-23.54023-23.54023h-50.140689l-23.54023-23.54023a30.366897 30.366897 0 0 0-45.668046 3.766437l-21.42161 40.01839L629.465747 19.302989a30.131494 30.131494 0 0 0-28.012873-19.067587 30.131494 30.131494 0 0 0-28.012874 19.067587l-26.60046 101.693793-29.660689-47.08046a30.366897 30.366897 0 0 0-20.48-13.653333 30.837701 30.837701 0 0 0-23.54023 6.826666l-32.250115 28.248276h-60.027586a23.54023 23.54023 0 0 0-23.54023 23.54023 23.54023 23.54023 0 0 0 23.54023 23.54023h66.148046a31.308506 31.308506 0 0 0 17.655172-6.591265zM776.121379 532.950805H404.421149A121.232184 121.232184 0 0 0 282.482759 639.352644a117.701149 117.701149 0 0 0 117.701149 129.000459h371.70023a121.232184 121.232184 0 0 0 121.938391-106.401839 117.701149 117.701149 0 0 0-117.70115-129.000459z m0 188.321839H402.302529a72.503908 72.503908 0 0 1-72.268506-56.496552 70.62069 70.62069 0 0 1 68.972874-84.744828h373.81885a72.503908 72.503908 0 0 1 72.268506 56.496552 70.62069 70.62069 0 0 1-68.502069 84.744828z" fill="#3F4651" p-id="1585"></path></svg>
<br><div id="head_" style="position: fixed;top: 0; left: 50%;background: #fff;color:#4c66af;height: 50px;width: 400px;margin-left:-200px;line-height: 50px;text-align: center;font-size: 15px; font-weight: 800;"><a href="#">管理入口</a>  ||  <a href="byruve.github.io">个人博客</a>  ||  <a href="#">历史记录</a>  </div>
  <div style="margin: 0 auto; display: block;" id="input_div">
  <font color="#000">
(๑¯ิε ¯ิ๑):</font><input type="text" id="input" style="display: inline-block; margin-top: 20px; height: 40px;background:#fff; width: 200px;outline: none;border:0px; border-bottom:#f54f59 solid 1px; color: ##fff;" value="你是谁呀？你能为我做什么呢"></div>
<div class="body_div"  id="result" style="height: auto; width: 400px; background:#fff; display:none; text-align: left; color: #000; font-weight: 800;font-size: 15px;  line-height: 20px;margin: 0 auto;margin-top: 20px;"><br>你好我是一个机器人，这是你和我的一个对话窗口，<br>你可以和我进行交互,同时我会记录你的问话记录完善我<br>如果你不同意这个协议你可以关闭使用这个页面<br>例如你可以输入“早上好”<br>你将获得我的回答“早上好，先生”<br>你：那今天的天气怎么样？<br>噢，你所在的地区天气晴朗。<br>另外，这是给你的功能直接点击就能使用<br>如果你对我说<a href="#">首页</a>你将回来这个页面<br>或许你并不能得到很好的体验，因为更多的命令与操作仅仅对<a href="#">管理员</a>有效 <br>感谢你的使用!
  </div>
<script type="text/javascript">
var val=""
 var result=""
function loadXMLDoc(v)
{
  var xmlhttp;
  if (window.XMLHttpRequest)
  {
    xmlhttp=new XMLHttpRequest();
  }
  else
  {
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function()
  {
    if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
      result="(๑¯ิε ¯ิ๑)"+v.toString()+"<br>"+xmlhttp.responseText.toString()+"<br>"+result
      document.getElementById("result").innerHTML=result;
    }
  }
  xmlhttp.open("GET",v+"***",true);
  xmlhttp.send();
}
document.onkeydown=function (event){
      var event_ = event || window.event 
    if(event_ && event_.keyCode==13){
      val=document.getElementById('input').value
    if (val=="首页") {
      window.location.href=window.location.href
    }
      else{
      loadXMLDoc(val)
        }
      }
}
function show(){document.getElementById('result').style.display="block";}
setTimeout('show()',3000)
</script>
</body>
</html>
}
class RequestHandler
    def initialize(session)
    @session = session
    end
    def unicode s
      @s=s.to_s.unpack "H*"
      @s=@s*""
      @s=@s.upcase
    end
    def bash con
      @con=con.split('bash&')[1]
      @str=@con
      @str=unicode(@con.split('*')[1].to_s) if @con.include? "*" 
      @bash=File.read("bash.json")
      @bash_hash=JSON.parse(@bash)
      @bash_hash.keys.map do |k|
      @result=@bash_hash["#{k}"].to_s+"<br>"+@result if unicode(k).include? @str
    end
    return @result
    end
    def process 
            @head=[]
            @head=@session.gets.chop.to_s.split("/")
            @head.each do |h|
                puts h.to_s+"begin to"+Time.new.to_s
            end
            print "length by get head:"
            puts @head.length
            @result="emmmmm"
        if  @head.length != 0
            if  @head[1].to_s.include? "***"
                  @request=@head[1].to_s.split("***")
                  @request[0]=@request[0].gsub('%','')
                  @string=@request[0].to_s
                  print @string
                        if @string=~/bash&(.*)/
                           @result=bash @string
                        else 
                            json=File.read("rightrepro.json")                         
                            @hash=JSON.parse(json)
                            @hash.keys.map do |k|
                            @result=@hash["#{k}"].to_s if @string.include? unicode k
                            end
                        end
                      puts @result
                      @session.puts "HTTP/1.1 200 OK"
                      @session.puts "content-type: text/html"
                      @session.puts ""
                      @session.puts @result
                @session.close
            else
                @session.puts "HTTP/1.1 200 OK"
                @session.puts "content-type: text/html"
                @session.puts ""
                @session.puts $html
                @session.close
            end
        end
    end
end
$sessionarray=Array.new
server = TCPServer.new("192.168.19.1", "8001")
$currentRequests = []
$requestedToShutDown = false
while !$requestedToShutDown
    session = server.accept
    thread = Thread.new(session) do |newSession|
        RequestHandler.new(newSession).process
    end
    $currentRequests.push(thread)
print "now get accept num by:"
puts $currentRequests.length
end
$currentRequests.each { |t| Thread.join(t) }
