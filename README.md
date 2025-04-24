minitalk<br>
<br>
minitalk is a 42 school project that involves creating a communication system between two processes using UNIX signals. The goal of the project is to implement a simple client-server application where the client sends messages to the server by encoding each character as a series of signals.<br>
<br>
Project Overview<br>
<br>
In this project, you'll create:<br>
1. A server program that listens for incoming signals and decodes them.<br>
2. A client program that sends messages to the server using the SIGUSR1 and SIGUSR2 signals to represent binary data.<br>
<br>
The main challenge is to properly encode and decode the characters using only signals, and to handle communication between processes. You will also need to manage timeouts and ensure proper synchronization between the client and server.<br>
<br>
Requirements<br>
<br>
- Understanding of UNIX signals (specifically SIGUSR1 and SIGUSR2).<br>
- Basic knowledge of how processes communicate in UNIX using signals.<br>
- Implement signal handlers to receive and send data between the client and the server.<br>
- Handle the case when the server stops unexpectedly or when there’s an error in communication.<br>
<br>
How to Compile<br>
<br>
To compile the project, use make:<br>
<br>
make<br>
<br>
To clean up object files and binaries:<br>
<br>
make clean<br>
make fclean<br>
<br>
To recompile everything:<br>
<br>
make re<br>
<br>
Usage<br>
<br>
Server:<br>
<br>
To start the server, run the following command:<br>
<br>
./server<br>
<br>
The server will wait for incoming connections and print received messages to the terminal.<br>
<br>
Client:<br>
<br>
To send a message to the server, run the following command:<br>
<br>
./client <server_pid> <message><br>
<br>
- <server_pid>: the process ID of the server.<br>
- <message>: the string message that will be sent to the server, character by character.<br>
<br>
Example:<br>
<br>
./client 12345 "Hello, Server!"<br>
<br>
This sends the message "Hello, Server!" to the server with the process ID 12345.<br>
<br>
How It Works<br>
<br>
1. The client encodes each character in the message as a binary string.<br>
2. Each bit of the binary string is sent as a SIGUSR1 (for 0) or SIGUSR2 (for 1).<br>
3. The server receives these signals, decodes them into characters, and reconstructs the message.<br>
<br>
Signal Handling:<br>
- SIGUSR1 is used to send a bit of value 0.<br>
- SIGUSR2 is used to send a bit of value 1.<br>
- The server decodes the signal sequence into the corresponding characters and outputs the message.<br>
<br>
Example<br>
<br>
Server:<br>
<br>
$ ./server<br>
Server is running. Waiting for messages...<br>
<br>
Client:<br>
<br>
$ ./client 12345 "Hello"<br>
Message sent to server!<br>
<br>
The server will print:<br>
<br>
Received message: Hello<br>
<br>
Key Concepts<br>
<br>
- UNIX signals (SIGUSR1 and SIGUSR2).<br>
- Signal handlers in C.<br>
- Process communication using signals.<br>
- Handling message encoding and decoding.<br>
<br>
Bonus<br>
<br>
If you implement the bonus part of the project, you can:<br>
- Add the ability to send more complex data, like file content.<br>
- Improve the synchronization between client and server.<br>
<br>
Notes<br>
<br>
- Ensure that the server is running before starting the client.<br>
- If the server is stopped unexpectedly or there is an error in transmission, the client should handle the error gracefully.<br>
<br>
Useful Resources<br>
<br>
- UNIX Signals - Wikipedia: https://en.wikipedia.org/wiki/Signal_(IPC)<br>
- Signal Handling in C: https://www.gnu.org/software/libc/manual/html_node/Signal-Handling.html<br>
<br>
