function [ cutoff ] = ABC( Graph );

tot_no_vertices = size( Graph );%dimenssion of matrix
tot_no_vertices = tot_no_vertices( 1 );%get the x dimension
%EdgeWt = Graph;
EdgeWt = reshape( Graph, 1, tot_no_vertices * tot_no_vertices );%forming an 1-d array
EdgeWt = sort( EdgeWt );%row wise sorting
%figure; plot( EdgeWt );
maxWt = EdgeWt( tot_no_vertices * tot_no_vertices );%finding the maximum
upperlimit = floor( maxWt * 100 ) / 100;
TotalWt = sum( EdgeWt );
i = 1;
for cutoff = 0.01 : 0.01: upperlimit
    E( i, 1 ) = cutoff;
    cutoff_index = find( EdgeWt <= cutoff );
    if length( cutoff_index ) > 1
        cutoff_pos = cutoff_index( length( cutoff_index ) );
    else
        cutoff_pos = cutoff_index;
    end
    lowerPr = sum( EdgeWt( 1 : cutoff_pos ) ) / TotalWt;
    if lowerPr == 0
        lowerPr = 1;
    end
    upperPr = sum( EdgeWt( cutoff_pos + 1 : tot_no_vertices * tot_no_vertices ) ) / TotalWt;
    if upperPr == 0
        upperPr = 1;
    end
    E( i, 2 ) = - lowerPr * log( lowerPr ) - upperPr * log( upperPr );
    i = i + 1;
end
ind = find( E( :, 2 ) == max( E( :, 2 ) ) );
if length( ind ) > 1
    ind1 = ind( 1 );
else
    ind1 = ind;
end
cutoff = E( ind1, 1 );
%figure; plot( E( :, 1 ), E( :, 2 ) );