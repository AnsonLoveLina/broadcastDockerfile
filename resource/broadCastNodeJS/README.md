# 广播
    server端主动发送广播给客户端
    
## client
client分为：user和group两种。

user是指一个user在只允许一个链接注册（一个链接对应js意味着一个io.connection）。

group是指一个group可以允许多个链接注册。

调用register事件进行注册，

注册完成之后，假如有第三方或者服务内部需要发送给你信息，那么会根据你注册的user和group进行数据发送，你们之间只需约定好事件名称即可。

假如需要注销，不再收到消息，则可以调用unRegister事件进行注销。

broadcastInfo用于第三方发送给对应user或者group数据，相应事件eventName和内容text（内容可以是文本或者json）。

注：假如发送目标group包含发送人自己，发送人是不会收到消息的。
  
## client javascript
请求目录下有对应JS包，目前采用socket.io 2.1.0
    <pre><code><script type="text/javascript" src="/socket.io/socket.io.js"></script></code></pre>
    
- 代码例子

    <pre><code>
    <script type="text/javascript" src="/socket.io/socket.io.js"></script>
    <script>
        var socket = io.connect('http://localhost:3000');
        socket.on("connect",function () {
            socket.emit("register", {"user": "6A2C1FBC70FE38EEE050007F010061E5"});
        });
    
        socket.on("receive", function (data) {
            console.log(data)
        });
    
        function sendGroupRegister() {
            socket.emit("register", {"group": "vvv"});
        }
    
        function sendUserDCN() {
            var data = {};
            data.roomName = "xxx";
            data.eventName = "countMsg";
            data.text = 99;
            socket.emit("broadcastInfo", data);
        }
    
        function sendGroupDCN() {
            var data = {};
            data.roomName = "vvv";
            data.eventName = "countMsg";
            data.text = 100;
            socket.emit("broadcastInfo", data);
        }
    </script>
    </code></pre>
    
客户端可以发送三个公共事件：register,unRegister,broadcastInfo。

**register**

- 用户名，重复注册，会自动注销之前注册的用户

>例子：{"user": "6A2C1FBC70FE38EEE050007F010061E5"}

- 群组，允许重复注册

>例子：{"group": "vvv"}

**unRegister**

- 注销用户名

>例子：{"user": "6A2C1FBC70FE38EEE050007F010061E5"}

- 注销群组

>例子：{"group": "vvv"}

**broadcastInfo**

- roomName
发送房间名

- eventName
发送事件名称

- text
发送内容

>例子：{"roomName":"xxx","eventName":"countMsg","text":"99"}
{"roomName":"xxx","eventName":"countMsg","text":{"data","sdfdsf"}}

## client java

之后补充！！！！


npm:[This link](https://www.npmjs.com/package/broadcastnodejs)

docket:[This linke](https://github.com/AnsonLoveLina/webrtcDocker)
