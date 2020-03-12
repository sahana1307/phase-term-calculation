% name:Calculation of phase factor(w)
%calling a function example:phaseterm_w_general('antennaloc88.dat',8,8,32,45,45)
function wmat = ptwgc_call_center(fname,lat1,M,N,refa,dec,HA,HAstart,step,HAend)

filename = fname;
[enu]=importdata(filename);         
 %lat1 = 0; %Latitude(antennas are placed on Equator)     
 %Translation matrix to transform East,north and Up direction in terms of latitude
  trans = [ 0, -sind(lat1), cosd(lat1)
            1,  0,          0
            0, cosd(lat1),  sind(lat1) ];
%xyz matrix in terms of latitude       
   xyz = trans*enu';
   refac = trans*refa;
% reference antenna (51,52,53,54,55,56,57,58,59)  if reference antenna is 5 
%   refa =5;  
%Calculation of baseline
%   bxyz = xyz .- xyz(:,refa);
bxyz = xyz .- refac;
%Assign Hour angle and declination recieved from function
   H0 = HA;
   D0=dec;
%Translation matrix for converting latitude information to uvw plane   
   transHD = [  sind(H0),               cosd(H0),           0
               -sind(D0)*cosd(H0),      sind(D0)*sind(H0),  cosd(D0)
                cosd(D0)*cosd(H0),     -cosd(D0)*sind(H0),  sind(D0) ];   
%Calculation of uvw plane values  
    uvw =  transHD*bxyz;
    
    uvw(3,:);
%display the phase term which is required(Maximum negative indicates the direction of observation)   
s =uvw(3,:);
d=reshape(s,[M,N])';
wmat = flip(d);     
return