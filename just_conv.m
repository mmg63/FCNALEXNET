clc;
clear all
img = imread('701_StillsRaw_full/IMG_8185.jpg');
size(img)
img_temp = img;
% imshow(img(:,:,:))
img_conved = zeros(320,426,3);
conv_mul = zeros(3,3,3);
conv_mul(:,:,1) = [1,0,1;0,1,0;1,0,1];
conv_mul(:,:,2) = [1,0,1;0,1,0;1,0,1];
conv_mul(:,:,3) = [1,0,1;0,1,0;1,0,1];
conv_mul = uint8(conv_mul);
% conv 3*3 for RGB image
for i=1:319
    for j=1:425
        for k=1:3
            img_temp((i*3):(i*3)+2,(j*3):(j*3)+2,k) = ...
                img_temp((i*3):(i*3)+2,(j*3):(j*3)+2,k) .* conv_mul(:,:,k);
            img_conved(i,j,k) =...
                max(max(img_temp((i*3):(i*3)+2,(j*3):(j*3)+2,k)));
        end
    end
end
img_conved = uint8(img_conved);


img_conved2 = zeros(106,142,3);
% conv 3*3 for RGB image
for i=1:105
    for j=1:141
        for k=1:3
            img_conved((i*3):(i*3)+2,(j*3):(j*3)+2,k) = ...
                img_conved((i*3):(i*3)+2,(j*3):(j*3)+2,k) .* conv_mul(:,:,k);
            img_conved2(i,j,k) =...
                max(max(img_conved((i*3):(i*3)+2,(j*3):(j*3)+2,k)));
        end
    end
end
img_conved2 = uint8(img_conved2);

% 
% 
% img_conved3 = zeros(35,47,3);
% % conv 3*3 for RGB image
% for i=1:34
%     for j=1:46
%         for k=1:3
%             img_conved2((i*3):(i*3)+2,(j*3):(j*3)+2,k) = ...
%                 img_conved2((i*3):(i*3)+2,(j*3):(j*3)+2,k) .* conv(:,:,k);
%             img_conved3(i,j,k) =...
%                 sum(sum(img_conved2((i*3):(i*3)+2,(j*3):(j*3)+2,k)));
%         end
%     end
% end
% img_conved3 = uint8(img_conved3);
% 
% 
% 
% 
% img_conved4 = zeros(11,15,3);
% % conv 3*3 for RGB image
% for i=1:10
%     for j=1:14
%         for k=1:3
%             img_conved3((i*3):(i*3)+2,(j*3):(j*3)+2,k) = ...
%                 img_conved3((i*3):(i*3)+2,(j*3):(j*3)+2,k) .* conv(:,:,k);
%             img_conved4(i,j,k) =...
%                 sum(sum(img_conved3((i*3):(i*3)+2,(j*3):(j*3)+2,k)));
%         end
%     end
% end
% img_conved4 = uint8(img_conved4);
% 
% 
subplot(2,3,1), imshow(img);
title('Original image');
xlabel('960 px');
ylabel('1280 px');
subplot(2,3,2), imshow(img_conved);
title('sum conv by multiply filter');
xlabel('320 px');
ylabel('426 px');
subplot(2,3,3), imshow(img_conved2);
title('sum conv by summing filter');
xlabel('106 px');
ylabel('142 px');
% subplot(2,3,4), imshow(img_conved3);
% title('sum pool 3');
% xlabel('35 px');
% ylabel('47 px');
% subplot(2,3,5), imshow(img_conved4);
% title('sum pool 4');
% xlabel('11 px');
% ylabel('15 px');






