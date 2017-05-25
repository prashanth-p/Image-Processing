function getData(a,filePath)
    %getData sends the array values of each frame
    fieldPattern = fullfile(filePath,'*.jpg');
    jpgFiles = dir(fieldPattern);
    for k = 1:4    
          baseFileName = jpegFiles(k).name;
          fullFileName = fullfile(myFolder, baseFileName);
          fprintf(1, 'Now reading %s\n', fullFileName);
          imageArray = imread(fullFileName);
          imshow(imageArray);  % Display image.
          drawnow; % Force display to update immediately.
    end;
end

