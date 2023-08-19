%% Checks if collection is loaded
%% Incomplete Not Working Yet 
% if exist("collection","var") == 0
%     error('No Collection Loaded')
% end

%% Save Current Localizer Images

%% Displaying Localizer 
% [Must be updated to save all patients localizer images on a folder] 

function [] = saveLocalizer(collection)
    

    collectionNoDates = collection(:,3:end);


    rowsWithLocalizer = strfind(collection.SeriesDescription,'localizer','ForceCellOutput',0);
    filteredCollection = [];
    for k = 1 : length(rowsWithLocalizer)
    if rowsWithLocalizer{k} == 1
        filteredCollection = [filteredCollection;collectionNoDates(k,:)];
    end
    end 
    summary(filteredCollection)
    save('t2_collection.mat',"filteredCollection" );
    %Sets up Variables
    imgList = [];
    % [Extract patient IDs from File (check other functions)]
    ...
    
%% Find localizer images in dicomCollection
    % Previous way of finding filepath, extract from collection instead.
    % filepath = ['../' patientID '/1/DICOM/'];
    % For Loop Needed here []
    % i = 1;
    % while i < 6
    %     filepathname = strcat(filepath,'MR.1.3.6.1.4.1.5962.99.1.1974543391.493602745.1638357115935.15626.0.',string(i),'.dcm');
    %     img = dicomread(filepathname);
    %     img = imadjust(img);
    %     imgList = [imgList img];
    %     i = i +1;
    % end
    
    %% Save images into folder 
    localizerImages = imgList;


end