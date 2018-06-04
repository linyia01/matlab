function [f,y]=fft_simple(input,sample,min,max)
%input 输入信号
%sample 信号采样率
%分析最小频谱
%分析最大频谱
sample = 1/sample
Tspan =[ 0:sample:(length(input)-1)*sample];
srate=length(Tspan)/Tspan(end);
N=length(input);
z=abs(fft(input,N))*2/N;
p_s=0:1:N/2;
df=srate/N;
f_s=p_s*df;
f=f_s(int16(min/df)+1:1:int16(max/df)+1);
y=z(int16(min/df)+1:1:int16(max/df)+1);
end
