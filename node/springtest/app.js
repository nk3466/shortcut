const app = require('express')();
//const cors = require('cors');
const connect = require('./schemas');
const dotenv = require('dotenv');
dotenv.config();

//app.use(cors());
const http = require('http').Server(app);
const io = require("socket.io")(http, {
    cors: {
      origin: "*",
      methods: ["GET", "POST"],
      allowedHeaders: ["Access-Control-Allow-Origin"],
      credentials: false
    },
    transport: ['websocket']
  });
connect();
app.get('/', function (req, res) {
    res.send('<h1>안녕하세요 "/" 경로 입니다.</h1>');
});
 
io.on('connection', function (socket) {
    const date = new Date;
    console.log(`한명의 유저가 접속을 했습니다.${date}`);
    socket.on('disconnect', function () {
        
        console.log(`한명의 유저가 접속해제를 했습니다.${date}`);
    });
 
    // socket.on('send_msg', function (msg) {
    //     console.log(msg);
    // });

    socket.on('send_msg', function (toId, msg) {
        socket.to(toId).emit ( "send_msg" , socket.id, msg); 
      
        console.log("msg" + msg);
        console.log("보낸이" + socket.id);
        console.log("받는이" + toId);
        //다시, 소켓을 통해 이벤트를 전송한다.
        //io.emit('send_msg', msg);

        // MongDB에다가 DB저장해야함. 
        //1. ROOM으로 해야할까? 
        //2. 아니면 MONGODB로 어캐해야하지? 
    });

    socket.on('send_user_Id', function (msg) {
        socket.id = msg;
        console.log("UserID:" + msg);
        console.log("socket.id : " + socket.id);
    });


});
 
http.listen(8002, function () {
    console.log('listening on *:8002');
});
