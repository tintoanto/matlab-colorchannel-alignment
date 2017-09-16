% Problem 1: Image Alignment

%% 1. Load images (all 3 channels)
red = load("../data/red.mat");  % Red channel
green = load("../data/green.mat");  % Green channel
blue = load("../data/blue.mat");  % Blue channel

%% 2. Find best alignment
% Hint: Lookup the 'circshift' function
rgbResult = alignChannels(red.red, green.green, blue.blue);

%% 3. Save result to rgb_output.jpg (IN THE "results" folder)

destinationFolder='../results/';
if ~exist(destinationFolder, 'dir')
  mkdir(destinationFolder);
end

imwrite(rgbResult,strcat(destinationFolder,'rgb output.jpg'))