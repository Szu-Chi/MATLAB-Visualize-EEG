clear all; 
close all;
parfor subject_index = 1:24
    file_path = "..\CHB_MIT_Dataset\chb"+sprintf("%02d",subject_index)+"\";
    file_prefix = "chb"+sprintf("%02d",subject_index)+"_";
    
    for i = 1:100
        file_name = file_prefix+sprintf("%02d",i)+".edf"
        file_path
        %%{
        if isfile(file_path+file_name)
            labeling_annotation_in_CHB_MIT_EEG(file_path,file_name,true);
        end
        %}
    end
end


