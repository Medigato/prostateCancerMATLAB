
% Be careful of running this file because it creates a lot of images 
% Needs Filtered Collection and SelectedTPM 

function labelImages(filteredCollection,selectedTPM)

%% Creates Directories
if exist('LabeledImgs/cancerImgs','dir') == 0 & exist('LabeledImgs/nocancerImgs','dir') == 0
    mkdir('LabeledImgs/cancerImgs')
    mkdir('LabeledImgs/nocancerImgs')
end

% At the moment you currently have 2 tables
% 1. filteredCollection which is the collection of t2 images available
% 2. selectedTPM which contains cancer or not cancer information from each patient 
% % filter selectedTPM by cancer and not cancer
% use selectedTPM to extract rows from filteredCollection


for k = 1 : height(filteredCollection)
    row = filteredCollection(k,:);
    patientID = row.PatientName;
    
    if selectedTPM(patientID,:).sumca1 ==1 
        % fprintf('Reading %s has cancer. \n',patientID);
        filteredCollection.label{k} = 1;
    else
        % fprintf('Reading %s doesnt have cancer.\n',patientID);
        filteredCollection.label{k} = 0;
    end

end
save('filteredcollection.mat',"filteredCollection" );

% Loop over table and save images to different folders
% Are you sure you want to generate another set of images?
for k = 1 : height(filteredCollection)
    ca = filteredCollection{k,'label'}{1};
    if ca == 1
        for l = 1 : length(filteredCollection.Filenames{k})
                filepathname = filteredCollection.Filenames{k}{l};
                % fprintf('Reading %s \n ',filepathname)
                imguint16 = dicomread(filepathname);
                imguint16 = imresize(imguint16,[256 256]);
                    % 
                    % %% For some reason, dicomread read the dicom images wrong and sets a uint8 array into a uint16 array
                    % %% this code fixes that
                    % 
                   
                c = char(imguint16);
                I = uint8(c);
                randid = randi([0000 9999],1);
                randid = string(randid);
                filename = strcat('cancer',filteredCollection{k,'PatientName'},'-',string(l),'-',randid,'.png');
                filename = fullfile('LabeledImgs','cancerImgs',filename);
                imwrite(I,filename);
                    % May want to save all the dicom metadata on a file? 
                    % info = dicominfo(filepathname);
        end

    else
        for l = 1 : length(filteredCollection.Filenames{k})
                filepathname = filteredCollection.Filenames{k}{l};
                % fprintf('Reading %s \n ',filepathname)
                imguint16 = dicomread(filepathname);
                imguint16 = imresize(imguint16,[256 256]);
                    % 
                    % %% For some reason, dicomread read the dicom images wrong and sets a uint8 array into a uint16 array
                    % %% this code fixes that
                    % 
                   
                c = char(imguint16);
                I = uint8(c);
                randid = randi([0000 9999],1);
                randid = string(randid);
                filename = strcat('Nocancer',filteredCollection{k,'PatientName'},'-',string(l),'-',randid,'.png');
                filename = fullfile('LabeledImgs','nocancerImgs',filename);
                imwrite(I,filename);
                    % May want to save all the dicom metadata on a file? 
                    % info = dicominfo(filepathname);
        end
    end 
    
    
end

