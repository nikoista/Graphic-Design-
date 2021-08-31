%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175

classdef PointLight < handle
    properties (SetAccess = private)
        pos
        intensity
    end
    
    methods
        function OBJ = PointLight(length)
            OBJ.pos = zeros(length,1);
            OBJ.intensity = zeros(length,1);
        end
        
        function OBJ = point_Light_Set(OBJ,Posision,Intensity)
            OBJ.pos = Posision;
            OBJ.intensity = Intensity;
        end
    end
end