%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% XRWMATISMOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FLAT

function  [Img]  = render( vertices_2d,faces,vertex_colors,depth,renderer)

% Imag einai h engxrwmh eikona diastashs MxNx3 oi disdiastates suntetagmnenes twn korufwn enos trigwnou.

% vertices_2d einai enas pinakas me tis korufes twn trigwnwn tis eikonas .
% O pinakas einai diastashs Lx2 kai periexei tis suntetagmenes enos
% plhthous L korufwn . Oles briskontai entow tou kamba.

% faces einai enas pinalas pou periexei tis korufes twn K trigwnwn me
% diastash Kx3

% vertex_colors einai enas 3x3 pinakas me kathe grammh na periexei to xrwma
% mias korifhs tou trigwnou se morfh RGB se times sto diasthma [0,1]

% depth einai o pinakas pou dhlwnei to bathos ths kathe korufhs prin thn
% provolh

% renderer einai mia metavlhth elegxou (0,1) pou kathorizei th sunarthsh
% (Flat , Gouraud) pou tha xrhsimopoihthei.

% M kai N einai h diastaseis tou kamva.
M = 1200;
N = 1200;
Img = ones(M,N,3);

K = size(faces,1);

% taxinomo ta trigwna sumfwna me to to bathos
D = mean( depth(faces(:,:)), 2);
[~, order] = sort(D,'descend');
faces = faces(order,:);


% xrwmatismos Flat
if (renderer == 0)
    for i=1:K
        i
        index = faces(i,:);
        verticles = vertices_2d(index,:);
        colour = vertex_colors(index,:);
        
        Img = paint_triangle_flat(Img,verticles,colour);
    end
end

% xrwmatismos Gouraud
if (renderer == 1)
    for i=1:K
        i
        index = faces(i,:);
        verticles = vertices_2d(index,:);
        colour = vertex_colors(index,:);
        
        Img = paint_triangle_gouraud(Img,verticles,colour);
    end
end
end

