function downscale( ImageFN );
% This is the code for downscaling an image by a factor of 2

Mask = fspecial( 'gaussian', 5, 1 );
Image = imread( ImageFN );
Image = double( Image );
downImage = imfilter( Image, Mask );
downImage = imresize( downImage, 0.5, 'bicubic' );
minV = min( min( downImage ) );
downImage1 = downImage - minV;
maxV = max( max( downImage1 ) );
downImage2 = downImage1 / maxV * 255;
downImage2 = uint8( downImage );
imwrite( downImage2, 'dscale.tif', 'tif' );