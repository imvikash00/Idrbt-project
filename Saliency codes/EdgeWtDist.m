function EdgeWtDist( Graph );
% This function reads a graph in form of a matrix and gives a measure of
% edge weight distribution

tot_no_vertices = size( Graph );
tot_no_vertices = tot_no_vertices( 1 );

EdgeWt = reshape( Graph, 1, tot_no_vertices * tot_no_vertices );
EdgeWt = sort( EdgeWt );
figure; plot( EdgeWt );