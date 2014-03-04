function asmerge( Scale0FN, Scale1FN );%, Scale2FN );
% It is a function to across scale merge the feature maps

Scale0 = imread( Scale0FN );
Scale0 = double( Scale0 );
Scale0 = normalize1( Scale0 );
Scale1 = imread( Scale1FN );
Scale1 = double( Scale1 );
Scale1 = imresize( Scale1, size( Scale0 ), 'bicubic' );
Scale1 = normalize1( Scale1 );
% Scale2 = imread( Scale2FN );
% Scale2 = double( Scale2 );
% Scale2 = imresize( Scale2, size( Scale0 ), 'bicubic' );
% Scale2 = normalize1( Scale2 );

SMap = ( Scale0 + Scale1 ) / 2;
%SMap = ( Scale0 + Scale1 + Scale2 ) / 3;
minV = min( min( SMap ) );
SMap = SMap - minV;
maxV = max( max( SMap ) );
SMap = SMap / maxV * 255;
SMap = uint8( SMap );
imwrite( SMap, 'DegIm_Graph.tif', 'tif' );