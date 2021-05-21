imageURL = ...
    'http://web4.cs.ucl.ac.uk/staff/g.brostow/MotionSegRecData/files/701_StillsRaw_full.zip';
labelURL = ...
    'http://web4.cs.ucl.ac.uk/staff/g.brostow/MotionSegRecData/data/LabeledApproved_full.zip';

outputFolder = fullfile(tempdir, 'CamVid');

if ~exist(outputFolder, 'dir')
    disp('Downloading 557 MB CamVid dataset...');

    unzip(imageURL, fullfile(outputFolder,'images'));
    unzip(labelURL, fullfile(outputFolder,'labels'));
end