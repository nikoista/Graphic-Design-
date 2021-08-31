%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FWTISMOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SPECULAR

function [ I ] = specular_light( P,N,color,cam_pos,mat,lights )

% Dianhsma V0 
V = cam_pos-P;
V0 = V./norm(V);

%  Dianhsma N0 (kanonikopoihsh tou tou normal vector) 
N0 = ( N./norm(N) )' ;

% Suntelesths fatt
fatt = 1;

% Dianhsma L0 
L = lights.pos  - P; 
L0 = L./norm(L);

% Tupos upologismou specular light
a =  2*N0 *dot(N0  ,L0);
a=a';
a=a-L0;
I   = color  + (lights.intensity .*fatt*mat.ks.*(dot( a, V0)).^mat.nphong) ;
 
end