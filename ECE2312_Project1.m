clc all
clear 

devices = audiodevinfo();
inputID = devices.input(1);
outputID = devices.output(1);

fs = 48000;
nBits = 8;
nChannels = 1;
duration = 5;

% Recording 1
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

% Recording 2
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

% Recording 3
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

% Voice playback
play(voice1);
pause(duration);
play(voice2);
pause(duration);
play(voice3);
pause(duration);

% Generate Plots
data1 = getaudiodata(voice1);
subplot(3,1,1)
plot(data1); xlabel('Time (s)'); ylabel('Amplitude'); title("Recording 1");

data2 = getaudiodata(voice2);
subplot(3,1,2)
plot(data2); xlabel('Time (s)'); ylabel('Amplitude'); title("Recording 2");

data3 = getaudiodata(voice3);
subplot(3,1,3)
plot(data3); xlabel('Time (s)'); ylabel('Amplitude'); title("Recording 3");

% Spectrograms
% Spectrogram for Recording 1
window = hamming(512);
N.overlap = 256;
N.fft = 1024;
[S,F,T,P] = spectrogram(data1, window, N.overlap, N.fft, fs, 'yaxis');
figure;
surf(T,F, 10*log10(P), 'edgecolor', 'none'); axis tight; view(0,90); colormap(jet);
set(gca, 'clim', [-80,-20]);
ylim([0, 8000]);
xlabel('Time (s)'); ylabel('Frequency (Hz)');

% Spectrogram for Recording 2
[S,F,T,P] = spectrogram(data2, window, N.overlap, N.fft, fs, 'yaxis');
figure;
surf(T,F, 10*log10(P), 'edgecolor', 'none'); axis tight; view(0,90); colormap(jet);
set(gca, 'clim', [-80,-20]);
ylim([0, 8000]);
xlabel('Time (s)'); ylabel('Frequency (Hz)');

% Spectrogram for Recording 3
[S,F,T,P] = spectrogram(data3, window, N.overlap, N.fft, fs, 'yaxis');
figure;
surf(T,F, 10*log10(P), 'edgecolor', 'none'); axis tight; view(0,90); colormap(jet);
set(gca, 'clim', [-80,-20]);
ylim([0, 8000]);
xlabel('Time (s)'); ylabel('Frequency (Hz)');


% Write a WAV file

voice1 = 'The_quick_brown_fox_jumps_over_the_lazy_dog.wav';
audiowrite(voice1,data1,Fs);
clear data1 Fs1

[data1,Fs1] = audioread(voice1);
sound(data1,Fs);

voice2 = 'We_promptly_judged_antique_ivory_buckles_for_the_next_prize.wav';
audiowrite(voice2,data2,Fs);
clear data2 Fs

[data2,Fs] = audioread(voice2);
sound(data2,Fs);

voice3 = 'Crazy_Fredrick_bought_many_very_exquisite_opal_jewels.wav';
audiowrite(voice3,data3,Fs);

[data3,Fs] = audioread(voice3);
sound(data3,Fs);


% Spectrograms for WAV files

datawav1 = getaudiodata('The_quick_brown_fox_jumps_over_the_lazy_dog.wav');
datawav2 = getaudiodata('We_promptly_judged_antique_ivory_buckles_for_the_next_prize.wav');
datawav3 = getaudiodata('Crazy_Fredrick_bought_many_very_exquisite_opal_jewels.wav');

% Spectrogram for 'The_quick_brown_fox_jumps_over_the_lazy_dog.wav'
window = hamming(512);
N.overlap = 256;
N.fft = 1024;
[S,F,T,P] = spectrogram(datawav1, window, N.overlap, N.fft, fs, 'yaxis');
figure;
surf(T,F, 10*log10(P), 'edgecolor', 'none'); axis tight; view(0,90); colormap(jet);
set(gca, 'clim', [-80,-20]);
ylim([0, 8000]);
xlabel('Time (s)'); ylabel('Frequency (Hz)');

% Spectrogram for 'We_promptly_judged_antique_ivory_buckles_for_the_next_prize.wav'
[S,F,T,P] = spectrogram(datawav2, window, N.overlap, N.fft, fs, 'yaxis');
figure;
surf(T,F, 10*log10(P), 'edgecolor', 'none'); axis tight; view(0,90); colormap(jet);
set(gca, 'clim', [-80,-20]);
ylim([0, 8000]);
xlabel('Time (s)'); ylabel('Frequency (Hz)');

% Spectrogram for 'Crazy_Fredrick_bought_many_very_exquisite_opal_jewels.wav'
[S,F,T,P] = spectrogram(datawav3, window, N.overlap, N.fft, fs, 'yaxis');
figure;
surf(T,F, 10*log10(P), 'edgecolor', 'none'); axis tight; view(0,90); colormap(jet);
set(gca, 'clim', [-80,-20]);
ylim([0, 8000]);
xlabel('Time (s)'); ylabel('Frequency (Hz)');
