function [Frames,newLen] = get_ImageData(a,filePath,len)
    %getImageData returns the read matrix(RGB pixel matrix) of all the input frame
        
        tic;
        filePattern = fullfile(filePath, '*.jpg');
        f=dir(filePattern);
        p={f.name};
        files = sort_nat(p);
        newLen = round(len/4);
        cellArrayOfImages{newLen} = [];
        for k=1:(newLen)
            fullFileName = fullfile(filePath, files{k});
            temp_img = imread(fullFileName);
            cellArrayOfImages{k} = temp_img;
            clear temp_img;
        end
        
        Frames = cellArrayOfImages;
        wtime = toc;
        fprintf ( 1, 'MY_PROGRAM took %f seconds to read images.\n', wtime );
end

