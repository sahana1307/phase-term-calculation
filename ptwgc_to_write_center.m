HAstart = -90;
step = 10;
HAend = 90;
lat1 = 0;
M = 8;
N=8;
%refa = 32;
dec = 0;
refa = [4.5
        4.5
        0];   
for HA = HAstart:10:HAend
warray = ptwgc_call_center('antennaloc88.dat',lat1,M,N,refa,dec,HA,HAstart,step,HAend)
HA
if HA == -90
fileID = fopen('myphasetermfile.txt','w');
fprintf(fileID,'%4.2f %2f %2f %2f %2f %2f %2f %2f\n',lat1,M,N,refa,dec,HAstart,step,HAend);
fclose(fileID);
endif  
dlmwrite('myphasetermfile.txt',warray,'-append',...
         'delimiter',' ','roffset',1 ,'precision','%6.5f') 
end

