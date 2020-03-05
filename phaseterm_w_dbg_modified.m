% name:Calculation of phase factor(w)

function wterm = phaseterm_w_dbg_modified(dec,HA)
%Provide the parameters to get phase factor(w) values
%Declination and hour angle
%Angle of declination
%dec = 0;
%Hour Angle
%HA = 30;

% East,North and Up location in terms of coordinates
 
  enu =[ 0, 0, 0
         1, 0, 0
         2, 0, 0
         0, 1, 0
         1, 1, 0
         2, 1, 0
         0, 2, 0
         1, 2, 0
         2, 2, 0];
        
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
   bxyz = xyz .- xyz(:,refa)
%Assign Hour angle and declination recieved from function
   H0 = HA;
   D0 = dec;
   %H0=45; D0=45;
%Translation matrix for converting latitude information to uvw plane   
   transHD = [  sind(H0),               cosd(H0),           0
               -sind(D0)*cosd(H0),      sind(D0)*sind(H0),  cosd(D0)
                cosd(D0)*cosd(H0),     -cosd(D0)*sind(H0),  sind(D0) ];   
%Calculation of uvw plane values  
    uvw =  transHD*bxyz
    
    uvw(3,:)
%display the phase term which is required(Maximum negative indicates the direction of observation)   
    wmat = [  uvw(3,7), uvw(3,8), uvw(3,9)
              uvw(3,4), uvw(3,5), uvw(3,6)
              uvw(3,1), uvw(3,2), uvw(3,3) ];
                        
 wterm = wmat;
return