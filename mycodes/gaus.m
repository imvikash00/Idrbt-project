function OutVal = gaus( InpVal );
% This is a Gaussian function

OutVal = exp( - InpVal .^ 2 / ( 2 * 0.5 ^ 2 ) );