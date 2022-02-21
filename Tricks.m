%Magnus Sejer Lind
%% Play sound
load gong
sound(y,Fs)

% Or:
% load handel
% sound(y,Fs)

%% Save as PDF
print('Navn', '-dpdf');  

% For LaTex export use:
print('Navn', '-depsc');  

%% Stop script execution shortcut
%'Ctrl+c'

%% Set axis
axis([0 10 -10 10])
xlim([a,b])
ylim([a b])

%% Extract elements from array
x(a:b)
% x being the array, a to be being the index range

%% Polynomial regression
A=polyfit(x,y,1);
% The number represents the type of polynomial
% First array values gives the slope, second given the y-intercept

% Plot the regression graph
y_fit = polyval(A,x);


% Example:
x=(0:2:20);
y=(0:4:40);
plot(x,y)
A=polyfit(x,y,1);
y_fit = polyval(A,x);
hold on
plot(x,y_fit)

%% Subplot
subplot(2,2,1)      
plot(x)
% 2x2 figur, nr. 1

%% Parallel computing
% 'parpool' in command window
% Change for loop to "parfor"

%% Replicate value in array
m = repmat(3,10,1);
% 3 is repeated in 10 rows and one column

%% Clear all but some variables 
clearvars -except x y 
% Clear all variables in workspace except x and y
% To clear a single variable use "clear x"

%% Solve n equations with n unknowns symbolic

syms K_d n_d % unkonwns
Y = vpasolve([Stress_true(1) == K_d*Strain_true(1)^n_d, Stress_true(70) == K_d*Strain_true(70)^n_d], [ K_d,n_d]);

% Values  are extracted and converted to double precision floating point values 
K_d = Y.K_d;
n_d = Y.n_d;
K_d = double(K_d);
n_d = double(n_d);

%% Centering bottom row of subplot

for i=1:6 % (only using five spaces)
    subp(i)=subplot(3,2,i);
end
posn=mean(cell2mat(get(subp(5:6),'position'))); % average position for bottom row
delete(subp(6)); subp(6)=[];                    % delete 10th, clean up handle array
set(subp(5),'position',posn)                    % move 9 to midpoint


%% Meshgrid

[x,y] = meshgrid(0:0.1:10);
% The x having rows using the step till the end of the interval, 
% having the collums remain the same, opposite for the y  

%% Improved tan^-1

atan2(y,x)
%  Instead of atan(y/x)

%% Flip orientation of y-label
% *Only for short labels

ylabel('y')
hYLabel = get(gca,'YLabel');
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

%% LaTex in legend
legend('$sin(x)$','$\frac{d}{dx}sin(x)$','Interpreter','latex');


%% Do not display all values in legend
legend({'A','B'},'AutoUpdate','off')
% Nothing added to the legend after
