function formgraph2( fmap )

minfmap = min(min(fmap));
%imwrite(fmap,'test.jpg','jpg')
%disp "here"
if minfmap < 0
    %disp "hey wats up"
    fmap = fmap - minfmap;
    minfmap = 0;
end
%disp "over"
%a=size(fmap);
maxfmap = max(max(fmap));
threshold = minfmap + (maxfmap-minfmap)*0.0588;

%fmap(1:64,1:64);
nodes = qtdecomp(fmap, threshold, 64);
save('graphnodes.mat','nodes');
size(nodes);
[xcoordinates, ycoordinates]=find(nodes~=0);%of nodes

total_no_nodes = length(xcoordinates);
xcoordinates(1);
for i=1 : total_no_nodes
     nodesize(i) = nodes( xcoordinates(i), ycoordinates(i));
     coordinate( i, : ) = [ xcoordinates( i ) + ( nodesize(i) - 1 ) / 2 ycoordinates( i ) + ( nodesize(i) - 1 ) / 2 ];
     fvalue( i ) = sum( sum( fmap(  xcoordinates( i ) :  xcoordinates( i ) + nodesize(i) - 1,  ycoordinates( i ) :  ycoordinates( i ) + nodesize(i) - 1 ) ) ) / ( nodesize(i) ^ 2 );
end  

nodes(1,1);
%fmap(xcoordinates(1):xcoordinates(1)+63,ycoordinates(1):ycoordinates(1)+63);
save workspace.mat
clear nodes;
clear fmap;
%coordinate(2,1);
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

save( 'intensitygraph.mat','graphform');
clear graphform;


















