function [selectedTPM,filteredCollection] = TPMReports(collection)
%% TPMREPORTS TPM REPORTS
% It works now 
% Gets unique Patient IDs from DATABASE
uniquePatientNames = unique(collection.PatientName);
names = ['patientID' ''];
cPI = table(uniquePatientNames)
%% Write CRFs into file
%% Write Table To File
% Reads TPMSummary 
filepath = 'Reports/OA_575 complete patients/OA_575 complete patients/TPM Data/PROMIS_OA_TPMSummary_Downloaded05Mar2020.xlsx'
TPMtable = readtable(filepath);
dataDictionary = readtable(filepath,'Sheet','Data Dictionary','VariableNamingRule','preserve');
% Could be useful to use a cellarray? 
%%% C = table2cell(TPMtable);
conciseTable = rmmissing(TPMtable,2,"MinNumMissing",575);
summary(conciseTable)
conciseTable = conciseTable(:,[2,6:end]);
summary(conciseTable)
cConcise = table2cell(conciseTable);
%% Find PatientIDs in Table
% patientColumn = table2cell(conciseTable(:,2))
% patientColumn = cell2mat(patientColumn(:,1))
% pertinentrows = cConcise(patientColumn=='P-10101010',:)
%% Adding Row Names to ConciseTable (Copied later, may come back to this)
conciseTable.Properties.RowNames = conciseTable.patientID;
% Finding the specific rownames on the table
% The patient ids are in the collectionPatientIds
selectedTPM = conciseTable(uniquePatientNames,:);
writetable(selectedTPM,'selectedTPM.xls');
%% 
% Finds all t2w rows in collection
collectionNoDates = collection(:,3:end);
rowsWithT2W = strfind(collection.SeriesDescription,'t2','ForceCellOutput',0);
filteredCollection = [];
for k = 1 : length(rowsWithT2W)
    if rowsWithT2W{k} == 1
        filteredCollection = [filteredCollection;collectionNoDates(k,:)];
    end
end 
summary(filteredCollection)
save('filteredCollection.mat',"filteredCollection" );
%% 
%