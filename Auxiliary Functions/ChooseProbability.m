function [index] = ChooseProbability(ProbabilityArray)
        
        if(sum(ProbabilityArray)>1)
            %disp("Sum of Probability Equal to: "+sum(ProbabilityArray));
        end
        cp =[0,cumsum(ProbabilityArray)];
        r = rand;
        index = find(r>cp, 1, 'last');

end