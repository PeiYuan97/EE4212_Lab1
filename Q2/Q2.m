Dir_to_me = pwd;
time_lapse_video_folder = dir(fullfile(Dir_to_me, 'time*'));
File_to_use = dir(fullfile(Dir_to_me, time_lapse_video_folder.name,'image*.png'));

% part b
I = im2double(imread(fullfile(Dir_to_me, time_lapse_video_folder.name, File_to_use(1).name))); %disp(I);
[U S V] = svd(I);
plot (diag(S),'b.');

% part c
K=20;
Sk=S(1:K,1:K);
Uk=U(:,1:K);
Vk=V(:,1:K);
Imk = Uk*Sk*Vk'; imshow(Imk);
 
% part d
K=40;
Sk=S(1:K,1:K);
Uk=U(:,1:K);
Vk=V(:,1:K);
Imk = Uk*Sk*Vk'; imshow(Imk);
 
K=60;
Sk=S(1:K,1:K);
Uk=U(:,1:K);
Vk=V(:,1:K);
Imk = Uk*Sk*Vk'; imshow(Imk);
 
K=80;
Sk=S(1:K,1:K);
Uk=U(:,1:K);
Vk=V(:,1:K);
Imk = Uk*Sk*Vk'; imshow(Imk);