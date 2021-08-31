%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FWTISMOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DIFFUSE

function [ I ] = diffuse_light( P , N , color , mat , lights )
 
%  Dianhsma N0 (kanonikopoihsh tou tou normal vector) 
N0 = ( N./norm(N));

% Dianhsma L0 
L = lights.pos  - P;
L0 = L./norm(L);

% Suntelesths fatt
fatt = 1;

% Tupos upologismou diffusion light
I = color  + (lights.intensity  ) * fatt  *(mat.kd) *dot(N0 ,L0);
 
end