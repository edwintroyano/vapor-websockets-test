# Vapor Websocket tests

Simple Vapor web app to test websockets with GET URL parameters

###Start server:

`vapor build && vapor run`

## A. Doesn't work with GET URL parameters

Connect to `ws://localhost:8080/event?parameter=b`:

```
» wsta "ws://localhost:8080/event?parameter=b" -I
WebSocket upgrade request
---
Host: localhost:8080
Connection: Upgrade
Upgrade: websocket
Sec-WebSocket-Version: 13
Sec-WebSocket-Key: AXltXFmGcDnD8UWHfn6A3w==
Origin: http://localhost


WebSocket upgrade response
---
404 Not Found
content-length: 9
date: Tue, 12 Jun 2018 11:54:47 GMT


WebSocketError: WebSocket response error
```

Vapor server prints in log:

```
[ ERROR ] (Function) (Logger+LogError.swift:32)
[ DEBUG ] Conform `(String, String, String, UInt, UInt) -> ()` to `Debuggable` for better debug info. (Logger+LogError.swift:34)
```


## B. Works without GET URL parameters


Connect to `ws://localhost:8080/event`:

```
wsta ws://localhost:8080/event -I
WebSocket upgrade request
---
Host: localhost:8080
Connection: Upgrade
Upgrade: websocket
Sec-WebSocket-Version: 13
Sec-WebSocket-Key: kaaTGCWD+FL4eYObXVjC9g==
Origin: http://localhost


WebSocket upgrade response
---
101 Switching Protocols
Upgrade: websocket
Sec-WebSocket-Accept: gncqwda+ZhbFnyKC0Cm6hhcJnHw=
Connection: upgrade


Connected to ws://localhost:8080/event
```