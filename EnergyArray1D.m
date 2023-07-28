%Verified

function [SiteEnergy] = EnergyArray1D()
%Verified 2/06


global Mean Standard_Deviation Number_Of_Sites IEBarrier CEBarrier BoundaryED 

%-----------------Get a 1D array of energy states from a gaussian-----

SiteEnergy=normrnd(Mean,Standard_Deviation,[1,Number_Of_Sites]);
 
%----------- Setting Energy at the Electrodes---------------
 SiteEnergy(1)=SiteEnergy(1)+IEBarrier;
 SiteEnergy(Number_Of_Sites)=SiteEnergy(Number_Of_Sites)+CEBarrier;
 BoundaryED=SiteEnergy(Number_Of_Sites)-SiteEnergy(1);
%---------------------------------------------------------------


end