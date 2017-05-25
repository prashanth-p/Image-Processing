function getFrames(a,filePath,len )
%getFrames obtains the individual frames from the video file
    for img = 1:len;
        filename = strcat('frame',num2str(img),'.jpg'); %File Name of the frame
        b = read(a,img);
        imwrite(b,fullfile(filePath,filename));
    end
end

