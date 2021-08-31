%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RASTERIZE

function [Prast] = rasterize(P,M,N,H,W)
% Function rasterize is used for rounding up our image 
% and puts the right offset in order that our image is well 
% placed inside the 1200x1200 dimension's

Prast(1, :) =  round( M/2  - (P(1, :)./H *M/500 )  );   
Prast(2, :) =  round( N/2  - (P(2, :)./W *N/500 )  );
end
