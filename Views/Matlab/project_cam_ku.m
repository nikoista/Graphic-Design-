%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PROOPTIKH 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% KAMERA KU

function [P,D] = project_cam_ku(w, Cv, Clookat, Cup, p)

% Frame given the camera center, target and up vector

% cv is a vector that keeps the coordinates of camera center according to
% WWS

% cK is a vector that keeps the coordinates of the camera target

% cu is a vector that is parallel to uy(one of the camera's unit vectors)

% cu is also calles up vector and it is parallel to the projection layer

% p are the points to be projectes to camera frame according to WWS

% P are the coordinates od the projected points on the camera frame

% D are the coordinates of the depth used in triPaintGouraud drawing
% function

% according to camera's coordinate system (CCS)

% we need to find cx,cy, cz that are the unit vectors of camera's 

% coordinate system according to WWS in order to use project() function

% using notes's formulas 6.6, 6.7, 6.8
cz = Clookat-Cv;
normcz = norm(cz);

cz = cz/normcz;                                       
dotuz = dot(Cup,cz);

uz = dotuz*cz;
t = Cup-uz;
normt = norm(t);

cy = t/normt;                                         
cx = cross(cy,cz);                                    

[P,D] = project_cam( w, cz, cx, cy, p);             
 
end