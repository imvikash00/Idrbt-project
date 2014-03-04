function MaptoImage( Degree, InputImageFN, num, Thr )

InputImage = imread( InputImageFN );
DegImage = zeros( size( InputImage ) );
if num == 1
    load( 'IS.mat' );
 elseif num == 2
     load( 'O0S.mat' );
 elseif num == 3
     load( 'O45S.mat' );
 elseif num == 4
     load( 'O90S.mat' );
 else
     load( 'O135S.mat' );
end

[ GranuleStartX, GranuleStartY ] = find( S ~= 0 );
for i = 1 : length( GranuleStartX )
    GranuleSize = S( GranuleStartX( i ), GranuleStartY( i ) );
    DegImage( GranuleStartX( i ) : GranuleStartX( i ) + GranuleSize - 1, GranuleStartY( i ) : GranuleStartY( i ) + GranuleSize - 1 ) = Degree( i );
end
DegImage;
minDegImage = min( min ( DegImage ) )
DegImage = DegImage - minDegImage;
maxDegImage = max( max( DegImage ) )
DegImage = DegImage / maxDegImage * 255;
DegImage(1:3)
disp "afljadfsljfasldj"
DegImage = uint8( DegImage );
DegImage(1:3)
if num == 1
    OutputFN = strcat( 'DegIm_IGraph_', num2str( Thr ), '.tif' );
 elseif num == 2
     OutputFN = strcat( 'DegIm_O0Graph_', num2str( Thr ), '.tif' );
 elseif num == 3
     OutputFN = strcat( 'DegIm_O45Graph_', num2str( Thr ), '.tif' );
 elseif num == 4
     OutputFN = strcat( 'DegIm_O90Graph_', num2str( Thr ), '.tif' );
 else
     OutputFN = strcat( 'DegIm_O135Graph_', num2str( Thr ), '.tif' );
end
imwrite( DegImage, OutputFN, 'tif' );