function Run5Together( InputFileName, IGraph);%, O0Graph, O45Graph, O90Graph, O135Graph );

%EdgeWtDist( IGraph );
T = ABC( IGraph );
B_IGraph = BinarizeGraph( IGraph, T );
IDegree = DegCentrality( B_IGraph );
MaptoImage( IDegree, InputFileName, 1, i );
clear IDegree;
clear B_IGraph;

clear IGraph;

% %EdgeWtDist( O0Graph );
% T = ABC( O0Graph );
% B_O0Graph = BinarizeGraph( O0Graph, T );
% O0Degree = DegCentrality( B_O0Graph );
% MaptoImage( O0Degree, InputFileName, 2, i );
% clear O0Degree;
% clear B_O0Graph;
% 
% clear O0Graph;
% 
% %EdgeWtDist( O45Graph );
% T = ABC( O45Graph );
% B_O45Graph = BinarizeGraph( O45Graph, T );
% O45Degree = DegCentrality( B_O45Graph );
% MaptoImage( O45Degree, InputFileName, 3, i );
% clear O45Degree;
% clear B_O45Graph;
% 
% clear O45Graph;
% 
% %EdgeWtDist( O90Graph );
% T = ABC( O90Graph );
% B_O90Graph = BinarizeGraph( O90Graph, T );
% O90Degree = DegCentrality( B_O90Graph );
% MaptoImage( O90Degree, InputFileName, 4, i );
% clear O90Degree;
% clear B_O90Graph;
% 
% clear O90Graph
% 
% %EdgeWtDist( O135Graph );
% T = ABC( O135Graph );
% B_O135Graph = BinarizeGraph( O135Graph, T );
% O135Degree = DegCentrality( B_O135Graph );
% MaptoImage( O135Degree, InputFileName, 5, i );
% clear O135Degree;
% clear B_O135Graph;
% 
% clear O135Graph