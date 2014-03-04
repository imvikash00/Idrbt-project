function G = Gabor( Lambda, Theta, Phi, Sigma, Gamma );
for x = - 2 : 2
    for y = - 2 : 2
        x1 = x * cos( Theta ) + y * sin( Theta );
        y1 = - x * sin( Theta ) + y * cos( Theta );
        %G( x + 3, y + 3 ) = exp( - ( x1 ^ 2 + Gamma ^ 2 * y1 ^ 2 ) / ( 2 * Sigma ^ 2 ) ) * cos( 2 * pi * x1 / Lambda + Phi );
        G( x + 3, y + 3 ) = exp( - ( x1 ^ 2 + Gamma ^ 2 * y1 ^ 2 ) / ( 2 * Sigma ^ 2 ) ) * cos( 2 * pi * ( x1 + y1 ) / Lambda + Phi );        
    end
end