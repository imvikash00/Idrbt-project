function writeimage(degree,inputimagefn,z)

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
% load workspace1.mat
% imshow(inputimagefn);
% [p,q]=ginput(1);
% for m=1:total_no_nodes
%     if (sqrt((coordinate( m, 1 ) - p ) ^ 2 + ( coordinate( m, 2 ) - q ) ^ 2 )) <= 32
% %         degree(m)
% %         fvalue(m)
% %         m
%           a=m;
%     end
% end
% 
% % req
% % degree(req)
% %save workspace1.mat
% %adjust(degree,inputimagefn,z)
imwrite(degimage,strcat(num2str(z),'.tif'),'tif');
load workspace1.mat
load workspace.mat
imshow(inputimagefn)
p = ginput(1)
r=imread(strcat(num2str(z),'.tif'));
size(r)
size(imread(inputimagefn))
for i=1:total_no_nodes
    if r(xcoordinates(i)+1, ycoordinates(i)+1)== r(round(p(1)),round(p(2)))
       if p(1) > xcoordinates(i) && p(1) <= (xcoordinates(i)+nodesize(i)-1) && p(2) > ycoordinates(i) && p(2)<= (ycoordinates(i)+nodesize(i)-1)
        r(xcoordinates(i), ycoordinates(i))
        r(round(p(1)),round(p(2)))
        xcoordinates(i)
        ycoordinates(i)
        nodesize(i)
            a=i;
            a
        end
    end
end
            
          
 
% req
% degree(req)
%save workspace1.mat
save workspace2.mat
adjust(degree,inputimagefn,z,a)
% imshow(degimage)