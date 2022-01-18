function [EEG, signal_labels, record_time, seizure_time] = get_CHB_MIT_EEG(file_name)
    if ~isfile(file_name)
        error(file_name+" not exist!!"+newline ...
              +"Current Folder is " + pwd);
    end

    data =edfread(file_name);
    info = edfinfo(file_name);
    signal_labels = info.SignalLabels;

    start_time = datetime(info.StartDate+"."+info.StartTime,"InputFormat","dd.MM.yy.HH.mm.ss");
    fs = info.NumSamples/seconds( info.DataRecordDuration);
    
    record_time = start_time+ (0:duration(milliseconds(1e3/fs(1))):seconds(size(data,1))-duration(milliseconds(1e3/fs(1))));
    EEG = cell2mat(data{:,:})';
    
    if isfile(file_name+".seizures")
        [beginning_of_seizure, end_of_seizure] = get_seizure_period( file_name+".seizures" );
    else
        seizure_time = [];
        return;
    end

    for i = 1:size(beginning_of_seizure,2)
        seizure_time(1,i) = start_time+seconds(beginning_of_seizure(i));
        seizure_time(2,i) = start_time+seconds(end_of_seizure(i));
    end
end