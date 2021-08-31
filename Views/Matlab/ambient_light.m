%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FWTISMOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% AMBIENT

function [ I ] = ambient_light( mat , color , Ia )
% mat einai ena antikeimeno PhongMaterial me tous suntelestes Phong
% Ia = [Ir, Ig, Ib]T einai to 3x1 dianusma me tis sunistwses ths entashs ths
% diaxuths aktinovolias tou perivallontos. Kathe sunistwsa anhkei sto [0,1]
% color = [cr, cg, cb]T einai to 3x1 dianusma me tis sunistwses tou
% xrwmatos tou shmeiou P . Kathe sunistwsa anhkei sto [0,1]

% Tupos upologismou ambient light
I = color + mat.ka.*Ia ;

end