clear;
close all;

A = sin(linspace(0,50, 1000));   % A
B = sin(linspace(0,37, 1000)+5); % B
figure; 
subplot(2,1,1); plot(A, 'b');         % plot A
subplot(2,1,2); plot(B, 'r');    % plot B

M1 = A - 2*B;                  % mixing 1
M2 = 1.73*A+3.41*B;            % mixing 2
figure;
subplot(2,1,1); plot(M1);      % plot mixing 1
subplot(2,1,2); plot(M2, 'r'); % plot mixing 2

figure;
C = fastica([M1;M2]);              % compute and plot unminxing using fastICA	
subplot(1,3,1); plot(C, 'g');
subplot(1,3,2); plot(A, 'b');
subplot(1,3,3); plot(B, 'r');
