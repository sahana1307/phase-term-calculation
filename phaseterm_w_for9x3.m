% name:Calculation of phase factor(w)

function wterm = phaseterm_w_for9x3(dec,HA)
%Provide the parameters to get phase factor(w) values
%Declination and hour angle
%Angle of declination
%dec = 0;
%Hour Angle
%HA = 30;
%{
enu = [0,0,0]
% East,North and Up location in terms of coordinates
N = 8; 
M = 8; 
z = 0;
for y = 0:1:N-1
    for x = 0:1:M-1
    temp = [x,y,z];
    enu = vertcat(enu,temp);
    end
end  
%}
M = 3;
N = 3;
enu1 = [0 0 0];
filename = 'antennaloc.dat';
delimiterIn = ' ';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);
enutemp = (A.data);
enu = vertcat(enu1,enutemp);   
%enu = A   
        
 lat1 = 0; %Latitude(antennas are placed on Equator)     
 %Translation matrix to transform East,north and Up direction in terms of latitude
  trans = [ 0, -sind(lat1), cosd(lat1)
            1,  0,          0
            0, cosd(lat1),  sind(lat1) ];
%xyz matrix in terms of latitude       
   xyz = trans*enu';
% reference antenna (51,52,53,54,55,56,57,58,59)   
   refa =5;  
%Calculation of baseline
   bxyz = xyz .- xyz(:,refa);
%Assign Hour angle and declination recieved from function
%   H0 = 45;
%   D0 = 45;
   %H0=45; D0=45;
   H0 = HA;
   D0=dec;
%Translation matrix for converting latitude information to uvw plane   
   transHD = [  sind(H0),               cosd(H0),           0
               -sind(D0)*cosd(H0),      sind(D0)*sind(H0),  cosd(D0)
                cosd(D0)*cosd(H0),     -cosd(D0)*sind(H0),  sind(D0) ];   
%Calculation of uvw plane values  
    uvw =  transHD*bxyz;
    
    uvw(3,:)
%display the phase term which is required(Maximum negative indicates the direction of observation)   
s =uvw(3,:);
d=reshape(s,[M,N])';
wmat = flip(d);                        
 wterm = wmat;
return