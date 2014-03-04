function Centrality = EigenVectCentrality( Graph );
% This function gives eigen vector centrality of the nodes of a given
% graph.

tot_no_vertices = size( Graph );
tot_no_vertices = tot_no_vertices( 1 );

SmallConstant = 0.0001;
InitialCentrality = zeros( tot_no_vertices, 1 ) + 1;
%t1 = cputime;
Centrality = Graph * InitialCentrality;
max_Centrality = max( Centrality );
Centrality = Centrality / max_Centrality;
Diff = abs( Centrality - InitialCentrality );
while max( Diff ) > SmallConstant
    InitialCentrality = Centrality;
    Centrality = Graph * InitialCentrality;
    max_Centrality = max( Centrality );
    Centrality = Centrality / max_Centrality;
    Diff = abs( Centrality - InitialCentrality );
end
%t = cputime - t1