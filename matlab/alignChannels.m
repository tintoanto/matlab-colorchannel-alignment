function [rgbResult] = alignChannels(red, green, blue)
% alignChannels - Given 3 images corresponding to different channels of a
%       color image, compute the best aligned result with minimum
%       aberrations
% Args:
%   red, green, blue - each is a matrix with H rows x W columns
%       corresponding to an H x W image
% Returns:
%   rgb_output - H x W x 3 color image output, aligned as desired

m = 60;  % margin
rgbResult(:,:,1)=red;

%%%%% align red
base = red;
layer = green;
rgbResult(:,:,2) = align2layersSSD(base, layer, m);

%%%%% align blue
layer = blue;
rgbResult(:,:,3) = align2layersSSD(base, layer, m);
