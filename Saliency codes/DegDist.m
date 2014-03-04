function DegDist( Graph );
% This function gives degree distribution and cumulative degree
% distribution of a given graph

total_no_vertices = size( Graph );
total_no_vertices = total_no_vertices( 1 );

for i = 1 : total_no_vertices
    Degree( i ) = sum( Graph( i, : ) );
end

unique_Degree = unique( Degree );

for i = 1 : length( unique_Degree )
    Dist( i, 1 ) = unique_Degree( i );
    Dist( i, 2 ) = length( find( Degree == unique_Degree( i ) ) ) / total_no_vertices;
  %  Dist( i, 3 ) = length( find( Degree >= unique_Degree( i ) ) );
end
figure; plot( Dist( :, 1 ), Dist( :, 2 ) );