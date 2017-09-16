function [newlayer] = align2layersSSD(base, layer, m)
leastSSD = Inf;

v = repmat(-m/2:m/2,[m+1 1]);
runner(:,:,1)=v;
runner(:,:,2)=v';

for i=1:length(runner(:,1,1))
    for j=1:length(runner(1,:,1))
        tuple=runner(i,j,:);
        tuple=tuple(:);
        newlayer= circshift(layer,tuple(1),1);
        newlayer= circshift(newlayer,tuple(2),2);
        diff_matrix = uint16(base-newlayer);
        diff_matrix = diff_matrix(m+1:length(diff_matrix(:,1))-m ,m+1:length(diff_matrix(1,:))-m);
        diff_matrix = uint64(diff_matrix.^2);
        SSD = uint64(sum(sum(diff_matrix)));
        if SSD<leastSSD
            leastSSD = SSD;
            alignment=tuple;
        end
    end
end

newlayer= circshift(layer,alignment(1),1);
newlayer= circshift(newlayer,alignment(2),2);
