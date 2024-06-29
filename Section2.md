# Section 2. 네트워크

## 네트워크의 기초 #1. 네트워크, 처리량, 트래픽, 대역폭, RTT

![note](notes/section2/NetworkBasic1.jpg)

<details>
<summary>Q1. 네트워크란 무엇입니까?</summary>

네트워크란 통신 장치를 의미하는 노드, 장치 간 유/무선 연결 매체를 의미하는 링크가 연결되어 자원을 공유하는 집합입니다.

</details>

<details>
<summary>Q2. 트래픽, 처리량, 대역폭은 어떤 개념입니까?</summary>

셋 다 네트워크 내 데이터 흐름에 관련된 개념입니다. 관련된 단위로는 bit per second가 있습니다.

트래픽은 특정 시점에 링크 내 흐르는 데이터의 양, 즉 발생되는 데이터의 누적량을 의미합니다.

처리량은 링크 내에서 성공적으로 전달된 데이터의 양, 즉 트래픽의 처리량을 의미합니다.

대역폭은 특정 기간 내 처리 가능한 트래픽의 양을 의미합니다.

</details>

<details>
<summary>Q3. RTT란 무엇입니까?</summary>

RTT는 Round Trip Time, 왕복 지연시간을 의미합니다. 어떤 데이터를 전송할 때 데이터의 전송 시작 시점부터 수신 확인에 소요되는 시간입니다. 즉, 메시지가 두 장치를 왕복하는 데 걸리는 시간이라고 할 수 있습니다.

</details>

## 네트워크의 기초 #2 ~ #4. 네트워크 토폴로지

![note](notes/section2/NetworkBasic2.jpg)

<details>
<summary>Q4. 네트워크 토폴로지란 무엇이고, 어떤 것들이 있나요?</summary>

네트워크 토폴로지란 네트워크에서 노드와 링크가 구성된 방식을 의미합니다. 대표적으로 버스 토폴로지, 스타 토폴로지, 트리 토폴로지, 링형 토폴로지, 메시 토폴로지가 있습니다.

버스 토폴로지는 단일 링크 내에 여러 개의 노드가 연결된 구조입니다. 스타 토폴로지는 중심이 되는 노드를 기반으로 여러 개의 노드가 연결된 구조입니다. 트리 토폴로지는 계층형 토폴로지라고도 부르며, 버스 토폴로지와 스타 토폴로지의 하이브리드 형태의 구조입니다. 링형 토폴로지는 고리 형태로 노드들이 토큰 기반으로 통신 권한을 검사하며 통신하는 구조입니다. 메시 토폴로지는 네트워크 내 다수의 노드들이 그물망 형태로 링크를 형성한 구조입니다.

</details>

<details>
<summary>Q5. 네트워크에서 병목 현상이란 무엇이고, 어떻게 해결합니까?</summary>

네트워크에서 병목 현상이란 트래픽이 집중됨에 따라 데이터 흐름이 제한되는 현상을 의미합니다. 병목 현상을 해결하기 위해서 네트워크의 토폴로지 형태를 파악하고 데이터 흐름이 집중되는 링크를 파악하여 분산형으로 바꾸거나, 해당 노드 장비의 하드웨어 스펙을 올려야 합니다.

</details>

## 네트워크의 기초 #5. 유니캐스트, 멀티캐스트, 브로드캐스트

![note](notes/section2/NetworkBasic3.jpg)

**Socket.IO Example) server.js**
```
const app = require("express")();
const http = require("http").Server(app);
const io = require("socket.io")(http);
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
    res.sendFile(__dirname + "/index.html");
});

io.on("connection", (socket) => {
    socket.on("chat message", (message) => {
        io.emit("chat message", message);
    });
});

http.listen(port, () => {
    console.log(`Socket.IO server is running at http://localhost:${port}/`);
});
```

**Socket.IO Example) index.html**
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Socket.IO Example</title>
</head>
<body>
    <ul id="messages"></ul>
    <form id="form" action="">
        <input id="input" autocomplete="off"/>
        <button>Send</button>
    </form>

    <script src="/socket.io/socket.io.js"></script>
    <script>
        const socket = io();
        
        const messages = document.getElementById("messages");
        const form = document.getElementById("form");
        const input = document.getElementById("input");

        form.addEventListener("submit", (e) => {
            e.preventDefault();
            if (input.value) {
                socket.emit("chat message", input.value);
                input.value = "";
            }
        });

        socket.on("chat message", (message) => {
            const item = document.createElement("li");
            item.textContent = message;
            messages.appendChild(item);
            window.scrollTo(0, document.body.scrollHeight);
        });
    </script>
</body>
</html>
```

<details>
<summary>Q6. 유니캐스트, 멀티캐스트, 브로드캐스트란 무엇입니까?</summary>

유니캐스트는 1:1 통신으로, 가장 일반적인 형태의 통신 방식입니다. 대표적인 예시로는 HTTP 통신이 있습니다.

멀티캐스트는 1:N 통신으로, 데이터가 특정 그룹에게만 전달되는 형태의 통신 방식입니다.

브로드캐스트는 1:N 통신으로, 데이터가 모든 노드에게 전달되는 형태의 통신 방식입니다. 대표적인 예시로는 ARP가 있습니다.

</details>