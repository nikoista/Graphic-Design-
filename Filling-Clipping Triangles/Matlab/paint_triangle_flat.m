%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% XRWMATISMOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FLAT

function  [Y]  = paint_triangle_flat(img,vertices_2d,vertex_colors)

% img einai h eikona me diastaseis MxNx3 me tuxon prouparxoda trigwna

% vertices_2dX einai enas 3x2 pinakas me kathe grammh na exei tis
% disdiastates korifes twn trigwnwn

% vertex_colors einai enas 3x3 pinakas me kathe grammh na periexei to xrwma
% mias korifhs tou trigwnou se morfh RGB se times sto diasthma [0,1]

% Y einai ans pinakas MxNx3 me thn xrwmatismenh eikona

Y = img;

% taxinomhsh twn trigwnwn kai twn xrwmatwn tous
[~,I] = sort(vertices_2d(:,2));
vertices_2d = vertices_2d(I,:);
vertex_colors = vertex_colors(I,:);

V1 = min([vertices_2d(:,2) circshift(vertices_2d(:,2),-1)], [], 2);
V2 = max([vertices_2d(:,2) circshift(vertices_2d(:,2),-1)], [], 2);
ymin = min(V1);
ymax = max(V2);


% briskw to xrwma kathe korufhsSet the colours for each edge
edgecolor = zeros(3,2,3);

edgecolor(1,1,:) = vertex_colors(1,:);
edgecolor(1,2,:) = vertex_colors(2,:);
edgecolor(2,1,:) = vertex_colors(2,:);
edgecolor(2,2,:) = vertex_colors(3,:);
edgecolor(3,1,:) = vertex_colors(1,:);
edgecolor(3,2,:) = vertex_colors(3,:);

% upologismos tous suntelestes klishs gia kathe korufh
m = ( circshift(vertices_2d(:,2),-1) - vertices_2d(:,2) ) ./ ( circshift(vertices_2d(:,1),-1) - vertices_2d(:,1) );

if vertices_2d(1,2) == vertices_2d(2,2)
    T = [3 vertices_2d(1,1); 2 vertices_2d(2,1)];
else
    T = [1 vertices_2d(1,1); 3 vertices_2d(1,1)];
end

%% XRWMATIZW SUMFWNA ME TO MESO ORO TOU XRWMATOS TWN KORUFWN TOU TRIGWNOU

for y=ymin:ymax
    
    % taxinomhsh ths tetmhmenhs kathe energou shmeiou
    [~,I] = sort(T(:,2));
    T = T(I,:);
    
    % upologizw to xrwma tou 1 kai 2 energou shmeiou sumfwna me to 
    % varikedro toy trigwnou
    edgeA = T(1,1);
    C1 = edgecolor(edgeA,1,:);
    C2 = edgecolor(edgeA,2,:);
    A = C1 + C2 ;
    A = A/2;
    
    edgeB = T(2,1);
    C1 = edgecolor(edgeB,1,:);
    C2 = edgecolor(edgeB,2,:);
    B = C1 + C2;
    B = B/2;
    
    % strogilopoihsh twn x
    a = round(T(1,2)); 
    b = round(T(2,2));
    
    % xrwmatizw to trigwno xekinontas me ta energa shmeia
    Y(y,a,:) = A;
    Y(y,b,:) = B;
    
    for x=a:b
        Y(y,x,:) = (A+B)/2;
    end
    
    % prosthetw kai afairw korufes
    N = find(V1 == y+1);
    R = find(V2 == y+1);
    
    % afairw ta shmeia paremvolhs pou den exoun korufes
    if size(R,1) == 1
        T = T((T(:,1)~= R), : );
    end
    
    T(:,2) = T(:,2) + (1 ./ m(T(:,1)));
    NE = vertices_2d(N,1);
    
    % vazw ta kainouria shmeia ston dinamiko pinaka
    T = [T; N NE];
    
end
end
