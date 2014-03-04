function newgraph(value,coor,inputimage,z)
load workspace.mat
fvalue(coor)=fvalue(coor)+value;
for i=1 : total_no_nodes
    for j=i:total_no_nodes
        cartdist(i,j) = sqrt((coordinate( i, 1 ) - coordinate( j, 1 ) ) ^ 2 + ( coordinate( i, 2 ) - coordinate( j, 2 ) ) ^ 2 );
        cartdist(j,i) = cartdist(i,j);
        feadist(i,j) = abs(fvalue(i)-fvalue(j));
        feadist(j,i) = feadist(i,j);
    end
end

cartdist = cartdist/max(max(cartdist));
feadist = feadist/max(max(feadist));
graphform=gaus(cartdist).*feadist;
graphform;
size(graphform);
%adjust(graphform,cartdist,feadist);

save( 'intensitygraph1.mat','graphform');
clear graphform;
load('intensitygraph1.mat');
thres1=getthreshold3(graphform);
bgraph1=binarizegraph4(graphform,thres1);
Idegcent1=degcentrality51(bgraph1);
writeimage1(Idegcent1,inputimage,z);
clear graphform;
clear bgraph1;
clear Idegcent1;