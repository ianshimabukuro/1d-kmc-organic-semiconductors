function [Mobility] = KMCMobility(Current,ElectricF)
%OK
global Number_Of_Sites Lattice_Constant q Number_Of_Electrons

Mobility= (Current*(Number_Of_Sites-1)*Lattice_Constant)/(q*ElectricF*Number_Of_Electrons);

end