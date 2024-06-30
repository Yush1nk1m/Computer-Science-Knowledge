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

## 네트워크의 분류: LAN, MAN, WAN

![note](notes/section2/LAN_MAN_WAN.jpg)

<details>
<summary>Q7. LAN, MAN, WAN이란 무엇입니까?</summary>

LAN, Local Area Network는 허브 또는 스위치로 연결된 지역적 네트워크입니다. 공유기에 연결된 장치들에게 DHCP로 사설 IP를 부여하고, NAT로 장치들의 MAC 주소를 고유하게 구분합니다. MAN, WAN에 비해 안정성과 속도가 뛰어나다는 특징이 있습니다.

MAN, Metropolitan Area Network는 라우터, 브리지 등으로 연결된 도시 간 네트워크입니다. 2개 이상의 LAN으로 구성됩니다.

WAN, Wide Area Network는 MAN에서 확장하여 더 많은 라우터들로 구성된 국가 간 네트워크입니다. 인터넷이라고도 부릅니다.

</details>

## TCP/IP 4계층 #1. 개념, 캡슐화, 역캡슐화, PDU, OSI 7계층

![note](notes/section2/TCP_IP1.jpg)

<details>
<summary>Q8. TCP/IP 4계층에는 어떤 것들이 있고, 각 계층의 역할은 무엇입니까?</summary>

TCP/IP 4계층은 애플리케이션 계층, 트랜스포트 계층, 인터넷 계층, 네트워크 액세스 계층으로 구성됩니다.

애플리케이션 계층에서는 실질적인 서비스를 사용자에게 제공하며, 대표적인 프로토콜로는 HTTP, FTP, SMTP, SSH가 있습니다. Protocol Data Unit은 메시지입니다.

트랜스포트 계층에서는 애플리케이션 계층에서 전달받은 메시지를 데이터그램화 또는 세그먼트화하고 이들이 오류 없이 순서대로 전송되는 것을 보장하는 역할을 합니다. 대표적인 프로토콜로는 TCP, UDP가 있습니다. Protocol Data Unit은 세그먼트 또는 데이터그램입니다.

인터넷 계층에서는 트랜스포트 계층에서 전달받은 세그먼트 또는 데이터그램을 패킷화하여 목적지로 전송하는 역할을 합니다. 대표적인 프로토콜로는 IP, ARP, ICMP가 있습니다. Protocol Data Unit은 패킷입니다.

네트워크 액세스 계층에서는 인터넷 계층에서 전달받은 패킷을 유/무선으로 물리적 전송하는 역할을 합니다. 데이터 링크 계층과 물리 계층이 합쳐진 형태로, Protocol Data Unit은 데이터 링크 계층의 경우 프레임, 물리 계층의 경우 비트입니다.

</details>

<details>
<summary>Q9. 캡슐화와 역캡슐화에 대해 설명하세요.</summary>

캡슐화는 애플리케이션 계층부터 물리 계층까지 내려가며 데이터에 독립적인 헤더들을 붙여 나가는 과정입니다. 애플리케이션 계층에서 메시지였던 것이 TCP 헤더, IP 헤더, CRC/Checksum 등이 추가되면서 캡슐화됩니다. 이는 송신자가 수신자에게 데이터를 전송하는 상황에 일어납니다.

역캡슐화는 물리 계층부터 애플리케이션 계층까지 올라가며 데이터의 독립적인 헤더들을 떼어 나가는 과정입니다. CRC에서 전송 오류를 감지, Checksum에서 데이터 무결성을 검사한 후 IP 헤더에서 목적지 주소 등의 정보를 확인하고 TCP 헤더에서 오류 검사 및 순서 검사 등을 하면서 최종적으로 애플리케이션 계층에 도달하면 수신자에게 메시지 전달이 성공합니다. 이는 수신자가 데이터를 수신하는 상황에 일어납니다.

</details>

<details>
<summary>Q10. OSI 7계층과 TCP/IP 4계층의 차이점은 무엇입니까?</summary>

OSI는 애플리케이션, 프레젠테이션, 세션 계층이 TCP/IP에서의 애플리케이션 계층과 동일합니다. 트랜스포트 계층은 동일합니다. OSI의 네트워크 계층은 TCP/IP에서의 인터넷 계층과 동일합니다. OSI의 데이터 링크, 물리 계층은 TCP/IP에서의 네트워크 액세스 계층과 동일합니다.

</details>

## TCP/IP 4계층 #2. MTU, MSS, PMTUD

![note](notes/section2/TCP_IP2.jpg)

<details>
<summary>Q11. MTU와 MSS에 대해 설명하고, 어떤 차이점이 있는지 설명하세요.</summary>

MTU는 Maximum Tranmission Unit으로, 네트워크 내에 있는 장치가 수용 가능한 데이터 패킷의 최대 크기를 의미합니다. 여기서 데이터 패킷의 크기는 TCP 헤더의 크기, IP 헤더의 크기, Payload의 크기를 모두 합한 것입니다.

MSS는 Maximum Segment Size로, 네트워크 내에 있는 장치가 수용 가능한 데이터의 최대 크기를 의미합니다. 여기서 데이터의 크기는 Payload만의 크기를 의미합니다.

통상 MTU는 1,500 바이트입니다. 그리고 TCP 헤더와 IP 헤더가 각각 20 바이트를 차지하기 때문에 MSS는 통상 1,460 바이트입니다.

</details>

<details>
<summary>Q12. MTU보다 큰 데이터를 보내면 어떤 일이 일어나나요?</summary>

MTU보다 큰 데이터를 전송하면 데이터가 Segmentation될 수 있습니다. 언제나 일어나는 것은 아닙니다. 예를 들어 IPv6은 기본적으로 Segmentation을 허용하지 않고, IPv4는 IP 헤더의 flags 필드에서 Don't fragment를 의미하는 1번 비트가 설정되어 있으면 Segmentation이 허용되지 않습니다.

Segmentation이 허용되지 않으면 패킷 전송에 실패하기 때문에 송신자는 PMTUD, Path MTU Discovery를 통해서 중간에 패킷이 누락된 경우 패킷의 크기를 줄여가며 반복 전송하면서 MTU 이하의 크기를 갖는 데이터를 전송할 수 있습니다.

</details>