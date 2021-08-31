%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METASXHMATISMOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% AFFINE

function [cq] = affine_transform(cp , T )
% Function affineTransform() performs Affine transformation to column vector cp 
% and transforms it into column vector cq 

% cp is a 3xn vector(-matrix) that has the coordinates 

% cq is a 3xn vector(-matrix) that keeps the coordinates of 
% the tranformed column vector of cp

% ct is a 3x1 vector keeps the coordinates of offset column 
% vector t

% R is a 3x3 linear tranformation matrix
% using notes' formula 5.14 

% using notes' formula 5.23 and 5.35 
% cp, cq, ct, L are expressed using the same coordinate system

I=ones(size(cp(:,1)));
ct=mtimes(T(1:3,4),I');
cp=cp';
cq = T(1:3,1:3)*(cp+ct);
cq=cq';

end