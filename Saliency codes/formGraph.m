function formGraph( ImageFN );
% This function form ViSaNet form the given input image according to
% the formula
%      EdgeWeight = Gaussian( EuclidianDistance ) * FeatureDistance

Image = imread( ImageFN );
Image = double( Image );
%Image;
Orientation_0 = formOrientationMap( Image, 0 );
Orientation_0 = imresize( Orientation_0, size( Image ) );
Orientation_45 = formOrientationMap( Image, pi / 4 );
Orientation_45 = imresize( Orientation_45, size( Image ) );
Orientation_90 = formOrientationMap( Image, pi / 2 );
Orientation_90 = imresize( Orientation_90, size( Image ) );
Orientation_135 = formOrientationMap( Image, 3 * pi / 4 );
Orientation_135 = imresize( Orientation_135, size( Image ) );

formGraph1( Image, 1 );%visanet for intensity saliecy map
formGraph1( Orientation_0, 2 );
formGraph1( Orientation_45, 3 );
formGraph1( Orientation_90, 4 );
formGraph1( Orientation_135, 5 );