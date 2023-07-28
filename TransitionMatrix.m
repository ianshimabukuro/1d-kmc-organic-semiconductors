%Verified!

%Verified 2/06
function [Transition_Matrix,GammaTot] = TransitionMatrix(EnergyArray)

global Number_Of_Sites Vo Kb T BoundaryED GRate
Transition_Matrix=zeros(Number_Of_Sites);



for i=1:Number_Of_Sites
    for j=1:Number_Of_Sites
        if(i==j || abs(i-j)~=1)
            Transition_Matrix(i,j)=0;
        else 
            if(EnergyArray(j)>EnergyArray(i)) 
                Transition_Matrix(i,j)=Vo*exp(-1)*exp(-(EnergyArray(j)-EnergyArray(i))/(Kb*T));
            elseif(EnergyArray(i)>=EnergyArray(j))
                Transition_Matrix(i,j)=Vo*exp(-1);
            else
                error("There is a error in function Transition Rate, comparison of energies")
            end

        end


    end
end



if(EnergyArray(Number_Of_Sites)>EnergyArray(1))
        Transition_Matrix(1,Number_Of_Sites)=Vo*exp(-1)*exp((-BoundaryED)/(Kb*T));
        Transition_Matrix(Number_Of_Sites,1)=Vo*exp(-1);
elseif(EnergyArray(Number_Of_Sites)<EnergyArray(1))
        Transition_Matrix(1,Number_Of_Sites)=Vo*exp(-1);
        Transition_Matrix(Number_Of_Sites,1)=Vo*exp(-1)*exp((BoundaryED)/(Kb*T));
end


for a=1:Number_Of_Sites
    sumRow(a)=sum(Transition_Matrix(a,:));
end

GammaMax=max(sumRow);
GammaTot=GRate*GammaMax;










