% Load the monoCamera object that contains the camera information.
d = load('FCWDemoMonoCameraSensor.mat', 'sensor');

% Load a pretrained ACF vehicle detector. The ACF detector uses "Aggregate
% Channel Features", which is fast to compute in practice. The 'full-view'
% model is trained on images of the front, rear, left, and right side of
% vehicles.
detector = vehicleDetectorACF('full-view');

vehicleWidth = [2, 4];

detector = configureDetectorMonoCamera(detector, d.sensor, vehicleWidth);



% Set up Video Reader and Player.
videoFile   = '05_highway_lanechange_25s.mp4';
videoReader = VideoReader(videoFile);
videoPlayer = vision.DeployableVideoPlayer();

currentStep = 0;
snapshot = [];
snapTimeStamp = 120;
cont = hasFrame(videoReader);
while cont
    % Update frame counters.
    currentStep = currentStep + 1;
        
    % Read the next frame.
    frame = readFrame(videoReader);
    
    % Run the detector and package the returned results into an object
    % required by multiObjectTracker.  You can find the |detectObjects|
    % function at the end of this example.
    detections = detectObjects(detector, frame, currentStep);
       
    % Using the list of objectDetections, return the tracks, updated for
    % 'currentStep' time.
    confirmedTracks = updateTracks(tracker, detections, currentStep);
    
    % Remove the tracks for vehicles that are far away.
    confirmedTracks = removeNoisyTracks(confirmedTracks, positionSelector, d.sensor.Intrinsics.ImageSize);
    
    % Insert tracking annotations.
    frameWithAnnotations = insertTrackBoxes(frame, confirmedTracks, positionSelector, d.sensor);

    % Display the annotated frame.    
    videoPlayer(frameWithAnnotations);  
    
    % Take snapshot for publishing at snapTimeStamp seconds.
    if currentStep == snapTimeStamp
        snapshot = frameWithAnnotations;
    end   
    
    % Exit the loop if the video player figure is closed by user.
    cont = hasFrame(videoReader) && isOpen(videoPlayer);
end