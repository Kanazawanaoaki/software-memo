# software lec07
ソフトウェア第二の第７回．  

## CORBA C言語
```
omniidl -bcxx echo.idl
g++ -g -o echo-server echo-server.cpp echo_impl.cpp echoSK.cc `pkg-config omniORB4 --cflags --libs`
g++ -g -o echo-client echo-client.cpp echoSK.cc `pkg-config omniORB4 --cflags --libs`
```
```
./echo-server -ORBInitRef NameService=corbaloc:iiop:127.0.0.1:2809/NameService
./echo-client -ORBInitRef NameService=corbaloc:iiop:127.0.0.1:2809/NameService
```

## CORBA Python
```
omniidl -bpython echo.idl

```
