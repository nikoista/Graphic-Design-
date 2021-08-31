%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NORMAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% VECTOR

function [ normals ] = calculate_normals( vertices , face_indices )
 
% Arithmos Korufwn trigwnou
r = size(vertices,2);

% Arithmos Trigwnwn
K = size(face_indices,2);

% Normal vector gia kathe korufh
NormalVector = zeros(3,r);

%% Gia kathe trigwno vriskw to Normal Vector
for k = 1:1:K
    F1 = face_indices(1,k);
    F2 = face_indices(2,k);
    F3 = face_indices(3,k);
    A = vertices(:,F1);
    B = vertices(:,F2);
    C = vertices(:,F3);
    AB = B-A;
    AC = C-A;
    NormalCross = cross(AB,AC); 
    normNormalCross = norm(NormalCross);
    NormalCross = NormalCross/normNormalCross;
    NormalVector(:,F1) = NormalVector(:,F1) + NormalCross;
    NormalVector(:,F2) = NormalVector(:,F2) + NormalCross;
    NormalVector(:,F3) = NormalVector(:,F3) + NormalCross;     
end
normNormal = sqrt(sum(NormalVector.^2,2));
normals = NormalVector./normNormal; 

end