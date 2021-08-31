%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RENDER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OBJECT

function [I] = render_object(p,F,C,M, N, H, W, w,Cv,Clookat,Cup)
% Function photographObject tries to take a photograph of the object
% while using the right order of our project functions to have a desent result

[P,D] = project_cam_ku(w, Cv, Clookat, Cup, p);
[P2d] = rasterize(P,M,N,H,W);
P2d= P2d';

K = size(F,1);
I = ones(M,N,3);

% Sort the triangle by depth
depth = zeros(K,1);
depth(:) = mean( D(F(:,:)), 2);
[depth, ord] = sort(depth,'descend');
F = F(ord,:);

for i=1:K
    i
    idx = F(i,:);
    vert = P2d(idx,:);
    colour = C(idx,:);

    I = paint_triangle_gouraud(I,vert,colour);
end

end