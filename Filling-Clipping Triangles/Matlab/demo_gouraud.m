%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Demo Gouraud

clear;
clc;

% epexergasia arxeiou 
load('racoon_hw1.mat');

% vasikh sunarthsh render
renderer=1; 
racoon_Image = render(vertices_2d,faces,vertex_colors,depth,renderer);

% apothikeush eikonas
figure('Name','Racoon_Image');    
imshow(racoon_Image);  
imwrite(racoon_Image,'demo_gouraud.png');