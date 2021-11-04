%% Hyperparameter

c = 3*10^8;

%% centre frequency

f_c = 2.4*10^9;
lambda_0 = c/f_c;

%% choose one of the scenarios

% scene = 'A1';
% h_BS = 1+rand()*1.5;
% h_MS = 2.5;

scene = 'B1'; 
cellLayout = 'Hex';
h_BS = 10;
h_MS = 1.5;


%% number of BS and MS

n_BS = 1;                           %% P2P로 진행하고 최종으로 n_BS*n_MS 반복하여 실행하는 방식으로 사용한다.
n_MS = 1;                           

%% location of BS and MS (or relative direction)

x_max = 100;
y_max = 100;
% x_BS = x_max*rand();
% y_BS = y_max*rand();
% x_MS = x_max*rand();
% y_MS = y_max*rand();
x_BS = 0;
y_BS = 0;
x_MS = 100;
y_MS = 0;

if x_BS > x_MS
    phi_LOS = -90-atand((y_BS-y_MS)/(x_BS-x_MS));
    varphi_LOS = 90-atand((y_BS-y_MS)/(x_BS-x_MS));
else
    phi_LOS = 90-atand((y_BS-y_MS)/(x_BS-x_MS));
    varphi_LOS = -90-atand((y_BS-y_MS)/(x_BS-x_MS));
end

%% array geometry

n_tx = 4;               %% number of tx antenna
n_rx = 4;               %% number of rx antenna
% G_tx = zeros(n_tx,3);   %% tx array geometry
% G_rx = zeros(n_rx,3);   %% rx array geometry
d_s = c/f_c/2;
d_u = c/f_c/2;

%% antenna field pattern

F_rx_V = ones(361,n_rx);    %% -180~180
F_rx_H = ones(361,n_rx);
F_tx_V = ones(361,n_tx);
F_tx_H = ones(361,n_tx);

%% array orientation

omega_BS = 360*rand()-180;              %% 서로 마주보는 방향
omega_MS = 360*rand()-180;

%% speed and direction of motion

v_MS = ones(n_MS,2);
