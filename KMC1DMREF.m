function [TotalArray,I,Current,Mobility,TS] = KMC1DMREF(Energy,EF)

global W Number_Of_Sites 
format long;
%Energy=EnergyArray1D();
Energy=EFCont(Energy,EF);
[W,GammaTot]=TransitionMatrix(Energy);
TS=1/GammaTot;
[Position]=Init1DPosition;
TotalOPSum(1:Number_Of_Sites)=0;
TotalArray=[0,0,0];
nt=1;
currentconv=2;





while currentconv>1e-40
    
    disp(nt);
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


    ElapsedTime=nt*TS;
    [Current] = KMCCurrent(TotalArray(3),TotalArray(2),ElapsedTime); 
    I(nt)=Current;

    if(nt==1)
        conv(nt)=2;
    else
        conv(nt)=abs(I(nt)-I(nt-1)/I(nt));
    end
    
    currentconv=conv(nt);

    if(nt==100000)
        break;
    end
    nt=nt+1;
end
[Mobility] = KMCMobility(I(nt-1),EF);

end