n=7; 
%A = [-1 -0.6 0.5 -0.2 0 0.2 0.5 0.6 1];
A = [-1.444 -1 -0.5556 -0.2222 0 0.2222 0.5556 1 1.444]; 
%for i=1:1:n+2(output_0, output_rules);(output_0, output_rules);
%    A(i) = (i-1)/(n-1);
%end;
t = 1;
x1 = [-1:0.01:1];    %Two inputs to the system.
x2 = [-1:0.01:1];    
y = [];

for i=1:201
    for j=1:201
        if x1(i)>=x2(j)
            if x1(i)>=A(1) & x1(i)<=A(2)
                h=0;
            elseif x1(i)>=A(2) & x1(i)<=A(3)
                h = -(x1(i)-A(3))/(A(3)-A(2));
            else
                h=0;
            end;
            A1(t) = 0.5*h*(x1(i)-A(2))*(A(3)-A(2));
            C1(t)=(A(1)+A(2)+A(3))/3;%C1(t) = A(2)+A(3)/2;
            
            if x1(i)>=A(2) & x1(i)<=A(3)
                h=(x1(i)-A(2))/(A(3)-A(2));
            elseif x1(i)>=A(3) & x1(i)<=A(4)
                h=-(x1(i)-A(4))/(A(4)-A(3));
            else
                h=0;
            end;
            A2(t) = h*(A(4)-A(2))+(h*h*(A(3)-A(2)));
            C2(t) = (A(2)+A(3)+A(4))/3;%C2(t) = (A(2)+A(4))/2;
            
            if x1(i)>=A(3) & x1(i)<= A(4)
                h=(x1(i)-A(3))/(A(4)-A(3));
            elseif x1(i)>=A(4) & x1(i)<=A(5)
                h= -(x1(i)-A(5))/(A(5)-A(4));
            else
                h=0;
            end;
            
            A3(t)= h*(A(5)-A(3)) + (h*h*(A(4)-A(3))); % Calculate Area and Centroid
            C3(t)=(A(3)+A(4)+A(5))/3;%C3(t)= (A(3) + A(5))/2;    
            
            if x1(i)>=A(4) & x1(i)<=A(5)
                h=(x1(i)-A(4))/(A(5)-A(4));
            elseif x1(i)>=A(5) & x1(i)<=A(6)
                h= -(x1(i)-A(6))/(A(6)-A(5));
            else
                h=0;
                p=0;
            end;
            A4(t)=h*(A(6)-A(4))+(h*h*(A(5)-A(4)));
            C4(t)=(A(4)+A(5)+A(6))/3;%C4(t)=(A(4)+A(6))/2;
                       
            if x1(i)>=A(5) & x1(i)<=A(6)
                h=(x1(i)-A(4))/(A(5)-A(4));
            elseif x1(i)>=A(6) & x1(i)<=A(7)
                h=-(x1(i)-A(7))/(A(7)-A(6));
            else
                h=0;
            end;
            A5(t) = h*(A(7)-A(5)) + (h*h*(A(7)-A(6)));
            C5(t)=(A(5)+A(6)+A(7))/3;%C5(t) = (A(5)+A(7))/2;
            
            if x1(i)>=A(6) & x1(i)<=A(7)
                h=(x1(i)-A(6))/(A(7)-A(6));
            elseif x1(i)>=A(7) & x1(i)<=A(8)
                h=-(x1(i)-A(8))/(A(8)-A(7));
            else
                h=0;
            end;
            A6(t) = h*(A(8)-A(6))+ (h*h*(A(8)-A(7)));
            C6(t)=(A(6)+A(7)+A(8))/3;%C6(t) = (A(8)+A(6))/2;
            
            if x1(i)>=A(7) & x1(i)<=A(8)
                h=(x1(i)-A(7))/(A(8)-A(7));
            elseif x1(i)>=A(8) & x1(i)<=A(9)
                h=0;
            else
                h=0;
            end;
            A7(t) = 0.5*h*(A(8)-x1(i))*(A(8)-A(7));
            C7(t)=(A(7)+A(8)+A(9))/3;%C7(t) = (A(8)+A(7))/2;
            
        elseif x1(i)<x2(j)
            if x2(j)>=A(1) & x2(j)<=A(2)
                h=0;
            elseif x2(j)>=A(2) & x2(j)<=A(3)
                h = -(x2(j)-A(3))/(A(3)-A(2));
            else
                h=0;
            end;
            A1(t) = 0.5*h*(x2(j)-A(2))*(A(3)-A(2));
            C1(t)=(A(1)+A(2)+A(3))/3;% C1(t) = A(2)+A(3)/2;
            
            if x2(j)>=A(2) & x2(j)<=A(3)
                h=(x2(j)-A(2))/(A(3)-A(2));
            elseif x2(j)>=A(3) & x2(j)<=A(4)
                h=-(x2(j)-A(4))/(A(4)-A(3));
            else
                h=0;
            end;
            A2(t) = h*(A(4)-A(2))+(h*h*(A(3)-A(2)));
            C2(t) = (A(2)+A(3)+A(4))/3;%C2(t) = (A(2)+A(4))/2;
            
            if x2(j)>=A(3) & x2(j)<= A(4)
                h=(x2(j)-A(3))/(A(4)-A(3));
            elseif x2(j)>=A(4) & x2(j)<=A(5)
                h= -(x2(j)-A(5))/(A(5)-A(4));
            else
                h=0;
            end;
            
            A3(t)= h*(A(5)-A(3)) + (h*h*(A(4)-A(3))); % Calculate Area and Centroid
            C3(t)=(A(3)+A(4)+A(5))/3;%C3(t)= (A(3) + A(5))/2;    
            
            if x2(j)>=A(4) & x2(j)<=A(5)
                h=(x2(j)-A(4))/(A(5)-A(4));
            elseif x2(j)>=A(5) & x2(j)<=A(6)
                h= -(x2(j)-A(6))/(A(6)-A(5));
            else
                h=0;
                p=0;
            end;
            A4(t)=h*(A(6)-A(4))+(h*h*(A(5)-A(4)));
            C4(t)=(A(4)+A(5)+A(6))/3;%C4(t)=(A(4)+A(6))/2;
                       
            if x2(j)>=A(5) & x2(j)<=A(6)
                h=(x2(j)-A(4))/(A(5)-A(4));
            elseif x2(j)>=A(6) & x2(j)<=A(7)
                h=-(x2(j)-A(7))/(A(7)-A(6));
            else
                h=0;
            end;
            A5(t) = h*(A(7)-A(5)) + (h*h*(A(7)-A(6)));
            C5(t)=(A(5)+A(6)+A(7))/3;%C5(t) = (A(5)+A(7))/2;
            
            if x2(j)>=A(6) & x2(j)<=A(7)
                h=(x2(j)-A(6))/(A(7)-A(6));
            elseif x2(j)>=A(7) & x2(j)<=A(8)
                h=-(x2(j)-A(8))/(A(8)-A(7));
            else
                h=0;
            end;
            A6(t) = h*(A(8)-A(6))+ (h*h*(A(8)-A(7)));
            C6(t)=(A(6)+A(7)+A(8))/3;%C6(t) = (A(8)+A(6))/2;
            
            if x2(j)>=A(7) & x2(j)<=A(8)
                h=(x2(j)-A(7))/(A(8)-A(7));
            elseif x2(j)>=A(8) & x2(j)<=A(9)
                h=0;
            else
                h=0;
            end;
            A7(t) = 0.5*h*(A(8)-x2(j))*(A(8)-A(7));
            C7(t)=(A(7)+A(8)+A(9))/3;%C7(t) = (A(8)+A(7))/2;
                      
        end;

        y(i,j)=5*(((A1(t)*C1(t))+ (A2(t)*C2(t))+ (A3(t)*C3(t))+ (A4(t)*C4(t))+ (A5(t)*C5(t)) + (A6(t)*C6(t)) + (A7(t)*C7(t)))/(A1(t)+ A2(t)+ A3(t)+ A4(t)+ A5(t)+ A6(t)+ A7(t)));      %Moments Method for Defuzzification
        t=t+1;
    end;
end;
mesh(x1,x2,y);
hold on;

               
            
            
              
                

                