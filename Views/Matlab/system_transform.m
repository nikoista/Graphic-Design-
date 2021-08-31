%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% METASXHMATISMOS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SUSTHMATOS SUNTETAGMENWN

function [dp] = system_transform(cp , T, c0)

% c0 is a 3x1 vector that keeps the homogeneous coordinates of offset 
% column vector vo

% L is a 3x3  tranformation matrix that transforms the base b1 b2 b3 vectors
% from T table of coordinate system 1 to base vectors of coordinate system 2

% using notes' formula 5.18

% cp is expressed using coordinate system 1

% dp is expressed using coordinate system 2

I=ones(size(cp(:,1)));
c0=mtimes(c0,I');
L=[T(1:3,1) T(1:3,2) T(1:3,3)];
cp=cp';
dp = L\(cp-c0);

end