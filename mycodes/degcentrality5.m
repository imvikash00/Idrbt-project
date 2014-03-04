function degree=degcentrality(graph,image,z);
%graph;
%size(graph);
total_no_nodes=size(graph);
total_no_nodes=total_no_nodes(1);
%graph(1,1);
for i=1:total_no_nodes
    degree(i)=sum(graph(i,:));
end

load workspace.mat
% imshow(image);
% [p,q]=ginput(1);
% for m=1:total_no_nodes
%     if (sqrt((coordinate( m, 1 ) - p ) ^ 2 + ( coordinate( m, 2 ) - q ) ^ 2 )) <= 32
% %         degree(m)
% %         fvalue(m)
% %         m
%           a=m;
%     end
% end
% 
% % req
% % degree(req)
save workspace1.mat
        
 %adjust(degree,image,z)
end