function [data info] = labeling_annotation_in_CHB_MIT_EEG(file_path,file_name)
    if ~isfile(file_path+file_name)
        error(file_path+file_name+" not exist!!"+newline ...
              +"Current Folder is " + pwd);
    end
    [EEG, signal_labels, record_time, seizure_time] = get_CHB_MIT_EEG(file_path+file_name);
    %data =edfread(file_name);
    info = edfinfo(file_path+file_name);
    
    start_time = datetime(info.StartDate+"."+info.StartTime,"InputFormat","dd.MM.yy.HH.mm.ss");
    fs = info.NumSamples/seconds( info.DataRecordDuration);
    
    hdr = edfheader("EDF");
    hdr.DataRecordDuration = info.DataRecordDuration;
    hdr.DigitalMax = info.DigitalMax;
    hdr.DigitalMin = info.DigitalMin;
    hdr.NumDataRecords = info.NumDataRecords;
    hdr.NumSignals = info.NumSignals;
    hdr.Patient = info.Patient;
    hdr.PhysicalDimensions = info.PhysicalDimensions;
    hdr.PhysicalMax = info.PhysicalMax;
    hdr.PhysicalMin = info.PhysicalMin;
    hdr.Prefilter = info.Prefilter;
    hdr.Recording = info.Recording;
    hdr.Reserved = info.Reserved;
    hdr.SignalLabels = info.SignalLabels;
    hdr.SignalReserved = info.SignalReserved;
    hdr.StartDate = info.StartDate;
    hdr.StartTime = info.StartTime;
    hdr.TransducerTypes = info.TransducerTypes;
    
    if ~exist(file_path+"onset_labeled\", 'dir')
        mkdir(file_path+"onset_labeled\")
    end
    if isfile(file_path+file_name+".seizures")
        [beginning_of_seizure, end_of_seizure] = get_seizure_period( file_path+file_name+".seizures" ); 
        Onset = seconds(beginning_of_seizure');
        Annotations = repelem("seizure",size(beginning_of_seizure,2))';
        Duration = seconds(end_of_seizure - beginning_of_seizure)';
        tsal = timetable(Onset,Annotations,Duration);
        edfw = edfwrite(file_path+"onset_labeled\"+"onset_labeled_"+file_name,hdr,EEG',tsal);
    else
        edfw = edfwrite(file_path+"onset_labeled\"+"onset_labeled_"+file_name,hdr,EEG');;
    end
end