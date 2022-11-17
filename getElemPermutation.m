function [perm] = getElemPermutation(msh0, msh1)
% Assumes msh0 and msh1 are the same, but permutated in order. 
% Finds permutation (perm) between msh0 and msh1, such that 
% 
% msh0(perm) = msh1
% 
% Works with path to .elem file or with element matrix.
% 

[el0, n0] = loadMeshIfPath(msh0);
[el1, n1] = loadMeshIfPath(msh1);

if n0 ~= n1
    cemrg_info('ERROR. Meshes have different number of elements');
    perm = -1;
    return;
end

perm=zeros(n0, 1);
for ix=1:size(el0, 1)
    nw=el1(ix,:);
    test = (el0(:,1)==nw(1)) + (el0(:,2)==nw(2)) + (el0(:,3)==nw(3));
    perm(ix) = find(test==3);
end


end

function [elx, nx] = loadMeshIfPath(mshx)
if(ischar(mshx))
    [elx, nx, ~] = readElementFile(mshx);
else 
    elx=mshx;
    nx=size(mshx,1);
end
end
