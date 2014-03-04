function formGraph1( FMap, num )

minFMap = min( min( FMap ) ); %finding the minimum fo all elements
if minFMap < 0
    FMap = FMap - minFMap;
    minFMap = 0;
end
maxFMap = max( max( FMap ) ); %finding the max of all elements
Th = minFMap + ( maxFMap - minFMap ) * 0.0588; %calculating the thresold
%disp "eht"
S = qtdecomp( FMap, Th, 32 ); %forming the nodes using quadtreedecomposition with th as thresold
%if minFMap-maxFMap>th then split else a node is formed
% no node will be smaller than 16

if num == 1
    save( 'IS.mat', 'S' );
% elseif num == 2
%     save( 'O0S.mat', 'S' );
% elseif num == 3
%    save( 'O45S.mat', 'S' );
% elseif num == 4
%     save( 'O90S.mat', 'S' );
% else
%     save( 'O135S.mat', 'S' );
end
%disp "clear"
[ GranuleStartsX, GranuleStartsY ] = find( S ~= 0 );
%matrix that contains the starting x n y coordinate of nodes

total_no_granules = length( GranuleStartsX );%no. of nodes

for i = 1 : total_no_granules
    GranuleSize = S( GranuleStartsX( i ), GranuleStartsY( i ) );
    Coordinate( i, : ) = [ GranuleStartsX( i ) + ( GranuleSize - 1 ) / 2 GranuleStartsY( i ) + ( GranuleSize - 1 ) / 2 ];
    FValue( i ) = sum( sum( FMap( GranuleStartsX( i ) : GranuleStartsX( i ) + GranuleSize - 1, GranuleStartsY( i ) : GranuleStartsY( i ) + GranuleSize - 1 ) ) ) / ( GranuleSize ^ 2 );
%FValue matrix stores the feature value of all the nodes which is mean of
%all intensity of pixel
end
clear S;
clear FMap;
%calculating the cpu time for comparision
%t1 = cputime;
for i = 1 : total_no_granules
    for j = i : total_no_granules
        EuDist( i, j ) = sqrt( ( Coordinate( i, 1 ) - Coordinate( j, 1 ) ) ^ 2 + ( Coordinate( i, 2 ) - Coordinate( j, 2 ) ) ^ 2 );
        %calculates the cartisian distance between the nodes
        EuDist( j, i ) = EuDist( i, j );
        FDist( i, j ) = abs( FValue( i ) - FValue( j ) );
        %feature distance is calculate between two nodes 
        FDist( j, i ) = FDist( i, j );
    end
end
%t = cputime - t1
%calculating the edge distance
EuDist = EuDist / max( max( EuDist ) );
FDist = FDist / max( max( FDist ) );
Graph = Gaus( EuDist ) .* FDist;
% size(Graph);
% a=max(Graph);
% b=sort(a);
% ma=b(427);
% for i=1:427
%     if ma == a(i)
%         i
%     end 
% end
if num == 1
    save( 'IGraph.mat', 'Graph' );
% elseif num == 2
%     save( 'O0Graph.mat', 'Graph' );
% elseif num == 3
%     save( 'O45Graph.mat', 'Graph' );
% elseif num == 4
%     save( 'O90Graph.mat', 'Graph' );
% else
%     save( 'O135Graph.mat', 'Graph' );
end
clear Graph;