function [Position] = Hop(index,Position,CurrentSite)
[CurrentSiteL,CurrentSiteR] = NeighboringSites(CurrentSite);
if(index==1)

elseif(index==2)
    Position(CurrentSite)=0;
    Position(CurrentSiteL)=1;

elseif(index==3)
    Position(CurrentSite)=0;
    Position(CurrentSiteR)=1;

else
    error("Index is mroe than 3")
end

end