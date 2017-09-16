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

% temp=zeros(out_size(1),out_size(2));
% 
% [X Y] = meshgrid(1:out_size(2),1:out_size(1));
% D_coords = [Y(:) X(:) ones(numel(X),1)];
% 
% Ainv = inv(A);
% B=round(Ainv*D_coords');
% 
% idx = find( (B(1,:) > 0) & (B(1,:) < size(im,1) ));
% idy = find( (B(2,:) > 0) & (B(2,:) < size(im,2) ));
% id = intersect(idy,idx);
% 
% S_coords=[B(2,:); B(1,:); 1:numel(B(1,:))];
% S_coords_refined=S_coords(:,id);
% D_indexes=S_coords_refined(3,:);
% 
% S_indexes = sub2ind(out_size, S_coords_refined(2,:), S_coords_refined(1,:));
% 
% 
% temp(D_indexes) = im(S_indexes);
% 
% 
% warp_im = reshape(temp,[200,150]);

warp_im=zeros(out_size);

[Y X] = meshgrid(1:out_size(2),1:out_size(1));
D_coords = [Y(:) X(:) ones(numel(X),1)];

Ainv = inv(A);
B=round(Ainv*D_coords');

idx = find( (B(1,:) > 0) & (B(1,:) < size(im,2) ));
idy = find( (B(2,:) > 0) & (B(2,:) < size(im,1) ));
id = intersect(idy,idx);

S_coords=[B(2,:); B(1,:); 1:numel(B(1,:))];
S_coords_refined=S_coords(:,id);
D_indexes=S_coords_refined(3,:);

S_indexes = sub2ind(out_size, S_coords_refined(1,:), S_coords_refined(2,:));


warp_im(D_indexes) = im(S_indexes);


%warp_im = reshape(temp,[200,150]);


