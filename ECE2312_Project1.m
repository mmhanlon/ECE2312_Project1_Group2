clc
clear

devices = audiodevinfo();
inputID = devices.input(1);
outputID = devices.output(1);

fs = 48000;
nBits = 8;
nChannels = 1;
duration = 5;

voice1 = audiorecorder(fs, nBits, nChannels, 1);
disp("The quick brown fox jumps over the lazy dog");
disp("3")
pause(1)
disp("2")
pause(1)
disp("1")
pause(1)
disp("Recording 1");
record(voice1, duration);
pause(duration)
disp("Recording done");
disp(" ");
pause(3)

voice2 = audiorecorder(fs, nBits, nChannels, 1);
disp("We promptly judged antique ivory buckles for the next prize");
disp("3")
pause(1)
disp("2")
pause(1)
disp("1")
pause(1)
disp("Recording 2");
record(voice2, duration);
pause(duration)
disp("Recording done");
disp(" ");
pause(3)

voice3 = audiorecorder(fs, nBits, nChannels, 1);
disp("Crazy Fredrick bought many very exquisite opal jewels");
disp("3")
pause(1)
disp("2")
pause(1)
disp("1")
pause(1)
disp("Recording 3");
record(voice3, duration);
pause(duration)
disp("Recording done");
disp(" ");

play(voice1);
pause(duration);
play(voice2);
pause(duration);
play(voice3);
pause(duration);

data = getaudiodata(voice1);
subplot(3,1,1)
plot(data); xlabel('Time in Seconds'); ylabel('Amplitude'); title("Recording 1");

data = getaudiodata(voice2);
subplot(3,1,2)
plot(data); xlabel('Time in Seconds'); ylabel('Amplitude'); title("Recording 2");

data = getaudiodata(voice3);
subplot(3,1,3)
plot(data); xlabel('Time in Seconds'); ylabel('Amplitude'); title("Recording 3");
