function unzipImages()
%  User input for file 
    fprintf('Please Select Reports Zip File')
    [zipfile,path] = uigetfile('.zip')
    filepath = [path zipfile]
% Make Directory if Folder is Missing

%  Unzip Images into Folder
     % WIP 
     % For the moment, just have the Reports in Reports
     % Problem 
    unzip(filepath,"Reports")
    % movefile('Reports/OA_575 complete patients/OA_575 complete patients/','Reports')
end
