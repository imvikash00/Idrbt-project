function Evaluate%( ResultFN, BenchmarkFN );
% Evaluation using ROC curve 

for i = 1 : 4
    ResultFN = strcat( 'E:\MATLAB codes\Graph-centrality based saliency computation of images at multiple scales\Output\with varying threshold\m', num2str( i ), '_10\0.75(1-T)+T\DegIm_IGraph.tif' );
    Result = imread( ResultFN );
    [ SizeX, SizeY ] = size( Result );
    BenchmarkFN = strcat( 'E:\MATLAB codes\Benchmark\m', num2str( i ), '_FeedbackPlot.tif' );
    Benchmark = imread( BenchmarkFN );
    pos_Benchmark = find( Benchmark == 255 );
    TextFN = strcat( 'ROCDC_m', num2str( i ), '_10.txt' );
    fid = fopen( TextFN, 'w' );
    ROC = [];
    for Threshold = 5 : 5 : 250
        B_Result = BinarizeSMap( Result, Threshold );
        pos_Result = find( B_Result == 255 );
        FP = length( setdiff( pos_Result, pos_Benchmark ) ) / ( SizeX * SizeY - length( pos_Benchmark ) );
        TP = length( intersect( pos_Result, pos_Benchmark ) ) / length( pos_Benchmark );
        ROC = [ ROC; Threshold FP TP ];
        fprintf( fid, '%d %f %f \n', Threshold, FP, TP );
        clear B_Result
        clear pos_Result
        clear FP
        clear TP
    end 
%figure; plot( ROC( :, 2 ), ROC( :, 3 ) );
    fclose( fid );
    clear ROC
    clear ResultFN
    clear BenchmarkFN
    clear Result
    clear Benchmark
    clear pos_Benchmark
    clear TextFN
    clear fid
end