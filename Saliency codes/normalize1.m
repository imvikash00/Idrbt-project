function [ Map ] = normalize1( Map );

[ sizex, sizey ] = size( Map );
Map = Map - min( min( Map ) );
m = max( max( Map ) );
if m > 0
    Map = Map / m * 100;
end
Map1 = zeros( sizex, sizey );
for i = 1 : sizex
    for j = 1 : sizey
        if i == 1
            if j == 1
                neighb = [ Map( 1, 2 ) Map( 2, 1 : 2 ) ];
            elseif j == sizey
                neighb = [ Map( 1, sizey - 1 ) Map( 2, sizey - 1 : sizey ) ];
            else
                neighb = [ Map( 1, j - 1 ) Map( 1, j + 1 ) Map( 2, j - 1 : j + 1 ) ];
            end
        elseif i == sizex
            if j == 1
                neighb = [ Map( sizex - 1, 1 : 2 ) Map( sizex, 2 ) ];
            elseif j == sizey
                neighb = [ Map( sizex - 1, sizey - 1 : sizey ) Map( sizex, sizey - 1 ) ];
            else
                neighb = [ Map( sizex - 1, j - 1 : j + 1 ) Map( sizex, j - 1 ) Map( sizex, j + 1 ) ];
            end
        elseif j == 1
            neighb = [ Map( i - 1, 1 : 2 ) Map( i, 2 ) Map( i + 1, 1 : 2 ) ];
        elseif j == sizey
            neighb = [ Map( i - 1, sizey - 1 : sizey ) Map( i, sizey - 1 ) Map( i + 1, sizey - 1 : sizey ) ];
        else
            neighb = [ Map( i - 1, j - 1 : j + 1 ) Map( i, j -  1 ) Map( i, j + 1 ) Map( i + 1, j - 1 : j + 1 ) ];
        end
        if Map( i, j ) >= max( neighb )
            Map1( i, j ) = 1;
        end
    end
end
pos = find( Map1 == 1 );
avg = 0;
nummax = 0;
for i = 1 : length( pos )
    if Map( pos( i ) ) ~= 100
        avg = avg + Map( pos( i ) );
        nummax = nummax + 1;
    end
end
if nummax ~= 0
    avg = avg / nummax;
end
Map = Map * ( 100 - avg ) ^ 2;