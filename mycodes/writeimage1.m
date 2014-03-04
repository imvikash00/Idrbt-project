function writeimage1(degree,inputimagefn,z)

inputimage = imread(inputimagefn);
degimage=zeros(size(inputimage));
load('graphnodes.mat');

[x,y]=find(nodes~=0);
for i=1:length(x)
    nodesize=nodes(x(i),y(i));
    degimage(x(i):x(i)+nodesize-1,y(i):y(i)+nodesize-1)=degree(i);
end
mindegimage=min(min(degimage));
degimage=degimage-mindegimage;
maxdegimage=max(max(degimage));
degimage=degimage/maxdegimage*255;
degimage=uint8(degimage);

imwrite(degimage,strcat(num2str(z),'_modified.tif'),'tif');