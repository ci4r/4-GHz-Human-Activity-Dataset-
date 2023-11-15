clear; close all; clc; warning off;

%% Init.
T=5;
Fs = 1.020408163265306e+04;
NFFT =  4096;
windowLength = 2048;
windowShift = 256;

activity = 'Walking';
data_path = 'C:\Users\emrek\Desktop\Technical\77ghz\Mat Files English\';
files = dir([data_path activity '\*.mat']);

for i = 1:length(files)
    sig = 0;
    load([files(i).folder '\' files(i).name]);
    if sig ~= 0
        signal_2 = sig;
    end
    
%     time = linspace(0,length(y)/Fs,length(y));
    spectrogram = myspecgram(signal_2.',windowLength,NFFT,windowShift);
    figure('visible', 'on');
%     colormap(jet)
    imagesc(time,linspace(-Fs/2,Fs/2,NFFT),20*log10(abs(spectrogram)/(max(max(abs(spectrogram))))));
    caxis([-50 0])
    ylim([-250 250])
    iptsetpref('ImshowBorder','tight');
    axis off
    set(gca,'position',[0 0 1 1],'units','normalized')
    frame = frame2im(getframe(gcf));
    imwrite(frame,'image.png');
end
