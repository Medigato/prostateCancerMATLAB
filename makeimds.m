%makes and saves imagedatastore based on folders on imds
    

% you need to have the following structure
% ../imageDataStore/cancerimages
% ../imageDataStore/cancerimages

function [imds] = makeimds()

    imds = imageDatastore('LabeledImgs/','IncludeSubfolders',true,'LabelSource','foldernames');
    fprintf('Loaded ImageDataStore')
end 