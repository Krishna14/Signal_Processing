%Fuzzy is a list of two Membership Functions and two membership degree
%values corresponding to those inputs.
function [fuzzified] = fuzzify(data, rules)
   %Define Linguistics
   NBig = 1;
   NMedium = 2;
   NSmall = 3;
   Zero = 4;
   PSmall = 5;
   PMedium = 6;
   PBig = 7;
   
   fuzzy_1 = zeros(1,2);
   fuzzy_2 = zeros(1,2);
   %centroid_1 = 0;
   %centroid_2 = 0;
   %area_1 = 0;
   %area_2 = 0;
   
   if data>=rules(1) & data<=rules(2)
       fuzzy_1(1) = -(data-rules(2))/(rules(2)-rules(1));
       %area_2 = 0.5*fuzzy_1(1)*(data-rules(1))*(rules(2)-rules(1));
       %centroid_2 = (rules(1)+rules(2))/2;
       fuzzy_1(2) = NBig;
   else
       
   end;
       
   if data>=rules(1) & data<=rules(2)
       fuzzy_2(1) = (data-rules(1))/(rules(2)-rules(1));
       %area_1 = fuzzy_2(1)*(rules(3)-rules(1))+(fuzzy_2(1)*fuzzy_2(1)*(rules(2)-rules(1)));
       %centroid_1 = (rules(1)+rules(2)+rules(3))/3;
       fuzzy_2(2) = NMedium;
   elseif data>=rules(2) & data<=rules(3)
       fuzzy_1(1) = -(data-rules(3))/(rules(3)-rules(2));
       %area_2 = fuzzy_1(1)*(rules(3)-rules(1))+(fuzzy_1(1)*fuzzy_1(1)*(rules(2)-rules(1)));
       %centroid_2 = (rules(1)+rules(2)+rules(3))/3;
       fuzzy_1(2) = NMedium;
   else
       
   end;
   
   if data>=rules(2) & data<=rules(3)   
       fuzzy_2(1) = (data-rules(2))/(rules(3)-rules(2));
       %area_1 = fuzzy_2(1)*(rules(4)-rules(2)) + (fuzzy_2(1)*fuzzy_2(1)*(rules(4)-rules(3)));
       %centroid_1 = (rules(2)+rules(3)+rules(4))/3;
       fuzzy_2(2) = NSmall;
   elseif data>=rules(3) & data<=rules(4)
       fuzzy_1(1) = -(data-rules(4))/(rules(4)-rules(3));
       %area_2 = fuzzy_1(1)*(rules(4)-rules(2)) + (fuzzy_1(1)*fuzzy_1(1)*(rules(4)-rules(3)));
       %centroid_2 = (rules(2)+rules(3)+rules(4))/3;
       fuzzy_1(2) = NSmall;
   else
       
   end;
   
   if data>=rules(3) & data<=rules(4)
       fuzzy_2(1) = (data-rules(3))/(rules(4)-rules(3));
       %area_1 = fuzzy_2(1)*(rules(5)-rules(3)) + (fuzzy_2(1)*fuzzy_2(1)*(rules(5)-rules(4)));
       %centroid_1 = (rules(3)+rules(4)+rules(5))/3;
       fuzzy_2(2) = Zero;
   elseif data>=rules(4) & data<=rules(5)
       fuzzy_1(1) = -(data-rules(5))/(rules(5)-rules(4));
       %area_2 = fuzzy_1(1)*(rules(5)-rules(3)) + (fuzzy_1(1)*fuzzy_1(1)*(rules(5)-rules(4)));
       %centroid_2 = (rules(3)+rules(4)+rules(5))/3;
       fuzzy_1(2) = Zero;
   else
       
   end;
   
   if data>=rules(4) & data<=rules(5)
       fuzzy_2(1) = (data-rules(4))/(rules(5)-rules(4));
       %area_1 = fuzzy_2(1)*(rules(6)-rules(4)) + (fuzzy_2(1)*fuzzy_2(1)*(rules(6)-rules(5)));
       %centroid_1 = (rules(4)+rules(5)+rules(6))/3;
       fuzzy_2(2) = PSmall;
   elseif data>=rules(5) & data<=rules(6)
       fuzzy_1(1) = -(data-rules(6))/(rules(6)-rules(5));
       %area_2 = fuzzy_1(1)*(rules(6)-rules(4))+(fuzzy_1(1)*fuzzy_1(1)*(rules(6)-rules(5)));
       %centroid_2 = (rules(4)+rules(5)+rules(6))/3;
       fuzzy_1(2) = PSmall;
   else
       
   end;
   
   if data>=rules(5) & data<=rules(6)
       fuzzy_2(1) = (data-rules(5))/(rules(6)-rules(5));
       %area_1 = fuzzy_2(1)*(rules(6)-rules(4)) + (fuzzy_2(1)*fuzzy_2(1)*(rules(6)-rules(5)));
       %centroid_1 = (rules(5)+rules(6)+rules(7))/3;
       fuzzy_2(2) = PMedium;
   elseif data>=rules(6) & data<=rules(7)
       fuzzy_1(1) = -(data-rules(7))/(rules(7)-rules(6));
       %area_2 = fuzzy_1(1)*(rules(6)-rules(4)) + (fuzzy_1(1)*fuzzy_1(1)*(rules(6)-rules(5)));
       %centroid_2 = (rules(5)+rules(6)+rules(7))/3;
       fuzzy_1(2) = PMedium;
   else
       
   end;
   
   if data>=rules(6) & data<=rules(7)
       fuzzy_2(1) = (data-rules(6))/(rules(7)-rules(6));
       %area_1 = 0.5*fuzzy_2(1)*(data-rules(6))*(rules(7)-rules(6));
       %centroid_1 = (rules(6)+rules(7))/2;
       fuzzy_2(2) = PBig;
   else
       
   end;
   
   fuzzified = [fuzzy_1 fuzzy_2];
   %area = %area_1+%area_2;
   %centroid = (%centroid_1 + %centroid_2)/2;
   
end


   