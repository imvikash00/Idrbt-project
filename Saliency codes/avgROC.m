function AverageROC = avgROC( TotNum );

for i = 1 : TotNum
    ROCFN = strcat( 'ROC\DegCent\10dB\ROCDC_m', num2str( i ), '_10.txt' );
    ROC = readROCFile( ROCFN );
    k = 50;
    InterMedROC = [];
    for j = 0.01 : 0.01 : 0.1
        while ROC( k, 1 ) < j
            k = k - 1;
        end
        InterMedROC = [ InterMedROC ROC( k, 2 ) ];
    end
    for j = 0.2 : 0.1 : 0.9
        while ROC( k, 1 ) < j
            k = k - 1;
        end
        InterMedROC = [ InterMedROC ROC( k, 2 ) ];
    end
    j = 0.95;
    k = 1;
    while ROC( k, 1 ) > j
        k = k + 1;
    end
    k = k - 1;
    if k > 0
        InterMedROC = [ InterMedROC ROC( k, 2 ) ];
    else
        InterMedROC = [ InterMedROC 1 ];
    end
    AllInterMedROC( i, : ) = InterMedROC;
    clear ROCFN
    clear ROC
    clear j
    clear k
    clear InterMedROC
end
AverageROC( :, 1 ) = [ 0.01; 0.02; 0.03; 0.04; 0.05; 0.06; 0.07; 0.08; 0.09; 0.1; 0.2; 0.3; 0.4; 0.5; 0.6; 0.7; 0.8; 0.9; 0.95 ];
for i = 1 : 19
    AverageROC( i, 2 ) = mean( AllInterMedROC( :, i ) );
end
AverageROC = [ AverageROC; 1 1 ];