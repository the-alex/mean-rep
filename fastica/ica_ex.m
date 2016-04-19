clear;
close all;

A = sawtooth(linspace(0,50, 1000));
B = square(linspace(0,37, 1000)+5);
figure; 
subplot(2,1,1); plot(A, 'b');
subplot(2,1,2); plot(B, 'r');


Mixed1 = 1.09 * A - 1.97 * B;
Mixed2 = 1.73 * A + 3.41 * B;
figure;
subplot(2,1,1); plot(Mixed1);
subplot(2,1,2); plot(Mixed2, 'r');

figure;
C = rev_fastica([Mixed1;Mixed2]);
subplot(1,3,1); plot(A, 'b');
subplot(1,3,2); plot(B, 'r');
subplot(1,3,3); plot(C, 'g');