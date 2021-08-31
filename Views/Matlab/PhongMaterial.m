%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175

classdef PhongMaterial < handle
    properties (SetAccess = private)
        kd
        ka
        ks
        nphong
    end
    
    methods
        function OBJ = PhongMaterial(length)
            OBJ.kd = zeros(length,3);
            OBJ.kd = zeros(length,3);
            OBJ.kd = zeros(length,3);
            OBJ.nphong = 1;
        end
        
        function OBJ = phong_Material_Set(OBJ,KA,KD,KS,Nphong)
            OBJ.ka = KA;
            OBJ.kd = KD;
            OBJ.ks = KS;
            OBJ.nphong = Nphong;
        end
    end
end