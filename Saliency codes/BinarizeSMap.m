function SMap = BinarizeSMap( SMap, Threshold );

%SMap = imread( SMapFN );
% [ SizeX, SizeY ] = size( SMap );
% 
% SValues = reshape( SMap, 1, SizeX * SizeY );
% SValues = sort( SValues );
% figure; plot( SValues );
%  
% Threshold = input( 'Enter a threshold for binarizing the saliency map : ' );
SMap( find( SMap < Threshold ) ) = 0;
SMap( find( SMap >= Threshold ) ) = 255;
%imwrite( SMap, 'B.jpg', 'jpg' );