clear all;
close all;
file_path = "CHB_MIT_Dataset\chb01\onset_labeled\";
file_prefix = "onset_labeled_chb01_";
file_name = file_path+file_prefix+sprintf("%02d",3)+".edf";
if isfile(file_name)
    [data anns] = edfread(file_name);
    EEG = cell2mat(data{:,:})';
    info = edfinfo(file_name);
    start_time = datetime(info.StartDate+"."+info.StartTime,"InputFormat","dd.MM.yy.HH.mm.ss");
    fs = info.NumSamples(1)/seconds(info.DataRecordDuration);
    
    record_time = start_time+ (0:duration(milliseconds(1e3/fs)):seconds(size(data,1))-duration(milliseconds(1e3/fs)));
else
    error(file_name + "is not exist!!!");
end

t=table
t.SingalLabel=info.SignalLabels
t.Visiable=repelem([false],size(info.SignalLabels,1))'


plot(record_time, EEG(1,:));
title(file_name);

window_size = 50;
window_time = 2995;
xlim([start_time+seconds(window_time) start_time+seconds(window_time+window_size)]);


