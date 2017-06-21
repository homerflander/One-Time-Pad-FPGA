# One-Time-Pad-FPGA V1.00 (Completed/Working)
Created by Van. June 2017 

64-Bits One-Time Pad on FPGA Board (Nexys 4 DDR Artix-7). <br />
8-Bits for each of the 8 Seven-Segment LEDS. (8x8=64) <br />

(Possible future improvements, let user decide desired bit size of msg/key/try, use sixteen-segment LEDs)
-64Bit Suspectible to bruteforce attack.
-Seven-Segment difficult to express range of alphabets due to multiple overlaps

Device Details:<br />
 Product Category=General Purpose <br />
 Family=Artix-7 <br />
 Sub-Family=Artix-7 <br />
 Package=CSG324 <br />
Speed Grade=-1 <br />
 Part=xc7a100tcsg324-1 <br />

--------------------Demonstration--------------------<br />
Top Level Architecture/Psuedocode Sketch: <br />
![Top](/demo/12.png)

Data Path Architecture Sketch: <br />
![DP](/demo/11.png)

ASM Chart Sketch:<br />
![ASM](/demo/13.png)

Sample Translation Table for In(Alphabet/Space->Decimal->Binary Input)<br />
Space-> 0 ->00000000<br />
A-> 1 -> 00000001<br />
B-> 2 -> 00000010<br />
C-> 3 -> 00000011<br />
...<br />
X-> 24 -> 00011000<br />
Y-> 25 -> 00011001<br />
Z-> 26 -> 00011010<br />

Translation Chart Sketch:<br />
![Table](/demo/14.png)

DEMO:<br />
![Switch Binding](/demo/1.png)
![Enter MSG](/demo/2.JPG)
![Put Pass](/demo/3.JPG)
![Input Pass](/demo/4.JPG)
![Wait](/demo/5.JPG)
![Incorrect Try](/demo/6.JPG)
![Incorrect Decrypt](/demo/7.JPG)
![Correct Try](/demo/8.JPG)
![Correct Decrypt](/demo/9.JPG)
![Reset](/demo/10.JPG)
