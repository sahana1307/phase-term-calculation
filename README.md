# phase-term-calculation
phase term to be adjusted depending on antenna positions and phase center
Text file contains the results obtained by running code
Code extracts uvw plane information of antennas according to the below link given:
https://web.njit.edu/~gary/728/Lecture6.html
For our purpose only phase information is required(w term) to adjust the phases accordingly with respect to antenna positions
North pole and south pole document contains results for verifying if the source is at north and south pole, changing of hour angles or earth rotation has no effect on phase adjustments at latitude=0
but at latitude=small change of +-10 degrees, phase term will change
Generalized code for 8x8 and 3x3 array has been uploaded
phaseterm_w_general('antennaloc88.dat',8,8,32,45,45)
first parameter: .dat file of antenna location in terms of coordinates
second parameter: Number of antennas in x direction
third parameter: Number of antennas in y direction
fourth parameter: reference antenna
fifth parameter:Declination
Sixth parameter:Hour angle.
phaseterm_w_general_color is to check the colors with respect to phases which helps to visualize the direction of arrival and phases to be adjusted instead of checking values:
>> phaseterm_w_general_color('antennaloc32x32.dat',32,32,256,90,90);
>> phaseterm_w_general_color('antennaloc32x32.dat',32,32,256,30,45);
>> phaseterm_w_general_color('antennaloc32x32.dat',32,32,256,30,-45);
>> phaseterm_w_general_color('antennaloc32x32.dat',32,32,256,-30,-45);
>> phaseterm_w_general_color('antennaloc32x32.dat',32,32,256,-30,45);
>> phaseterm_w_general_color('antennaloc32x32.dat',32,32,256,30,45);
ptwgc_lat.m is the main program which calls function pgmtocallphasetilt.m to show the animation.
pgmtocallphasetilt_fortext.m calls ptwgc_lat_fortest to generate the text file
pgmtocallphasetilt_fortextreadv3 reads the text file and si
