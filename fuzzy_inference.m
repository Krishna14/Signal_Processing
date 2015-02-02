%Follow the six steps to get the output for the Fuzzy Logic Controller
% 1. Determine a set of Fuzzy Rules
%In this case we will use If X "and" Y "then" Z, where and denotes
%min(ua(x), ub(x))
function [membership_degree, xlim] = fuzzy_inference(error,change_error)
    %Output Mapping using the Table Stored in Memory
     load 'rule_base.mat';
     output_tags = [];
     output_rules = [-1 -0.7 -0.4 0 0.4 0.7 1];
     error_tags = [error(2),error(4)]
     change_error_tags = [change_error(2), change_error(4)]
     for i = 1:length(error_tags)
         for j=1:length(change_error_tags)
             output_tags = [output_tags rule_base(error_tags(i),change_error_tags(j))];
         end
     end
     output_tags
     %Now comes the tricky part. Here we have to find the aggregated output
     %of the points denoted by the implication and aggregation function.
     x=-1:0.01:1;
     if output_tags(1)==1
         a = output_rules(output_tags(1));
         b = output_rules(output_tags(1));
         c = output_rules((output_tags(1)+1));
         mf1 = trimf(x,[a b c]);
     elseif output_tags(1) == 7
         a = output_rules(output_tags(1)-1);
         b = output_rules(output_tags(1));
         c = output_rules(output_tags(1));
         mf1 = trimf(x,[a b c]);
      else
         a = output_rules(output_tags(1)-1);
         b = output_rules(output_tags(1));
         c = output_rules((output_tags(1)+1));
         mf1 = trimf(x,[a b c]);
      end;
%      
      if output_tags(2) == 1
          a = output_rules(output_tags(2));
          b = output_rules(output_tags(2));
          c = output_rules((output_tags(2)+1));
          mf2 = trimf(x,[a b c]);
     elseif output_tags(2) == 7 
            a = output_rules(output_tags(2)-1);
            b = output_rules(output_tags(2));
            c = output_rules(output_tags(2));
            mf2 = trimf(x,[a b c]);
      else
          a = output_rules(output_tags(2)-1);
          b = output_rules(output_tags(2));
          c = output_rules((output_tags(2)+1));
          mf2 = trimf(x,[a b c]);
      end;
     
     if output_tags(3)==1
         a = output_rules(output_tags(3));
         b = output_rules(output_tags(3));
    	 c = output_rules((output_tags(3)+1));
         mf3 = trimf(x,[a b c]);
     elseif output_tags(3)==7
         a = output_rules(output_tags(3)-1);
         b = output_rules(output_tags(3));
    	 c = output_rules(output_tags(3));
         mf3 = trimf(x,[a b c]);
     else
         a = output_rules(output_tags(3)-1);
         b = output_rules(output_tags(3));
    	 c = output_rules(output_tags(3)+1);
         mf3 = trimf(x,[a b c]);
     end;
     
     if output_tags(4)==1
         a = output_rules(output_tags(4));
         b = output_rules(output_tags(4));
         c = output_rules((output_tags(4)+1));
         mf4 = trimf(x,[a b c]);
     elseif output_tags(4)==7 
         a = output_rules(output_tags(4)-1);
         b = output_rules(output_tags(4));
         c = output_rules(output_tags(4));
         mf4 = trimf(x,[a b c]);
     else
         a = output_rules(output_tags(4)-1);
         b = output_rules(output_tags(4));
    	 c = output_rules(output_tags(4)+1);
         mf4 = trimf(x,[a b c]);
      end;
     
     
     %output = output_tags;
     k1 = min(error(1),change_error(1));
     k2 = min(error(1),change_error(3));
     k3 = min(error(3),change_error(1));
     k4 = min(error(3),change_error(3));
     
     l1 = min(k1,mf1);
     l2 = min(k2,mf2);
     l3 = min(k3,mf3);
     l4 = min(k4,mf4);
     
      aggregate_output = max(max(l1,l2),max(l3,l4));
      plot(x,aggregate_output);
      ylim([0 1]);
      hold on;
      xlim = x;
      membership_degree = aggregate_output;
      %area = polyarea(x,aggregate_output)
      %output_area = area;
      %centroid = (output_rules(min(output_tags))+output_rules(max(output_tags)))/2;
      %output_centroid = centroid;
%       actual_output = max(aggregate_output);
%       output_array = [];
%       for i =1:201
%           if aggregate_output(i)==actual_output
%               output_array = [output_array x(i)];
%           end;
%       end;
%       output = mean(output_array);
end

        
