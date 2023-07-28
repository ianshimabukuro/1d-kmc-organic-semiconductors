%Verified 2/06
function [CurrentSiteL,CurrentSiteR] = NeighboringSites(CurrentSite)

global Number_Of_Sites
        
        if(CurrentSite==Number_Of_Sites)
            CurrentSiteL=CurrentSite-1;
            CurrentSiteR=1;
        elseif(CurrentSite==1)
            CurrentSiteL=Number_Of_Sites;
            CurrentSiteR=CurrentSite+1;
        else
            CurrentSiteL=CurrentSite-1;
            CurrentSiteR=CurrentSite+1;
        end


end