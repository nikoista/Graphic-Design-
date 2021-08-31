%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GRAMMIKH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PAREMVOLH

function  [value]  = vector_interp(p1,p2,a,V1,V2,dim)

% p1 kai p2 oi disdiastates suntetagmnenes twn korufwn enos trigwnou.

% V1 kai V2 oi trisdiastates times pou antistoixoun stis korifes p1 kai p2.

% a to shmeio sto opoio tha efarmostei h paremvoli.

% dim = {1,2} gia orizontia kai katheth kateuthinsh antistixos.

% value einai h timh pou prokuptei apo grammikh paremvolh twn V1 kai V2
% kata thn kateuthinsh dim.

% Calculate the color of the first active point.

if dim == 2
    edge = p1(1,1);
    if (p2(1,2) == p1(1,2))
        value =  0.5;
    else
        value = (V2(edge)-a) / (V2(edge)-V1(edge));
    end
elseif dim == 1
    if (p2(1,2) == p1(1,2))
        value = 0.5;
    else
        value = (p2(1,2)-a) / (p2(1,2)-p1(1,2));
    end
end

end