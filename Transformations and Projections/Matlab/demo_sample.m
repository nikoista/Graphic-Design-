clc
clear

%% Load data %%
load('hw2.mat');

%% Step 0 -Initial position 

% 0.1 Render object with render_object
distance0 = system_transform(V,eye(3),O);

[I0] = render_object(distance0',F,C,M, N, H, W, w,cv,ck,cu);

% Save result
imwrite(I0, '0.jpg');

%% Step 0.5 - Create a transformation matrix
AT = transformation_matrix(4);

%% Step 1 - Translate the transformation matrix by t1
% 1.1 Apply translation

AT.translate( t1);
distance1 = affine_transform(distance0', AT.T);

% 1.2 Render object with render_object

[I1] = render_object(distance1 ,F, C ,M, N, H, W, w,cv,ck,cu);

% Save result
imwrite(I1, '1.jpg');

%% Step 2 - Rotate the transformation matrix by theta around given axis
% 2.1 Apply rotation

K=O;
new_distance = system_transform(distance1,AT.T ,K);    

normg = norm(g);
g = g/normg;             
AT.rotate(theta,g);                        %3x3    

cz = zeros(3,1);
AT.translate(cz);
final_distance = affine_transform (new_distance', AT.T );

% return back to WCS with -K relocation 
 
rotation1 = system_transform(final_distance, eye(3) ,-K);

% 2.2 Render object with render_object

[I2] = render_object(rotation1' ,F, C ,M, N, H, W, w,cv,ck,cu);

% Save result
imwrite(I2, '2.jpg');

%% Step 3 - Translate the transformation matrix back
% 3.1 Apply translation

AT = transformation_matrix(4);
AT.translate( t2);

distance2 = affine_transform(rotation1', AT.T);

% 3.2 Render object with render_object

[I3] = render_object(distance2 ,F, C ,M, N, H, W, w,cv,ck,cu);

% Save result
imwrite(I3, '3.jpg');

