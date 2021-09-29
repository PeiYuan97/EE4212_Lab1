%load file
load('pts.txt');
load('pts_prime.txt');

p1 = [pts ones(200,1)]; p2 = [pts_prime ones(200,1)];
p2_x = p2(:,1); p2_y = p2(:,2);p2_z = p2(:,3);

[U S V] = svd(p1); S = diag(S);
temp = U'*p2_x; temp_1 = temp(1:4)./S; col1 = V*temp_1;
temp = U'*p2_y; temp_1 = temp(1:4)./S; col2 = V*temp_1;
temp = U'*p2_z; temp_1 = temp(1:4)./S; col3 = V*temp_1;

Rt = [col1 col2 col3]; Rt = Rt';
R = (Rt(:,1:3));
T = Rt(:,4);
det_R=det(R);

disp('Translation T is:'); disp(T);
disp('Rotation R is:'); disp(R);
disp('Determinant R is:'); disp(det_R);