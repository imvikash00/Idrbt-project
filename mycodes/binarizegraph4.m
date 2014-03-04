function graph=binarizegraph(graph,threshold)

graph(find(graph<=threshold))=0;
graph(find(graph>threshold))=1;