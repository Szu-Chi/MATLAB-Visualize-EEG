clear all; 
close all;
file_path = "CHB_MIT_Dataset\";
file_name = "chb04_28.edf";
%%{
[EEG, signal_labels, record_time, seizure_time] = get_CHB_MIT_EEG(file_path+file_name);

plot(record_time,EEG(24,:));
for i =1:size(seizure_time,2)
    xline(seizure_time(1,i),'r');
    xline(seizure_time(2,i),'g');
end
%}

%labeling_annotation_in_CHB_MIT_EEG(file_name);
