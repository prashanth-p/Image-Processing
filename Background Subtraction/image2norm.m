function [ normFrames ] = image2norm( Frames,newLen)
%IMAGE2NORM Normalizes the input pixel matrix from uint(0,255) to double(0,1)
    tic;
    normFrames{newLen} = [];
    for k=1:(newLen)
                temp_img = im2double(Frames{k});
                normFrames{k} = temp_img;
                clear temp_img;
    end

    wtime = toc;
    fprintf ( 1, 'MY_PROGRAM took %f seconds to normalize.\n', wtime );
end

