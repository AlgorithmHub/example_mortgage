% computer mortgage payment and the respective interest paid each month
%
% Inputs
% L: size of the loan
% rate: annual rate
% years: length of loan in years
% 
% Outputs
% P: monthly payment
% In: list of interests paid over the entire loan period
% Ba: Remaining balane over the entire loan period

function [P,In,Ba]=compute_mortgage(L,rate,years)

 

N=years*12;
r=rate/12; % monthly rate

%L*(1+r) = P + P/(1+r) + P/(1+r)^2 + P/(1+r)^3
%  = P (1-(1/1+r)^N)/(1-(1/(1+r))

P= L*(1+r)/((1-(1/(1+r))^N)/(1-1/(1+r)));

Ls(1)=L;
In(1)=0;
Ps(1)=0;
for i=2:N+1;
    In(i)=Ls(i-1)*r;
    Ps(i)=P-In(i);
    Ls(i)=Ls(i-1)-Ps(i);
end

Ba=Ls(2:end);
In=In(2:end);

