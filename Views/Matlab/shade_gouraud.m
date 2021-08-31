%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SHADING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GOURAUD

function [ Y ] =shade_gouraud(vertsp,vertsn,vertsc,bcoords,cam_pos,mat,lights,Ia,X)

aL=zeros(3,3);
dL=zeros(3,3);
sL=zeros(3,3);

if mat.ka~=0
    for i = 1 : 3
        aL(i,:) = ambient_light (mat, vertsc(i,:), Ia) ;
    end
end
if mat.kd~=0
    for i = 1 : 3
        dL(i,:)  =  diffuse_light(bcoords, vertsn(:,i),vertsc(i,:), mat, lights);
    end
end
if mat.ks~=0
    for i = 1 : 3
        sL(i,:) = specular_light(bcoords, vertsn(:,i) , vertsc(i,:) , cam_pos, mat, lights);
    end
end


if  mat.ks  > 0  &&  mat.kd>0  && mat.ka >0
    color = aL+dL+sL - 2*vertsc ;
else
    color=aL+dL+sL;
end


Y=X;
Y = paint_triangle_gouraud(Y,vertsp,color);
end