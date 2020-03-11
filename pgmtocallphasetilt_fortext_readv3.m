clc;
clear all;
close all;
A = dlmread('myphasetermfile.txt')
latitude = A(1,1);  
M = A(1,2);  
N = A(1,3);  
refa = A(1,4);  
dec = A(1,5);  
HAstart = A(1,6);
step = A(1,7);
HAend = A(1,8); 
n = 2;
count = 0;
[h,b] = size(A);
count = 0;
count1 = 0;
g = 0;
for H = 2:1:h-1
  for B = 1:1:b   
    wmat(H-1-g,B) = A(H,B)
    count = count+1;
       if (count == M*N)
         count1 = count1+1;
         surf(wmat);
         title(['latitude' ':' num2str(latitude) ',M' ':' num2str(M) ',N' ':' num2str(N) ',ref antenna' ':' num2str(refa) ',declination' ':' num2str(dec)]);
         axis([1,8,1,8,-10,10])
         pause(1);
         count = 0;
         g = (8*count1);
       endif  
  endfor
endfor
