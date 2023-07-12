clc;
clear;
clear all;

%%%%Q1 

output = dtmf('05429189'); %% finding dtmf frequency of the number
filename = '05429189.wav';
audiowrite(filename,cikti,8000); %% saving the recording

%%%% Q2 

% 05429189.wav encoding the number according to dtmf
        [tel,fs] = audioread('05429189.wav');
        n=11;
        d = floor(length(tel)/n);
            T = 100000/fs;
            sinyalGrafik = 1:T:100000*(length(tel) / fs);
            sinyalGrafik = sinyalGrafik / 100000;
            figure
            subplot(1,2,1);
            plot(sinyalGrafik,tel);
            title( "plot graph");
            subplot(1,2,2);
            stem(sinyalGrafik,tel);
            title("stem graph");
        disp('encoded num:');
        hold on
        for i=1:n
            num = abs(fft(tel(1+((i-1)*d):i*d),fs));
            numgraf=(num(1:floor(length(num)/2)+1));
            
            [deger, index] = maxk(numgraf, 3);
            if(abs(index(1) - index(2))<=8)
                freq(1) = index(1);
                freq(2) = index(3);
            
                if(index(3)>index(1))
                    freq(1) = index(3);
                    freq(2) = index(1);
                end
        
            else
                freq(1) = index(1);
                freq(2) = index(2);
            
                if(index(2)>index(1))
                    freq(1) = index(2);
                    freq(2) = index(1);
                end
            end
        
            if(abs(index(2) - index(1))<=8) 
                if(index(3)>index(1))
                    freq(1) = index(3);
                    freq(2) = index(1);
                end
            else
                if(index(2)>index(1))
                    freq(1) = index(2);
                    freq(2) = index(1);
                end
            end
            if(abs(freq(1)-1209)<=8)
                if(abs(freq(2)-697)<=8)
                    sayi = "1";
                elseif(abs(freq(2)-770)<=8)
                    sayi = "4";
                elseif(abs(freq(2)-852)<=8)
                    sayi = "7";
                end
            
            elseif(abs(freq(1)-1336)<=8)
                if(abs(freq(2)-697)<=8)
                    sayi = "2";
                elseif(abs(freq(2)-770)<=8)
                    sayi = "5";
                elseif(abs(freq(2)-852)<=8)
                    sayi = "8";
                elseif(abs(freq(2)-941)<=8)
                    sayi = "0";
                end
                 
            elseif(abs(freq(1)-1477)<=8)
                if(abs(freq(2)-697)<=8)
                    sayi = "3";
                elseif(abs(freq(2)-770)<=8)
                    sayi = "6";
                elseif(abs(freq(2)-852)<=8)
                    sayi = "9";
                end
            end
            disp(sayi)
            figure
                plot(numgraf);
                title(sayi);
            hold on
        end

        %%%% Q3

% Ornek.wav encoding the audio according to dtmf
        [tel,fs] = audioread('Ornek.wav');
        n=11;
        d = floor(length(tel)/n);
            T = 100000/fs;
            sinyalGrafik = 1:T:100000*(length(tel) / fs);
            sinyalGrafik = sinyalGrafik / 100000;
            figure
            subplot(1,2,1);
            plot(sinyalGrafik,tel);
            title( "plot grafigi");
            subplot(1,2,2);
            stem(sinyalGrafik,tel);
            title("stem grafigi");
        disp('Cozumlenmis numara:');
        hold on
        for i=1:n
            num = abs(fft(tel(1+((i-1)*d):i*d),fs));
            numgraf=(num(1:floor(length(num)/2)+1));
            
            [deger, index] = maxk(numgraf, 3);
            if(abs(index(1) - index(2))<=8)
                freq(1) = index(1);
                freq(2) = index(3);
            
                if(index(3)>index(1))
                    freq(1) = index(3);
                    freq(2) = index(1);
                end
        
            else
                freq(1) = index(1);
                freq(2) = index(2);
            
                if(index(2)>index(1))
                    freq(1) = index(2);
                    freq(2) = index(1);
                end
            end
        
            if(abs(index(2) - index(1))<=8) 
                if(index(3)>index(1))
                    freq(1) = index(3);
                    freq(2) = index(1);
                end
            else
                if(index(2)>index(1))
                    freq(1) = index(2);
                    freq(2) = index(1);
                end
            end
            if(abs(freq(1)-1209)<=8)
                if(abs(freq(2)-697)<=8)
                    sayi = "1";
                elseif(abs(freq(2)-770)<=8)
                    sayi = "4";
                elseif(abs(freq(2)-852)<=8)
                    sayi = "7";
                end
            
            elseif(abs(freq(1)-1336)<=8)
                if(abs(freq(2)-697)<=8)
                    sayi = "2";
                elseif(abs(freq(2)-770)<=8)
                    sayi = "5";
                elseif(abs(freq(2)-852)<=8)
                    sayi = "8";
                elseif(abs(freq(2)-941)<=8)
                    sayi = "0";
                end
                 
            elseif(abs(freq(1)-1477)<=8)
                if(abs(freq(2)-697)<=8)
                    sayi = "3";
                elseif(abs(freq(2)-770)<=8)
                    sayi = "6";
                elseif(abs(freq(2)-852)<=8)
                    sayi = "9";
                end
            end
            disp(sayi)
            figure
                plot(numgraf);
                title(sayi);
            hold on
        end


        function sinyal = dtmf(num) %%%% body of the dtmf function

Fs = 8000; %% sampling freq
a1 = 0.2; %% duration of button sound
a2 = 0.1; %% duration of spaces between buttons

frequency = [697 770 852 941 1209 1336 1477 1633]; 
say = {'1','2','3';'4','5','6';'7','8','9';'*','0','#'};
t = linspace(0,a1,a1*Fs);

signal = [];
n=numel(num);
for k = 1:n
	[satir,sutun] = find(strcmp(num(k),say));
	fd = frequency(satir);
	fy = frequency(sutun+4);
      if k~=1
	     signal = [signal zeros(1,a2*Fs)];
     end
	signal = [sinyal 0.5*(sin(2*pi*fd*t) + sin(2*pi*fy*t))];
end

end








     