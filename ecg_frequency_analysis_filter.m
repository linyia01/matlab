path_str='E:\works\ST-T\心房颤动\';
listing = dir(path_str);
d=fdesign.lowpass('N,F3dB',5,40,1000) %定义滤波
Hd=design(d,'butter');
for filename ={listing.name}
    namestr=cell2mat(filename);
    if length(strfind(namestr,'.txt')) > 0
        stdata=importdata([path_str,namestr]);
        figure(1);
        plot(stdata(2,:));
        DATA1=stdata(2,:)
        [fl,yl]=fft_simple(DATA1,1000,0,180); %频谱分析
        figure(2);
        plot(fl,yl,'r','LineWidth',2);
        xlabel('Frequency/Hz');ylabel('Amplitude')
        y=filter(Hd,DATA1)  %滤波
        save([path_str,namestr,'.mat'],'y') %保存滤波结果
        figure(3);
        plot(y);
        DATA1=y
        [fl,yl]=fft_simple(DATA1,1000,0,180); %滤波后的频谱分析
        figure(4);
        plot(fl,yl,'r','LineWidth',2);
        xlabel('Frequency/Hz');ylabel('Amplitude')
        input('next:');
    end
end
