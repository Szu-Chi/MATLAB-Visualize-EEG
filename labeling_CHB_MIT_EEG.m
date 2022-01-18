clear all; 
close all;
file_path = "CHB_MIT_Dataset\chb01\";
file_prefix = "chb01_";
for i = 1:100
    if i < 10
        file_name = file_prefix+"0"+string(i)+".edf";
    else
        file_name = file_prefix+string(i)+".edf";
    end
    if isfile(file_path+file_name)
        labeling_annotation_in_CHB_MIT_EEG(file_path,file_name);
    end
end


