function [ warp_im ] = warpA( im, A, out_size )
% warp_im=warpAbilinear(im, A, out_size)
% Warps (w,h,1) image im using affine (3,3) matrix A 
% producing (out_size(1),out_size(2)) output image warp_im
% with warped  = A*input, warped spanning 1..out_size
% Uses nearest neighbor mapping.
% INPUTS:
%   im : input image
%   A : transformation matrix 
%   out_size : size the output image should be
% OUTPUTS:
%   warp_im : result of warping im by A

warp_im(1,1)=0;
for i=1:out_size(1)
    for j=1:out_size(2)
        im_coords = inv(A)*[j;i;1];
        im_coords = im_coords./im_coords(3);
        if round(im_coords(2)) > 0 && ...
                round(im_coords(1))> 0 && ...
                round(im_coords(2)) <= size(im,1) && ...
                round(im_coords(1)) <= size(im,2)
            warp_im(i,j) = im(round(im_coords(2)),round(im_coords(1)));
        end
    end
end
