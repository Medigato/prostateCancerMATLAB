function unzipImages()
%  User input for file 
    fprintf('Please Select Zip File')
    [zipfile,path] = uigetfile('.zip')
    filepath = [path zipfile]
% Make Directory if Folder is Missing

%  Unzip Images into Folder
     
    unzip(filepath,"DICOMImgs")

end
