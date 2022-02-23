clear all; 
close all;
dataset_path = "..\CHB_MIT_Dataset"
remove_empty_channel = true;
parfor subject_index = 1:1
    file_path = dataset_path+"\chb"+sprintf("%02d",subject_index)+"\";
    file_prefix = "chb"+sprintf("%02d",subject_index)+"_";
    
    for i = 1:100
        file_name = file_prefix+sprintf("%02d",i)+".edf"
        file_path
        %%{
        if isfile(file_path+file_name)
            labeling_annotation_in_CHB_MIT_EEG(file_path,file_name,remove_empty_channel);
        end
        %}
    end
end


