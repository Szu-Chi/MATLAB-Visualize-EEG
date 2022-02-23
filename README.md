# MATLAB Visualize EEG
MATLAB Signal Visualize App for CHB-MIT Scalp EEG Database  
![image](https://github.com/Szu-Chi/MATLAB-Visualize-EEG/blob/main/img/Visualize_CHB_MIT_EEG.png)  

## File Description
* **visualize_signal.mlapp** : *MATLAB App* - Visualize EEG signal in app
* **labeling_CHB_MIT_EEG.m** : *MATLAB Script* - labeling seizure position in edf annotation for every trial in CHB-MIT dataset
* **labeling_annotation_in_CHB_MIT_EEG.m** : *MATLAB Function* - according to \".seizure file\", labeling seizure position in pdf annotation 
* **get_CHB_MIT_EEG.m** : *MATLAB Function* - read dataset edf and \".seizure file\" and return EEG, signal labels, recording time, seizure position.  
* **get_seizure_period.m** : *MATLAB Function* -  decoding dataset \".seizure file\" and return onset position and end of seizure

## How to use
## step 1. using labeling_CHB_MIT_EEG.m add seizure positoin in edf file
* set "dataset path" and "remove_empty_channel"  
![image](https://github.com/Szu-Chi/MATLAB-Visualize-EEG/blob/main/img/step1_set_dataset_path.png)
* labeling_CHB_MIT_EEG.m will output onset_labeled in each subject folder
    ### before
    ![image](https://github.com/Szu-Chi/MATLAB-Visualize-EEG/blob/main/img/step1_before_labeling.png)
    ### after 
    ![image](https://github.com/Szu-Chi/MATLAB-Visualize-EEG/blob/main/img/step1_after_labeling.png)
## step 2. Export your signal feature to .dat file
### output format to .dat file
Feature1 Label  | Feature2 Label  | Feature3 Label  | Feature4 Label  | ...  |
:--------------:|:---------------:|:---------------:|:---------------:|:----:|
Feature1 value1 | Feature2 value1 | Feature3 value1 | Feature4 value1 | ...  |
Feature1 value2 | Feature2 value2 | Feature3 value2 | Feature4 value2 | ...  |
Feature1 value3 | Feature2 value3 | Feature3 value3 | Feature4 value3 | ...  |
Feature1 value4 | Feature2 value4 | Feature3 value4 | Feature4 value4 | ...  |
Feature1 value5 | Feature2 value5 | Feature3 value5 | Feature4 value5 | ...  |
Feature1 value6 | Feature2 value6 | Feature3 value6 | Feature4 value6 | ...  |
⁝               |         ⁝       |         ⁝       |         ⁝        |   |
## step 3. Opening visualize_signal.mlapp and import signal edf and feature dat
![image](https://github.com/Szu-Chi/MATLAB-Visualize-EEG/blob/main/img/step3_opening_visualize_signal.mlapp.png)
##### read line: onset  
##### green line: end of seizure