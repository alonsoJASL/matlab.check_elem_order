function [el,nElem, region] = readElementFile(elemPath, nIter)
% 

if nargin < 2
    nIter=0;
end

fElem = fopen(elemPath, 'r');
nElem = readlinefibres(fgetl(fElem));

cemrg_info(sprintf('Elements: %d', nElem));
if nIter==0
    nIter = nElem;
end
[firstline, elemtype] = readlinefibres(fgetl(fElem));
elemtype = elemtype{1};

cemrg_info(sprintf('Element Type: %s', elemtype));
switch elemtype
    case {'Tt', 'Qd'}
        formatSpec = [elemtype 32 '%d %d %d %d %d'];
        %el_cell = textscan(fElem, 'Tt %d %d %d %d %d', nIter-1);
        el_cell = textscan(fElem, formatSpec, nIter-1);
        nCols = 4;
    case 'Tr'
        el_cell = textscan(fElem, 'Tr %d %d %d %d', nIter-1);
        nCols = 3;
    otherwise
        cemrg_info(sprintf('Element type: %s not supported', elemtype));
        el = [];
        nElem = [];
        region=[];
        return;
end
el = [];
for ix=1:nCols
    el = [el el_cell{ix}];
end
el = [firstline(1:nCols);el];
el = el+1;

if nargout > 2
    region = [firstline(nCols+1);el_cell{nCols+1}];
end
fclose(fElem);
end