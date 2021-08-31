classdef transformation_matrix < handle
    properties (SetAccess = private)
        T 
    end
    methods
        
        function OBJ = transformation_matrix(number)
                OBJ.T = eye(number);
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ROTATION METHOD
        % th is the rotation angle 
        % R is a 3x3 rotation matrix
        % u and R are expressed using the same coordinate system
        % Using notes' Rordigues formula 5.45
        function OBJ = rotate( OBJ,theta, u)
            ux = u(1);
            uy = u(2);
            uz = u(3);
            sux = ux^2;
            suy = uy^2;
            suz = uz^2;
            costh = cos(theta);
            sinth = sin(theta);
            first = [sux ux*uy ux*uz ; uy*ux suy uy*uz ; uz*ux uz*uy suz];
            second = eye(3);
            third = [0 -uz uy ; uz 0 -ux ; -uy ux 0];
            OBJ.T(1:3,1:3) = (1-costh)*first + costh*second + sinth*third;
            
        end
        
        
        function OBJ = translate(OBJ,t)
              OBJ.T(1:3,4)= t;
        end
        
    end
end