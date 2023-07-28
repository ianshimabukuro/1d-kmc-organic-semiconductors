global Mean Standard_Deviation Number_Of_Sites Electric_Field Lattice_Constant Kb T Number_Of_Electrons Vo Voltage_Drop IEBarrier CEBarrier q ElectronDensity GammaTot GRate Time_Step

%Physical Constants
q = 1.6e-19; %Unit: C              
Kb = 8.6e-5; %Unit :eV/K
Lattice_Constant = 1.6e-9; %Unit: m           
Vo = 3.3e11; %Unit :s^-1                  

%Energy Distribution Quantities
Mean = 0;
Standard_Deviation = 0.15; 
IEBarrier = 0;
CEBarrier = 0;
Electric_Field = 0;  
GRate=1;
GammaTot=0;
Time_Step=1e-11;


%Device Characteristics            
T = 300; 
Number_Of_Electrons =5;  
Number_Of_Sites = 100;
ElectronDensity = Number_Of_Electrons/Number_Of_Sites;
Voltage_Drop = Electric_Field*(Number_Of_Sites-1)*Lattice_Constant;  
