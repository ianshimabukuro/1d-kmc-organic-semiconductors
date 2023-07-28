function [OPArray,Ef_Opt] = OPInitializer(EnergyArray)
%Verified 2/06

global Number_Of_Electrons Number_Of_Sites Kb T Electric_Field Lattice_Constant


%Make it uses the non-electric energy array
for i=1:Number_Of_Sites
      Energy(i)=EnergyArray(i)+(i-1)*Lattice_Constant*Electric_Field;
end



%INput target
OPArray(1:Number_Of_Sites)=0;
Ef0=0.0015;


F = @(Ef) abs(sum(1./(1 + exp((EnergyArray - Ef)/(Kb*T)))) - Number_Of_Electrons);

% Define options for lsqnonlin
options = optimoptions('lsqnonlin','MaxIterations',10000,'TolFun',1e-10,'Display','off');

% Use Levenberg-Marquardt algorithm to optimize dE
Ef_Opt = lsqnonlin(F, Ef0,[],[],options);

OPArray = 1./(1 + exp((EnergyArray - Ef_Opt)/(Kb*T)));

end