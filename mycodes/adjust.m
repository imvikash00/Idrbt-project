function adjust( degree,image,z,w)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
maxcoor=ind2sub(size(degree),find(degree==max(degree)));
mincoor=ind2sub(size(degree),find(degree==min(degree)));
% [i,j]=ind2sub(size(graphfm),find(graphfm==max(max(graphfm))));
% %found the most salient node
% [m,n]=ind2sub(size(graphfm),find(graphfm==min(min(graphfm))));
% fdij=graphfm(i(1),j(1))
% fdmn=graphfm(m(1),n(1))
% fdiff=fdij-fdmn
% cartdiff=gaus(cartisian(i(1),j(1)))-gaus(cartisian(m(1),n(1)))
% feainc=fdiff/cartdiff
load workspace2.mat
fvalue(maxcoor(1));
% fvalue(mincoor(1));
fdiff=fvalue(maxcoor(1))-fvalue(mincoor(1));
ima=imread(image);
for i=xcoordinates(w):(xcoordinates(w)+nodesize(w)-1)
    for j=ycoordinates(w):(ycoordinates(w)+nodesize(w)-1)
        ima(i,j)=ima(i,j)+fdiff;
    end
end
imwrite(ima,strcat(num2str(z),'real.tif'),'tif');
% xcoordinates(mincoor(1))
% ycoordinates(mincoor(1))
% nodesize(mincoor(1))
% fdiff

newgraph(fdiff,mincoor(1),image,mincoor(1));
end

