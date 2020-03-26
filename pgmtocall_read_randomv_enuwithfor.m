clc;
clear all;
close all;
A = dlmread('myphasetermfile.txt')
latitude = A(1,1);  
M = A(1,2);  
N = A(1,3);  
refa = [A(1,4)  
        A(1,5)  
        A(1,6)];
dec = A(1,7);
HAstart = A(1,8);
step = A(2,1);
HAend = A(2,2); 
n = 3;
count = 0;
[h,b] = size(A);
count = 0;
count1 = 0;
g = 0;
load randomenuchangeonlye.dat;
Zenu = randomenuchangeonlye;
   matrow =1;
   k = 64;
while 1
   for matc = 8:-1:1
     X(matrow,matc) = Zenu(k,1)
     Y(matrow,matc) = Zenu(k,2)
     k = k-1;
   endfor
   matrow = matrow+1;
   if k == 0
     break
   end
end  
for H = n:1:h
  for B = 1:1:b   
    wmat(H-2-g,B) = A(H,B)
    count = count+1;
       if (count == M*N)
         HA = HAstart+(count1*step);
         count1 = count1+1;
         surf(X,Y,wmat);
         %surf(wmat);
         colorbar;
         axis([1,8,1,8,-10,10])
         %axis([0,8,0,7,-5,5])
         %axis([0,8,-5,5])
         %title(['latitude' ':' num2str(latitude) ',M' ':' num2str(M) ',N' ':' num2str(N) ',ref antenna' ':' num2str(refa(1)), num2str(refa(2) ,num2str(refa(1) ',declination' ':' num2str(dec) ',Hour angle' ':' num2str(HA)]);
         title(['latitude' ':' num2str(latitude) ',M' ':' num2str(M) ',N' ':' num2str(N) ',ref antenna' ':' '[' num2str(refa(1)) ',' num2str(refa(2)) ',' num2str(refa(3)) ']' ',declination' ':' num2str(dec) ',Hour angle' ':' num2str(HA)]);
         %axis equal;
         xlabel('number of antennas in x direction(M)');
         ylabel('number of antennas in y direction(N)');
         %axesLabelsAlign3D('M','N');
         zlabel('phase term');
         print('%2f_plot.png','-dpng',num2str(count1));
         pause(1);
         count = 0;
         g = (8*count1);
       endif  
  endfor
endfor
