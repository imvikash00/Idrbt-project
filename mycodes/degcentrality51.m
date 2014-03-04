function degree=degcentrality51(graph);
%graph;
%size(graph);
total_no_nodes=size(graph);
total_no_nodes=total_no_nodes(1);
%graph(1,1);
for i=1:total_no_nodes
    degree(i)=sum(graph(i,:));
end


%adjust(degree)
end