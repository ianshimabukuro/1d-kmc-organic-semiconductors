
function [OPArray,TotalArray,conv,DriftSum]= KMC1DMR(Energy)

global W Number_Of_Sites Time_Step

%Energy=EnergyArray1D();

[FDD,~] = OPInitializer(Energy);
[W,GammaTot]=TransitionMatrix(Energy);
[Position]=Init1DPosition;
TotalOPSum(1:Number_Of_Sites)=0;
TotalArray=[0,0,0];
currentconv=2;
nt=1;

while currentconv>1.0000000001 || currentconv<0.99999999999
    
    disp(nt);

    TotalOPSum=TotalOPSum+Position;
    OPArray=TotalOPSum/nt;
    Drift=abs(FDD-OPArray);
    DriftSum(nt)=sum(Drift);
  
    [OS] = PositionToCArray(Position);%Get occupied SItes


    for i=length(OS):-1:1 

        CurrentSite=OS(i);
        [TransitionRateL,TransitionRateR] = TransitionRate(CurrentSite,Position);
        TransitionRateS=GammaTot-TransitionRateR-TransitionRateL;
        PA=[TransitionRateS,TransitionRateL,TransitionRateR];
        PA=PA/GammaTot;
        index=ChooseProbability(PA);
        [Position] = Hop(index,Position,CurrentSite);
        TotalArray(index)=TotalArray(index)+1;

    end

    if(nt==1)
        conv(nt)=0;
    else
        conv(nt)=DriftSum(nt)/DriftSum(nt-1);
    end
    
    if(nt==50000)
        break;
    end
    currentconv=conv(nt);




nt=nt+1;

end

end

















































