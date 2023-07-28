function [Current] = KMCCurrent(TotalRight,TotalLeft,ElapsedTime)
%OK
global Number_Of_Sites q

Current= TotalRight-TotalLeft;
end