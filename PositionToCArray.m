function [OS] = PositionToCArray(Position)

j=1;
for i=1:length(Position)

   if(Position(i)==1)
       OS(j)=i;
       j=j+1;
   end

end