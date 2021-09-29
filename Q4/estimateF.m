function F = estimateF(x1, x2)

matrix_data = size(x1); matrix_height = matrix_data(1);

X1 = [x1 ones(matrix_height, 1)]; X1_mean = mean(x1); 
X2 = [x2 ones(matrix_height,1)]; X2_mean = mean(x2);
 
X1_x = (x1(:,1) - X1_mean(1) * ones(matrix_height,1)).^2;
X1_y = (x1(:,2) - X1_mean(2) * ones(matrix_height,1)).^2;
X1_xy = X1_x + X1_y; X1_total = sum(X1_xy);
S1 = X1_total / (2*matrix_height); S1 = S1^(1/2);
 
X2_x = (x2(:,1) - X2_mean(1) * ones(matrix_height,1)).^2;
X2_y = (x2(:,2) - X2_mean(2) * ones(matrix_height,1)).^2;
X2_xy = X2_x + X2_y; X2_total = sum(X2_xy);
S2 = X2_total / (2*matrix_height); S2 = S2^(1/2);
 
Transform1 = [1/S1 0 -X1_mean(1)/S1;0 1/S1 -X1_mean(2)/S1;0 0 1]; X1_new = (Transform1 * X1')';
 
Transform2 = [1/S2 0 -X2_mean(1)/S2;0 1/S2 -X2_mean(2)/S2;0 0 1]; X2_new = (Transform2 * X2')';
 
a = X1_new(:,1); b = X1_new(:,2); c = X2_new(:,1); d = X2_new(:,2);
A = [a.*c c.*b c a.*d b.*d d a b ones(matrix_height, 1)];
 
[U, S, V] = svd(A);
f = V(:,end);
 
F = [f(1) f(4) f(7); f(2) f(5) f(8);f(3) f(6) f(9)];
 
[UF, SF, VF] = svd(F);
UFK = UF(:,1:2);SFK = SF(1:2, 1:2);VFK = VF(:, 1:2);
F_singular_prime = UFK*SFK*VFK';
 
F = Transform2'*F_singular_prime*Transform1;