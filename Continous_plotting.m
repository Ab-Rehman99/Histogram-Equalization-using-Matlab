

clc;
clear;
close;
% reading built in image
a=imread('pout.tif');


b=size(a);
a=double(a);

% Loop input Histogram of the image
Input_histo = zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if a(i,j)==k
                Input_histo(k+1)=Input_histo(k+1)+1;
            end
        end
    end
end

%Generating PDF out of histogram by diving by total no. of pixels

Prob_distri_func=(1/(b(1)*b(2)))*Input_histo;

%Generating CDF out of PDF
commulative_distri_freq = zeros(1,256);
commulative_distri_freq(1)=Prob_distri_func(1);
for i=2:256
    
    commulative_distri_freq(i)=commulative_distri_freq(i-1)+Prob_distri_func(i);
end
commulative_distri_freq = round(255*commulative_distri_freq);
% this will create histogram equalization of PC's entered image
ep = zeros(b);
for i=1:b(1)                                        
    for j=1:b(2)                                    
        t=(a(i,j)+1);                               
        ep(i,j)=commulative_distri_freq(t);                             
		function
    end                                             
end

% Loop for output Histogram of the image
out_histo = zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if ep(i,j)==k
                out_histo(k+1)=out_histo(k+1)+1;
            end
        end
    end
end

subplot(2,2,1);
imshow(uint8(a));
subplot(2,2,3);
imshow(uint8(ep));
subplot(2,2,2);
plot(Input_histo);   % stem is use for continous plotting
subplot(2,2,4);
plot(out_histo);    % stem is use for continous plotting