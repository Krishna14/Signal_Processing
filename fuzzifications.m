%Fuzzy Controller Simulation

%Our Aim is to keep both the input and output positions equal.This is 
%done by controlling the difference to be 0.

clear all;
clc;
N = 1200;
time = linspace(0,1200,N);  %With this we can measure the time in milliseconds 

%Starting Points for the Motor.
position_x = 0.1;
desired_position = 0;

%Initialize Delta to 0
old_difference = 0;

%Initialize the fuzzy Rules.
difference_rules = [-1 -0.5556 -0.2222 0 0.2222 0.5556 1.0]; %NB NM NS Z PS PM PB
delta_rules = [-1 -0.5556 -0.2222 0 0.2222 0.5556 1.0];
output_rules = [-1 -0.7 -0.4 0 0.4 0.7 1.0];

%Define the Fuzzy Terms
NBig = 1;
NMedium = 2;
NSmall = 3;
Zero = 4;
PSmall = 5;
PMedium = 6;
PBig = 7;

for i=1:length(time)
    %Calculate Control Variables
    difference(i) = (desired_position - position_x);
    delta = difference(i) - old_difference;
    old_difference = difference(i);
    
    %Fuzzify the inputs
    [fdiff_list] = fuzzify(difference(i),difference_rules);
    [fdelta_list] = fuzzify(delta, delta_rules);
    %Send the inputs to the rule base and the inference Engine.
    [output1, output2] = fuzzy_inference(fdiff_list,fdelta_list);
    output = defuzzification_1(output1,output2);      
    position_x = position_x + output;
end;
% length(difference)
% length(time)
plot(time,difference);
title('Control Of Difference to 0');
ylim([-1 1]);

%The following lines of Code can be used to display Membership Functions.
%difference_rules = [-1 -0.5556 -0.2222 0 0.2222 0.5556 1.0];
%x=linspace(-50,50,1000);

% for i=1:length(x)
%     if x(i)>=difference_rules(PBig)
%         pl(i)= 1;
%     else
%         pl(i)=0;
%     end;
%     
%     if x(i)>=difference_rules(PMedium) & x(i)<difference_rules(PBig)
%         pm(i)=1;
%     else 
%         pm(i)=0;
%     end;
%     
%     if x(i)>=difference_rules(PSmall) & x(i)<difference_rules(PMedium)
%         ps(i)=1;
%     else
%         ps(i)=0;
%     end;
%     
%     if x(i)==difference_rules(Zero)
%         z(i)=1;
%     else
%         z(i)=0;
%     end;
%     
%     if x(i)<=difference_rules(NSmall) & x(i)> difference_rules(NMedium)
%         ns(i)=1;
%     else
%         ns(i)=0;
%     end;
%     
%     if x(i)<=difference_rules(NMedium) & x(i)>difference_rules(NBig)
%         nm(i)=1;
%     else
%         nm(i)=0;
%     end;
%     
%     if x(i)<=difference_rules(NBig)
%         nb(i)=1;
%     else
%         nb(i)=0;
%     end;
% end;

%figure(2);
%hold on;
% plot(x,nb,x,nm,x,ns,x,z,x,ps,x,pm,x,pl);
% xlimit(-1,1);
% title('Membership Functions');

    