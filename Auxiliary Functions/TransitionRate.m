function [TransitionRateL,TransitionRateR] = TransitionRate(CurrentSite,Position)
global W

[CurrentSiteL,CurrentSiteR] = NeighboringSites(CurrentSite);
TransitionRateL=W(CurrentSite,CurrentSiteL);
TransitionRateR=W(CurrentSite,CurrentSiteR);

if(Position(CurrentSiteL)==1)
    TransitionRateL=0;
end
if(Position(CurrentSiteR)==1)
    TransitionRateR=0;
end

end