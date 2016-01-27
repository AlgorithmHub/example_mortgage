
function [id id2 id3] = mortgage_plot(years, annual_rate, house_value, downpayment, years_in, new_years, new_annual_rate)

%years=20;
%annual_rate=0.04; % 4% annual rate
%house_value=150000;
%downpayment=0.25; % 25% down

loan_size=house_value*(1-downpayment);
[P,In,Ba]=compute_mortgage(loan_size,annual_rate,years);

% close all

totInt = sprintf('Old Monthly Payment: $%1.2f \nTotal Interest Paid: $%1.2f\n',P,sum(In));

fig = figure;
Ps=P-In;

PsCum = cumsum(Ps);
InCum = cumsum(In);

plot((1:length(Ps))/12,PsCum,(1:length(In))/12,InCum);
grid on;
title(totInt);
xlabel('Year');
ylabel('Total Paid');
legend('Principal Paid','Interest Paid');
id = wshow(fig);


months_in = years_in*12;

PsCumOld = PsCum(1:months_in);
InCumOld = InCum(1:months_in);

InRe = sum(In) - InCum(months_in);
new_loan_size = loan_size - PsCum(months_in);

[P,In,Ba]=compute_mortgage(new_loan_size,new_annual_rate,new_years);

totInt = sprintf('New Monthly Payment: $%1.2f \nTotal Interest Paid: $%1.2f\nInterest Saved: $%1.2f',P,sum(In),InRe-sum(In));

fig = figure;
Ps=P-In;

PsCum = cumsum(Ps);
InCum = cumsum(In);

plot((1:length(Ps))/12,PsCum,(1:length(In))/12,InCum);
grid on;
title(totInt);
xlabel('Year');
ylabel('Total Paid');
legend('Principal Paid','Interest Paid');
id2 = wshow(fig);



totInt = sprintf('Old and New Loan:\nTotal Interest Paid: $%1.2f',InCum(end)+InCumOld(end));

fig = figure;

PsCum = [PsCumOld PsCum+PsCumOld(end)];
InCum = [InCumOld InCum+InCumOld(end)];

length(PsCum)

plot((1:length(PsCum))/12,PsCum,(1:length(InCum))/12,InCum);
grid on;
title(totInt);
xlabel('Year');
ylabel('Total Paid');
legend('Principal Paid','Interest Paid');
id3 = wshow(fig);

