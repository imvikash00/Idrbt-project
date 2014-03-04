function OrientationMap = formOrientationMap( Luminance, Theta );

G = Gabor( 4.55, Theta, 0, 2, 0.5 );
OrientationMap = conv2( Luminance, G );