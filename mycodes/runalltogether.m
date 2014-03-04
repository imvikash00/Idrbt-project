function runalltogether(inputimage,z)
readImage1(inputimage);
load('intensitygraph.mat');
thres=getthreshold3(graphform);
bgraph=binarizegraph4(graphform,thres);
Idegcent=degcentrality5(bgraph,inputimage,z);
writeimage6(Idegcent,inputimage,z);
clear graphform;
clear bgraph;
clear Idegcent;