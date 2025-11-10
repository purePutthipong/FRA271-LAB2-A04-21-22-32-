load('Test.mat');    % โหลดไฟล์

% ดึง timeseries จาก Simulink Dataset (เลือก element 1)
sig = data{1};       % ถ้ามีหลายช่อง เปลี่ยนเลข {} ได้

% ดึงข้อมูลออกจาก timeseries
x = squeeze(sig.Values.Data);
t = sig.Values.Time;

% คำนวณ sampling
Ts = t(2) - t(1);
fs = 1/Ts;

% FFT
N = length(x);
Y = fft(x);
f = (0:N-1)*(fs/N);

% Plot spectrum
plot(f(1:floor(N/2)), abs(Y(1:floor(N/2))));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT Spectrum');
