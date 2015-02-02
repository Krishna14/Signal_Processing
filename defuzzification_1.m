%This Function implements the Defuzzification of defuzzy Sets to produce
%Crisp Values.
function [defuzzified] = defuzzification_1(membership_degree,xlim)
    len = length(xlim);
    sum = 0;
    sum_membership = 0;
    for i=1:len
        sum = sum + xlim(i).*membership_degree(i);
        sum_membership = sum_membership + membership_degree(i);
    end;
    defuzzified = sum./sum_membership;   
end


    