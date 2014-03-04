    function ExtractFromBinary( BinaryFN, InpFN );

Binary = imread( BinaryFN );
Inp = imread( InpFN );
Extract = zeros( size( Inp ) );
Extract = uint8( Extract );
pos = find( Binary == 255 );
Extract( pos ) = Inp( pos );
imwrite( Extract, 'MB.jpg', 'jpg' );