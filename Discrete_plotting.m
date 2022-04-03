% this will create histogram equalization of PC's entered image

clc;
clear;
close;
% In case read the image from PC
a=imread('C:\a.jpeg');

% conversion if the image is in color form

a = rgb2gray(a);



b=size(a);
a=double(a);

% Loop input Histogram of the image
in_histo = zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if a(i,j)==k
                in_histo(k+1)=in_histo(k+1)+1;
            end
        end
    end
end

%Generating PDF out of histogram by diving by total no. of pixels

prob_distri_func=(1/(b(1)*b(2)))*in_histo;

%Generating CDF out of PDF
commulative_distri_func = zeros(1,256);
commulative_distri_func(1)=prob_distri_func(1);
for i=2:256
    
    commulative_distri_func(i)=commulative_distri_func(i-1)+prob_distri_func(i);
end
commulative_distri_func = round(255*commulative_distri_func);

ep = zeros(b);
for i=1:b(1)                                        
    for j=1:b(2)                                    
        t=(a(i,j)+1);                               
        ep(i,j)=commulative_distri_func(t);                             
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
stem(in_histo);   % stem is use for discrete plotting
subplot(2,2,4);
stem(out_histo);    % stem is use for discrete plotting