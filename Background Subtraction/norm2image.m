function [ FramesUnNorm ] = norm2image( normFrames,newLen )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    tic;
    FramesUnNorm{newLen} = [];
    for k=1:(newLen)
                temp_img = im2uint8(normFrames{k});
                FramesUnNorm{k} = temp_img;
                clear temp_img;
    end

    wtime = toc;
    fprintf ( 1, 'MY_PROGRAM took %f seconds to return image.\n', wtime );


end

