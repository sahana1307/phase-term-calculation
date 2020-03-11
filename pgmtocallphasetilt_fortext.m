HAstart = -90;
step = 10;
HAend = 90;
for HA = -90:10:90
warray = ptwgc_lat_fortest('antennaloc88.dat',0,8,8,36,0,HA,HAstart,step,HAend)
HA
pause(1)
end

%for HA = -90:5:90
%warray = ptwgc_lat('antennaloc16x16.dat',0,16,16,128,-45,HA)
%HA
%pause(1)
%end

%for HA = -90:5:90
%warray = ptwgc_lat('antennaloc32x32.dat',0,32,32,256,-45,HA)
%HA
%pause(1)
%end