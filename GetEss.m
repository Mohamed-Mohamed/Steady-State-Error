function [ ess ] = GetEss ( tf1 )
%% Coded by
% Mohamed Mohamed El-Sayed Atyya
% mohamed.atyya94@eng-st.cu.edu.eg
%%  Function Objective
% This function is used to get the steady state error of the system
%% input
% tf1      : The system transfer function
%% outputs
% ess     : steady state value
%% function body
n=length(tf1.den{1});
in=0;
while tf1.den{1}(n) == 0
        in=in+1;
        n=n-1;
end
if in > 0
        G=tf([1 zeros(1,in)],[1])*tf1;
        ess=1/dcgain(G);
else
        ess=1/(dcgain(tf1)+1);
end
display(['e_s_s = ' num2str(ess) ' ; for input of order t^' num2str(in) ' ,']);
display(['e_s_s = 0 ; for input of order less than t^' num2str(in) ' ,']);
display(['e_s_s = infinity ; for input of order greater than t^' num2str(in) ]);
end