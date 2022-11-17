p2f='/media/jsl19/sandisk/01_atrialfibres/uac_tests';
og='fourch_dev_tests_111022/LA_endo/Fibrel_.elem';
nw='fourch_dev_tests_12c92dd/LA_endo/Fibrel_.elem';

[elog, ~, rog] = readElementFile(fullfile(p2f, og));
[elnw, ~, rnw] = readElementFile(fullfile(p2f, nw));

[perm] = getElemPermutation(elog, elnw);

cemrg_info('Get fibre files')
ogf='fourch_dev_tests_111022/LA_endo/Fibrel_.lon';
fiog=fopen(fullfile(p2f, ogf), 'r');
Cog=textscan(fiog, '%f %f %f');
Fog=[Cog{1} Cog{2} Cog{3}];

nwf='fourch_dev_tests_12c92dd/LA_endo/Fibrel_.lon';
finw=fopen(fullfile(p2f, nwf), 'r');
Cnw=textscan(finw, '%f %f %f');
Fnw=[Cnw{1} Cnw{2} Cnw{3}];

disp('Fibres without permutation');
disp([Fog(perm(1:10), :) Fnw(1:10, :)]);

disp('Fibres after permutation');
disp([Fog(perm(1:10), :) Fnw(1:10, :)]);

fclose all;