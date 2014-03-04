function merge( MapIFN, MapO0FN, MapO45FN, MapO90FN, MapO135FN );
% This function normalizes five maps and merges them. First map comes form
% intensity. Next four comes from orientation

MapI = imread( MapIFN );
MapI = double( MapI );
MapO0 = imread( MapO0FN );
MapO0 = double( MapO0 );
MapO45 = imread( MapO45FN );
MapO45 = double( MapO45 );
MapO90 = imread( MapO90FN );
MapO90 = double( MapO90 );
MapO135 = imread( MapO135FN );
MapO135 = double( MapO135 );

MapO0 = normalize1( MapO0 );
MapO45 = normalize1( MapO45 );
MapO90 = normalize1( MapO90 );
MapO135 = normalize1( MapO135 );
MapO = ( MapO0 + MapO45 + MapO90 + MapO135 ) / 4;

MapO = normalize1( MapO );
MapI = normalize1( MapI );
Map = ( MapI + MapO ) / 2;

minMap = min( min( Map ) );
Map = Map - minMap;
maxMap = max( max( Map ) );
Map = Map / maxMap * 255;
Map = uint8( Map );
imwrite( Map, 'DegIm_Graph.tif', 'tif' );