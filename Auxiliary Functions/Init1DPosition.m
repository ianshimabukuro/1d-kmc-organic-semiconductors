%Checked>> 2/06

function [Pos1D] = Init1DPosition()

global Number_Of_Sites Number_Of_Electrons
%--------------Initialize Arrays---------------------%

Pos1D(1:Number_Of_Sites)=0;
p = randperm(Number_Of_Sites,Number_Of_Electrons);

for i=1:Number_Of_Electrons
    
    Pos1D(p(i))=1;

end

end






