%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PROOPTIKH 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% KAMERA

function [P,D] = project_cam(w, cv, cx, cy, p)

% cx,cy, cz are the unit vectors of camera's coordinate system according to
% WWS

% cv is a vector that keeps the coordinates of camera center according to
% WWS

% p are the points to be projectes to camera frame according to WWS

% P are the coordinates od the projected points on the camera frame
% according to camera's coordinate system (CCS)

% create the third unit vector z by using the cross product of ux and uy
% because i use an orthonormal coordinate system

% cz is a 3x1 unit vector
cz = cross(cx,cy);                                  

T = [ cx   cy   cz];
% We use systemTransform
% cp is a 3xn matrix that keep the  coordinates of the points
% to be projectes on camera frame according to CCS

cp = system_transform( p' , T , cv);                      
P1 = cp(1,:).*w;
P2 = cp(2,:).*w;
D =  cp(3,:).*w;
P = [P1 ; P2] ;
end 