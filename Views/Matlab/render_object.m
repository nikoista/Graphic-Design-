%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RENDER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OBJECT

function [Img] = render_object(shader, focal, eye, lookat, u, bg_color, M,...
    N, H, W, verts,verts_colors, face_indices,mat, lights ,Ia  )

 
%% BackGround
X(:, :, 1) = ones(M, N) * bg_color(1);
X(:, :, 2) = ones(M, N) * bg_color(2);
X(:, :, 3) = ones(M, N) * bg_color(3);

%% Vertices' Normal vectors
% computation of normal vectors for each triangle
 normals = calculate_normals(verts,face_indices );             % 3xr
 
%% Provoles
[P,D] = project_cam_ku(focal, eye, lookat, u, verts);
[P2d] = rasterize(P,M,N,H,W);
P2d= P2d';
face_indices = face_indices';
 
%% Taxinomish twn trigwnwn me vash to vathos
K = size(face_indices ,1);
depth = zeros(K,1);
depth(:) = mean( D(face_indices(:,:)), 2);
[depth, ord] = sort(depth,'descend');
face_indices = face_indices(ord,:);

%% Gouraud Shader
if shader == 1
    for i=1:K
        i
        
        idx = face_indices(i,:);
        bcoords  = mean(verts(:,face_indices(i,:)),2);
        vertsp = P2d(idx,:);
        vertsn = normals(:,idx );
        vertsc = verts_colors(idx,:);
 
        X = shade_gouraud(vertsp ,vertsn,vertsc,bcoords,eye,mat,lights,Ia,X);
       
    end
     Img = X;
end

%% Phong Shader
if shader == 2
    for i=1:K
        i
        
        idx = face_indices(i,:);
        bcoords  = mean(verts(:,idx),2);
        vertsp = P2d(idx,:);
        vertsn = normals(:,idx );
        vertsc = verts_colors(idx,:);
        
        X = shade_phong(vertsp ,vertsn,vertsc,bcoords,eye,mat,lights,Ia,X);
    end
    
    Img = X;
end


