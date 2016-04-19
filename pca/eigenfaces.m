clear all;
close all;

colormap gray
load YaleB_32x32.mat

h = 32;
w = 32;

x = double(fea)';
V = pca_eigen_face(x);
 
for i = 1:16
    subplot(4,4,i)
    imagesc(reshape(V(:,i),[h,w]))
end