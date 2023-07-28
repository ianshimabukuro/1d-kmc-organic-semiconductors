function [Energy] = EFCont(SiteEnergy,Electric_Field)
global Lattice_Constant Number_Of_Sites

for i=1:Number_Of_Sites
      Energy(i)=SiteEnergy(i)-(i-1)*Lattice_Constant*Electric_Field;
end

end