function [ avgFrame ] = averageFrames( normFrames, newLen )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    

    for k = 1 : newLen
        if (k == 1)
            avgFrame = normFrames{k};
        else
            avgFrame = avgFrame + normFrames{k};
        end
    end
        avgFrame = avgFrame / newLen;
        
end

