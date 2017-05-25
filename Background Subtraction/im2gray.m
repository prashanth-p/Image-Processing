function [ FramesGray ] = im2gray( Frames,newLen )
%IM2GRAY This function returns the grayscale image of a RGB image

    tic;
    
    FramesGray{newLen} = [];
    for k=1:newLen
        temp_img = rgb2gray(Frames{k});
        FramesGray{k} = temp_img;
        clear temp_img;
    end    
    wtime = toc;
    fprintf(1,'My program took %f seconds to convert to grayscale image.\n',wtime);


end

