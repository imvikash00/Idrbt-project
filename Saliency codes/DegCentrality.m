function Degree = DegCentrality( Graph );
% This function gives degree distribution and cumulative degree
% distribution of a given graph
%Graph
total_no_vertices = size( Graph );
total_no_vertices = total_no_vertices( 1 );
%t1 = cputime;
%Graph
%Degree=sum(Graph);
 for i = 1 : total_no_vertices
     Degree( i ) = sum( Graph( i, : ) );
 end
 %Degree
%t = cputime - t1
%imwrite(Degree,'www.tif','tif')