
This is the RX program with the OctaPong built into it.

I believe they had the groups send 2 pieces of info:
1. group number (1 - 8)
2. a command for pong: left / right / online or offline

For example: 6r, or 3L, etc.

They imported the processing.serial library.
They create a "port" object.
They create a string variable called "data" (and I believe a string variable is considered as an array of chars -- 1 byte each)

There is a special function that is triggered whenever data appears on the sertial port:

void serialEvent(Serial port)

The string is read into "data".
Then we look at one byte/char at a time