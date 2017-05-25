function [ binFrame ] = image2binary(Back_Image,normFrames,newLen,level)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
        binFrame{newLen} = [];
        [matLen, matWidth] = size(Back_Image);
        display(matLen);
        display(matWidth);
        temp_image2{matLen,matWidth} = [];
        %for k = 1:newLen
            temp_image = normFrames{1};
            for h = 1:matLen
                for w = 1:matWidth
                    if ((temp_image(h,w) - Back_Image(h,w)) >= level)
                            temp_image2{h,w} = 1;
                    else
                            temp_image2{h,w} = 0;
                    end;
                end;
            end;    
            binFrame{1} = temp_image2;
            
            clear temp_image;
        %end;       
        figure('name','Motion Frame(1)'), imshow(im2uint8(binFrame{1}));
end

