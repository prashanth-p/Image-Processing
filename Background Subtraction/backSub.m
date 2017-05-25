%This MATLAB Function Performs backGround Subtraction
clc;
clear all;
close all;

%Read The Video File from Current Directory 
a = VideoReader('./testVideo.mp4');
len = a.NumberOfFrames;
fprintf ( 1, 'There are %d frames in the video.\n', len );
filePath = strcat('F:\IP\Background Subtraction\Frames');

%For a new test data enter the folder location and run the below code
%getFrames(a,filePath,len);

%Read all the images and store the rgb pixel matrix in Frames
[Frames,newLen] = get_ImageData(a,filePath,len); 
%figure('name','Frame(2)'), imshow(Frames{2});
fprintf(1,'I am processing %d frames in this test.\n',newLen);


%Convert to GrayScale
FramesGray = im2gray(Frames,newLen);
figure('name','GrayFrame(2)'), imshow(FramesGray{2});


%Frame Difference Method
%Normalize the RGB matrix of Each Frame
normFrames = image2norm(FramesGray,newLen);

Back_Image = averageFrames(normFrames,newLen);
figure('name','Average Frame - Background Image') , imshow(im2uint8(Back_Image));

%Research more on this its called otsu's method for thresholding
level = graythresh(Back_Image);
fprintf(1,'The Threshold is %f.\n',level);
FilteredImage{5} = [];
[rows columns]=size(Back_Image);
%Convert to Binary Image
BinaryImage{5} = zeros(rows,columns);
for k=600:601
    for i=1:rows
           for j=1:columns

                                if ((normFrames{k}(i,j)-Back_Image(i,j)) >0)

                                BinaryImage{k}(i,j)=0;

                                else

                                BinaryImage{k}(i,j)=1;

                                end

           end
    end

    figure, imshowpair(Frames{k},im2uint8(BinaryImage{k}),'montage');
    FilteredImage{k}=medfilt2(BinaryImage{k},[5 5]);
    figure, imshowpair(Frames{2},im2uint8(FilteredImage{k}),'montage');

    [L num]=bwlabel(FilteredImage{k});

    STATS=regionprops(L, 'all');
    cc=[];
    removed=0;

    %Remove the noisy regions 
    for i=1:num
    dd=STATS(i).Area;

    if (dd < 500)

    L(L==i)=0;
    removed = removed + 1;
    num=num-1;

    else

    end

    end

    [L2 num2]=bwlabel(L);

    % Trace region boundaries in a binary image.

    [B,L,N,A] = bwboundaries(L2);

    %Display results

    subplot(2,2,3),  imshow(L2);title('BackGround Detected');
    subplot(2,2,4),  imshow(L2);title('Blob Detected');

    hold on;

    for k=1:length(B),

    if(~sum(A(k,:)))
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);

    for l=find(A(:,k))'
    boundary = B{l};
    plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
    end

    end

    end


    p = im2uint8(normFrames{k});
    q= im2uint8(Back_Image);
    z = im2uint8(level)
    %figure, imshow(imsubtract(p,q));
    %Binarizing each Frame
    %if (val>thresh == 1),(else == 0)
    %binFrame = image2binary(Back_Image,normFrames,newLen,level);
   % BW = imbinarize(im2uint8(imsubtract(p,q)),uint8(level));
   % figure, imshow(BW);

end    