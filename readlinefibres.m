function [numbersInLine, charsInLine] = readlinefibres(line)
% 

spl = strsplit(line, ' ');
b = zeros(1, length(spl));
total = length(spl);
for ix=1:total
    if isempty(spl{ix})
       b(ix) = 1;
    end
end
spl(cast(b, 'logical')) = [];
       
numbersInLine = zeros(1, length(spl));
for ix=1:length(numbersInLine)
    numbersInLine(ix) = str2double(spl{ix});
end

if nargout > 1
    numbersInLine(isnan(str2double(spl))) = [];
    charsInLine = spl(isnan(str2double(spl)));
end