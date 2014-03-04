function Graph = BinarizeGraph( Graph, Threshold );
% This function Binarizes a graph based on a selected threshold. Threshold 
% is selected analyzing the Edge Wt Distribution of the graph. Input graph
% is provided in form of a matrix. It assigns 0 to all edges having wt less
% than or equal to Threshold. Otherwise, it assigns 1.

%EdgeWtDist( Graph );
%Threshold = input( 'Enter a threshold : ' );

Graph( find( Graph <= Threshold ) ) = 0;
Graph( find( Graph > Threshold ) ) = 1;
% total_no_vertices = size( Graph );
% total_no_vertices = total_no_vertices( 1 );
% 
% FID = fopen( 'B_Graph.net', 'wt' );
% fprintf( FID, '*vertices %d \n', total_no_vertices );
% for i = 1 : total_no_vertices
%     fprintf( FID, '%d \n', i );
% end
% fprintf( FID, '*edges \n' );
% 
% for i = 1 : total_no_vertices
%     for j = i : total_no_vertices
%         if Graph( i, j ) == 1
%             fprintf( FID, '%d %d\n', i, j );
%         end
%     end
% end
% fclose( FID );