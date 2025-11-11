In this project, you will be designing a custom microphone system using a multiprocessor 
system on a chip (an MPSoC) system that has an FPGA and ARM microprocessor (assume 
you are a start-up company who wants to develop custom audio hardware and 
applications). Your product involves capturing user audio (as a personal recording device) 
via a microphone and then processing the audio using the MPSoC.  
There are two parts/tasks to the project with the first task being to develop a basic 
microphone system and the second task extending the basic design based on each team’s 
choice of extension. The basic microphone system will include an I2S MEMS microphone 
breakout board interfaced with the FPGA. The FPGA module of the system will drive the 
microphone, collect the audio samples from the microphone, and send the audio samples to 
the software running on the ARM processor. As an example, the software for the basic 
system can be a simple audio recorder that records and save the collected audio samples 
into a wav file that can be played back using a media player or into a csv file that can 
opened with an application such as MATLAB to display the waveform or playback. 
The second task will be a more open-ended system extension task where teams can decide 
what features to add to their microphone system. See the deliverables and talk to your tutors 
for what options can you extend on. 

<img width="521" height="274" alt="image" src="https://github.com/user-attachments/assets/40f1c7ab-a288-44bd-9915-32b3ec4fb8fc" />

## Development Board
The development board (MPSoC Board) chosen for this course is the Xilinx Kria KV260 Vision 
AI Starter Kit which is a development kit that includes a Zynq UltraScale+ MPSoC. The MPSoC 
IC combines a quad-core ARM Cortex A53 hard processor (usually referred as processing 
system or PS) and an FPGA (referred as programmable logic or PL). PS will run a custom Linux 
image which referred to as PetaLinux. On the top of PetaLinux, drivers and recorder 
application (or any other application) can be executed to save audio samples from the 
microphone (or perform any software operation that you intend).  

## I2S MEMS Microphone
I2S MEMS Microphone is a small microphone that converts sound to voltage and gives out 
the sampled audio as a purely digital signal. This microphone is capable of capturing sound 
waves with frequencies ranging from 50Hz to 15KHz, which is good for all general audio 
recording/processing applications. The microphone supports I2S (Inter-IC Sound) serial bus 
interface protocol, which is used for connecting digital audio devices together, and this 
protocol is being used to transfer the sampled audio data (digital) to the FPGA-based audio 
processing pipeline in the project. 

## Source Code Structure 
<img width="553" height="331" alt="image" src="https://github.com/user-attachments/assets/ef0dbafe-8e94-456d-acf7-2a61a4f8842b" 
  
## Components Provided 
• 1x Kria KV260 Vision AI Starter Kit 
• 1x Power Supply 
• 2x I2S MEMS Microphone 
• Wires 

## Deliverables 
Task1: 
Design and develop a basic I2S microphone system using the provided I2S MEMS microphones 
and the Kria development board. The system should be able to record an audio clip from the 
microphone that are wired to the PMOD pins connected to the FPGA of the MPSoC. 
Task2: 
Extend on your basic I2S microphone system. This could be: 
• Electronics 
o Supporting microphones of other protocols 
o Adding physical control methods to the audio 
o Others 
• FPGA 
o DSP (Volume/Gain control, FIR filter, etc.) 
o Audio monitoring 
o Audio format (sample rate, etc.) 
o Others 
• Software application 
o Audio messaging 
o Audio monitoring 
o Audio networking 
o Others 
Be curious and use your creativity for task 2. 

## References 
• https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html 

• https://www.xilinx.com/products/silicon-devices/soc/zynq-ultrascale-mpsoc.html 

• https://www.adafruit.com/product/3421 

• https://digilent.com/reference/pmod/pmodbb/reference-manual?redirect=1 

• https://en.wikipedia.org/wiki/I%C2%B2S 
