% A Matlab implementaion of PASAD (Process-Aware Stealthy-Attack
% Detection), which is a real-time intrusion detection system for control
% systems. The file contains three code sections to be executed separately
% in the order given. The sections correspond to the training phase,
% detecton phase, and a plot of the result respectively.

% A test case:
%   D = csvread('xmv9_hundred_data_1.csv',0,0);
%   S = D(:,5);
%   Enter time series: S
%   Enter parameters: length of training subseries and the lag ([N,L]):
%   [2200 1100]
%   Specify the statistical dimension: 16

%% Training Phase
% Obtaining a mathematical representation of the process behavior by
% determining the statistical dimension and the principal components of the
% signal subspace.

s = input('Enter time series: ');
I = input(...
'Enter parameters: length of training subseries and the lag ([N,L]): ');
N = I(1); L = I(2);
T = length(s);
K = N-L+1;

% Defining custom colors
bk = [.24 .24 .36]; 
rd = [1 .5 .5]; 
gr = [.8 1 .1]; 
bl = [.7 .85 1]; 

% Range vector corresponding to the sensor measurements affected by the
% attack (Should be adapted according to the entered time series. Defaulted
% to TE non-hf series).
atck_rg = (4000:T);

% Constructing the (Hankel) trajectory matrix and solving its Singular
% Value Decomposition (SVD).
X = hankel(s(1:L),s(L:N));
disp('SVD decomposition started ...');tic
[t,e,~] = svd(X); 
ev = diag(e);
disp('SVD decomposition complete');toc

% Determining the statistical dimension of the time series.
es = (ev(2:end)./sum(ev(2:end)))*100;
figure
plot(es,'color',[.4 .4 .4],'linewidth',2),hold on,
plot(es,'rx','color',[1 .4 .2]);
xlabel('Number of eigenvalues');
ylabel('Eigenvalue share')
title('Scree plot');
set(gca,'fontsize',16);
r = input('Specify the statistical dimension: ');
close gcf
disp('Training PASAD is complete.');

% Constructing the matrix whose columns form an orthonormal basis for the
% signal subspace.
U = t(:,(1:r));

% Computing the centroid of the cluster formed by the training lagged
% vectors in the signal subspace.
c = mean(X,2);
utc = U'*c;

% A vector containing the normalization weights for computing the squared
% weighted Euclidean distance in the detection phase.
nev = sqrt(ev(1:r)./sum(ev(1:r)));

% Reconstring the approximate signal using the diagonal averaging step in
% Singular Spectrum Analysis (SSA).
disp('Reconstructing signal ...');tic
ss = U*(U'*X);

sig = zeros(N,1);  

for k = 0:L-2
    for m = 1:k+1
        sig(k+1) = sig(k+1)+(1/(k+1))*ss(m,k-m+2);
    end
end

for k = L-1:K-1
    for m = 1:L
        sig(k+1) = sig(k+1)+(1/(L))*ss(m,k-m+2);
    end
end

for k = K:N
    for m = k-K+2:N-K+1
        sig(k+1) = sig(k+1)+(1/(N-k))*ss(m,k-m+2);
    end
end
disp('Signal reconstruction complete');toc

%% Detection Phase
% Tracking the distance from the centroid by iteratively computing the
% departure score for every test vector.

disp('Testing started...');tic
d = zeros(T-N,1);

% Constructing the first test vector.
x = s(N-L+1:N);

    for i = N+1:T
        % Constructing the current test vector by shifting the elements to
        % the left and appending the current sensor value to the end.
        x = x([2:end 1]);
        x(L) = s(i);  
        
        % Computing the difference vector between the centroid of the
        % cluster and the projected version of the current test vector.
        y = utc - U'*x;
        
        % Computing the weighted norm of the difference vector.
        y = nev.*y;
        d(i-N) = y'*y;
    end
    
disp('Testing complete.');toc

%% Plof of the result

figure
ax1 = subplot(2,1,1);hold on
plot(s,'color',bk);
plot(s(1:N),'color',bl,'linewidth',1);
plot(sig,'color',gr,'linewidth',1);
plot(atck_rg,s(atck_rg),'color',rd);
ylabel('Sensor Meas.');
set(gca,'fontsize',16,'fontweight','bold','linewidth',1.5);

ax2 = subplot(2,1,2);hold on 
plot((N+1:T),d,'color','b','linewidth',2);
xlabel('Observation Index');
ylabel('Departure Score');
set(gca,'fontsize',16,'fontweight','bold','linewidth',1.5);

linkaxes([ax1,ax2],'x');
