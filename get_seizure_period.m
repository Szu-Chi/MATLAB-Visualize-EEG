function [beginning_of_seizure, end_of_seizure] = get_seizure_periods( annotation_file_location )
    file_descriptor = fopen(annotation_file_location);
    byte_array = fread(file_descriptor);
    number_of_seizures = (sum(byte_array == hex2dec('ec')) - 1) / 2;
    beginning_of_seizure(1) = byte_array(23 + (1*16))*256+byte_array(26 + (1*16));
    seizure_lengths = byte_array(34 + (1*16));
    end_of_seizure(1) = beginning_of_seizure(1)+seizure_lengths(1);
    
    if number_of_seizures == 1
        return;
    end
    
    for i=2:number_of_seizures         
        beginning_of_seizure(i) = end_of_seizure(i-1) + byte_array(23 + (i*16))*256 + byte_array(26 + (i*16));
        seizure_lengths(i) = byte_array(34 + (i*16));
        end_of_seizure(i) = beginning_of_seizure(i)+seizure_lengths(i);
   end
end
