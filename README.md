# phase-term-calculation
phase term to be adjusted depending on antenna positions and phase center
Text file contains the results obtained by running code
Code extracts uvw plane information of antennas according to the below link given:
https://web.njit.edu/~gary/728/Lecture6.html
For our purpose only phase information is required(w term) to adjust the phases accordingly with respect to antenna positions
North pole and south pole document contains results for verifying if the source is at north and south pole, changing of hour angles or earth rotation has no effect on phase adjustments at latitude=0
but at latitude=small change of +-10 degrees, phase term will change
Generalized code for 8x8 and 3x3 array has been uploaded
