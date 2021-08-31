%% GRAFIKH ME UPOLOGISTES
%% NIKOLAOS ISTATIADIS  9175


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SHADING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GOURAUD

function [ Y ] = shade_phong(vertsp,vertsn,vertsc,bcoords,cam_pos,mat ,lights,Ia,X)

Y=X;
 
aLA=zeros(1,3);
dLA=zeros(1,3);
sLA=zeros(1,3);
aLB=zeros(1,3);
dLB=zeros(1,3);
sLB=zeros(1,3);
aLC=zeros(1,3);
dLC=zeros(1,3);
sLC=zeros(1,3);

% taxinomhsh twn trigwnwn kai twn xrwmatwn tous

[~,I] = sort(vertsp(:,2));
vertsp = vertsp(I,:);
vertsc = vertsc(I,:);

V1 = min([vertsp(:,2) circshift(vertsp(:,2),-1)], [], 2);
V2 = max([vertsp(:,2) circshift(vertsp(:,2),-1)], [], 2);
ymin = min(V1);
ymax = max(V2);


% briskw to xrwma kathe korufhs
edgecolor = zeros(3,2,3);

edgecolor(1,1,:) = vertsc(1,:);
edgecolor(1,2,:) = vertsc(2,:);
edgecolor(2,1,:) = vertsc(2,:);
edgecolor(2,2,:) = vertsc(3,:);
edgecolor(3,1,:) = vertsc(1,:);
edgecolor(3,2,:) = vertsc(3,:);

% briskw to normal vector kathe korufhs
edgeN = zeros(3,2,3);
vertsn =vertsn';
edgeN(1,1,:) = vertsn(1,:);
edgeN(1,2,:) = vertsn(2,:);
edgeN(2,1,:) = vertsn(2,:);
edgeN(2,2,:) = vertsn(3,:);
edgeN(3,1,:) = vertsn(1,:);
edgeN(3,2,:) = vertsn(3,:);

% upologismos tous suntelestes klishs gia kathe korufh
m = ( circshift(vertsp(:,2),-1) - vertsp(:,2))...
    ./ ( circshift(vertsp(:,1),-1) - vertsp(:,1) );

if vertsp(1,2) == vertsp(2,2)
    T = [3 vertsp(1,1); 2 vertsp(2,1)];
else
    T = [1 vertsp(1,1); 3 vertsp(1,1)];
end


%% XRWMATIZW SUMFWNA ME THN SUNARTHSH GRAMMIKHS PAREMVOLHS.
 
for y=ymin:ymax
 
    % taxinomhsh ths tetmhmenhs kathe energou shmeiou
    [~,I] = sort(T(:,2));
    T = T(I,:);
    
    p1 = T(1,:);
    p2 = T(2,:);
    dim = 2;
    
    % upologizw to xrwma kai to normal vector tou 1 kai 2 energou shmeiou sumfwna me thn
    % sunarthsh vector_interp
    
    lamdaA =  vector_interp(p1,p2,y,V1,V2,dim);
    C1 = edgecolor(p1(1,1),1,:);
    C2 = edgecolor(p1(1,1),2,:);
    A(1,:) = lamdaA * C1 + (1-lamdaA)*C2;
    
    N1 = edgeN(p1(1,1),1,:);
    N2 = edgeN(p1(1,1),2,:);
    NA(1,:) = lamdaA * N1 + (1-lamdaA)*N2;
    
    lamdaB =  vector_interp(p2,p1,y,V1,V2,dim);
    
    C1 = edgecolor(p2(1,1),1,:);
    C2 = edgecolor(p2(1,1),2,:);
    B(1,:) = lamdaB * C1 + (1-lamdaB)*C2;
    
    N1 = edgeN(p2(1,1),1,:);
    N2 = edgeN(p2(1,1),2,:);
    NB(1,:) = lamdaB * N1 + (1-lamdaB)*N2;
    

    % strogilopoihsh twn x
    a = round(T(1,2));
    b = round(T(2,2));
    
    
    % xrwmatizw to trigwno xekinontas me ta energa shmeia
    Y(y,a,:) = A;
    Y(y,b,:) = B;
    
 
    
    dim = 1;
    for x=a:b
        sigma =  vector_interp(p1,p2,x,A,B,dim);
        C(1,:) =  sigma * A + (1-sigma)*B;
        NC(1,:) = sigma * NA + (1-sigma)*NB;
        
        % xrwmatizw to trigwno xekinontas me ta energa shmeia
        if mat.ka~=0
            aLC = ambient_light (mat,C, Ia) ;
        end
        if mat.kd~=0
            dLC = diffuse_light(bcoords, NC,C, mat, lights);
        end
        if mat.ks~=0
            sLC = specular_light(bcoords, NC' , C , cam_pos, mat, lights);
            
        end
        
        if  mat.ks  > 0  &&  mat.kd>0  && mat.ka >0
            color = aLC+dLC+sLC - 2*C ;
        else
            color=aLC+dLC+sLC;
        end
        Y(y,x,:) = color;
    end
    
    % prosthetw kai afairw korufes
    N = find(V1 == y+1);
    R = find(V2 == y+1);
    
    % afairw ta shmeia paremvolhs pou den exoun korufes
    if size(R,1) == 1
        T = T((T(:,1)~= R), : );
    end
    
    T(:,2) = T(:,2) + (1 ./ m(T(:,1)));
    NE = vertsp(N,1);
    
    % vazw ta kainouria shmeia ston dinamiko pinaka
    T = [T; N NE];
    
end
end