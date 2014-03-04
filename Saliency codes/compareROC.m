function compareROC( R1, R2, R3, R4 );%( FileName1, FileName2, FileName3 );

% R1 = readROCFile( FileName1 );
% R2 = readROCFile( FileName2 );
% R3 = readROCFile( FileName3 );
%R4 = readROCFile( FileName4 );
figure; plot( R1( :, 1 ), R1( :, 2 ), 'r.-', R2( :, 1 ), R2( :, 2 ), 'go:', R3( :, 1 ), R3( :, 2 ), 'bx-.', R4( :, 1 ), R4( :, 2 ), 'c^--' ); axis equal; xlabel( 'False positive rate' ); ylabel( 'True positive rate' ); legend( 'T', '0.75T', '0.5T', '0.25T' ); axis( [ 0 1 0 1 ] );