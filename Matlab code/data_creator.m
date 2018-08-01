% Experiment data creator

% MATLAB, Tested with MATLAB R2015a.
% Requires Simulink

% This script creates data from controller and sensor-level inputs in a single
% vector and stores it. It uses the DVCP-TE model found in: 
% https://github.com/satejnik/DVCP-TE

clearvars;


% Add all files to the path
run('start.m')
run('model/initModel.m')
load_system('sim/TEModel_random');

% Run TE


%% Equipment damage attacks

fprintf('Starting damage attacks.\n');

for ii=1:10,
    rmatks;
    reset_disturb;
    set_xmv_ctrl_param(10, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmv_ctrl_param(10, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmv_ctrl_param(10, ControllerProperties.VALUE.Value, 0);
    set_xmv_ctrl_param(10, ControllerProperties.START.Value, 400000);
    set_xmv_ctrl_param(10, ControllerProperties.DURATION.Value, 1);
    setRandSeed(rand);
    sim('sim/TEModel_random');
    csvwrite(['~/equipment_attacks/xmv10_zero/xmv10_zero_data_' num2str(ii) '.csv'],simout)
    csvwrite(['~/equipment_attacks/xmv10_zero/xmv10_zero_data_' num2str(ii) '_hf.csv'],simout_hf)
    fprintf('xmv10_zero no.: %d .\n',ii);
    close all
end

for ii=1:10,
    rmatks;
    reset_disturb;
    set_xmv_ctrl_param(10, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmv_ctrl_param(10, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmv_ctrl_param(10, ControllerProperties.VALUE.Value, 35.9);
    set_xmv_ctrl_param(10, ControllerProperties.START.Value, 400000);
    set_xmv_ctrl_param(10, ControllerProperties.DURATION.Value, 1);
    setRandSeed(rand);
    sim('sim/TEModel_random');
    csvwrite(['~/equipment_attacks/xmv10_359/xmv10_359_data_' num2str(ii) '.csv'],simout)
    csvwrite(['~/equipment_attacks/xmv10_359/xmv10_359_data_' num2str(ii) '_hf.csv'],simout_hf)
    fprintf('xmv10_359 no.: %d .\n',ii);
    close all
end

for ii=1:10,
    rmatks;
    reset_disturb;
    set_xmeas_ctrl_param(7, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmeas_ctrl_param(7, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmeas_ctrl_param(7, ControllerProperties.VALUE.Value, 0);
    set_xmeas_ctrl_param(7, ControllerProperties.START.Value, 400000);
    set_xmeas_ctrl_param(7, ControllerProperties.DURATION.Value, 1);
    setRandSeed(rand);
    sim('sim/TEModel_random');
    csvwrite(['~/equipment_attacks/xmeas7_zero/xmeas7_zero_data_' num2str(ii) '.csv'],simout)
    csvwrite(['~/equipment_attacks/xmeas7_zero/xmeas7_zero_data_' num2str(ii) '_hf.csv'],simout_hf)
    fprintf('xmeas7_zero no.: %d .\n',ii);
    close all
end

for ii=1:10,
    rmatks;
    reset_disturb;
    set_xmeas_ctrl_param(7, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmeas_ctrl_param(7, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmeas_ctrl_param(7, ControllerProperties.VALUE.Value, 2797);
    set_xmeas_ctrl_param(7, ControllerProperties.START.Value, 400000);
    set_xmeas_ctrl_param(7, ControllerProperties.DURATION.Value, 1);
    setRandSeed(rand);
    sim('sim/TEModel_random');
    csvwrite(['~/equipment_attacks/xmeas7_2797/xmeas7_2797_data_' num2str(ii) '.csv'],simout)
    csvwrite(['~/equipment_attacks/xmeas7_2797/xmeas7_2797_data_' num2str(ii) '_hf.csv'],simout_hf)
    fprintf('xmeas7_2797 no.: %d .\n',ii);
    close all
end

%% Economic attacks

fprintf('Starting economic attacks.\n');

for ii=1:10,
    rmatks;
    reset_disturb;
    set_xmv_ctrl_param(9, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmv_ctrl_param(9, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmv_ctrl_param(9, ControllerProperties.VALUE.Value, 100);
    set_xmv_ctrl_param(9, ControllerProperties.START.Value, 400000);
    set_xmv_ctrl_param(9, ControllerProperties.DURATION.Value, 1);
    setRandSeed(rand);
    sim('sim/TEModel_random');
    
    csvwrite(['~/economic_attacks/xmv9_hundred/xmv9_hundred_data_' num2str(ii) '.csv'],simout)
    csvwrite(['~/economic_attacks/xmv9_hundred/xmv9_hundred_data_' num2str(ii) '_hf.csv'],simout_hf)
    csvwrite(['~/economic_attacks/xmv9_hundred/xmv9_hundred_operating_costs_' num2str(ii) '.csv'],OpCost)
    fprintf('xmv9_hundred no.: %d .\n',ii);
    close all
end

for ii=1:10,
    rmatks;
    reset_disturb;
    set_xmv_ctrl_param(9, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmv_ctrl_param(9, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmv_ctrl_param(9, ControllerProperties.VALUE.Value, 40);
    set_xmv_ctrl_param(9, ControllerProperties.START.Value, 400000);
    set_xmv_ctrl_param(9, ControllerProperties.DURATION.Value, 1);
    setRandSeed(rand);
    sim('sim/TEModel_random');
    
    csvwrite(['~/economic_attacks/xmv9_forty/xmv9_forty_data_' num2str(ii) '.csv'],simout)
    csvwrite(['~/economic_attacks/xmv9_forty/xmv9_forty_data_' num2str(ii) '_hf.csv'],simout_hf)
    csvwrite(['~/economic_attacks/xmv9_forty/xmv9_forty_operating_costs_' num2str(ii) '.csv'],OpCost)
    fprintf('xmv9_forty no.: %d .\n',ii);
    close all
end

for ii=1:10,
    rmatks;
    reset_disturb;
    set_xmv_ctrl_param(6, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmv_ctrl_param(6, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmv_ctrl_param(6, ControllerProperties.VALUE.Value, 28);
    set_xmv_ctrl_param(6, ControllerProperties.START.Value, 400000);
    set_xmv_ctrl_param(6, ControllerProperties.DURATION.Value, 1);
    setRandSeed(rand);
    sim('sim/TEModel_random');
    
    csvwrite(['~/economic_attacks/xmv6_twentyeight/xmv6_twentyeight_data_' num2str(ii) '.csv'],simout)
    csvwrite(['~/economic_attacks/xmv6_twentyeight/xmv6_twentyeight_data_' num2str(ii) '_hf.csv'],simout_hf)
    csvwrite(['~/economic_attacks/xmv6_twentyeight/xmv6_twentyeight_operating_costs_' num2str(ii) '.csv'],OpCost)
    fprintf('xmv6_twentyeight no.: %d .\n',ii);
    close all
end

for ii=1:10,
    rmatks;
    reset_disturb;
    set_xmv_ctrl_param(6, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmv_ctrl_param(6, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmv_ctrl_param(6, ControllerProperties.VALUE.Value, 27);
    set_xmv_ctrl_param(6, ControllerProperties.START.Value, 400000);
    set_xmv_ctrl_param(6, ControllerProperties.DURATION.Value, 1);
    
    set_xmv_ctrl_param(9, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmv_ctrl_param(9, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmv_ctrl_param(9, ControllerProperties.VALUE.Value, 20);
    set_xmv_ctrl_param(9, ControllerProperties.START.Value, 400000);
    set_xmv_ctrl_param(9, ControllerProperties.DURATION.Value, 1);
    setRandSeed(rand);
    sim('sim/TEModel_random');
    
    csvwrite(['~/economic_attacks/xmv6_twentyseven_xmv9_twenty/xmv6_twentyseven_xmv9_twenty_data_' num2str(ii) '.csv'],simout)
    csvwrite(['~/economic_attacks/xmv6_twentyseven_xmv9_twenty/xmv6_twentyseven_xmv9_twenty_data_' num2str(ii) '_hf.csv'],simout_hf)
    csvwrite(['~/economic_attacks/xmv6_twentyseven_xmv9_twenty/xmv6_twentyseven_xmv9_twenty_operating_costs_' num2str(ii) '.csv'],OpCost)
    fprintf('xmv6_twentyseven_xmv9_twenty no.: %d .\n',ii);
    close all
end

for ii=1:10,
    rmatks;
    reset_disturb;
    set_xmeas_ctrl_param(10, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmeas_ctrl_param(10, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmeas_ctrl_param(10, ControllerProperties.VALUE.Value, 0);
    set_xmeas_ctrl_param(10, ControllerProperties.START.Value, 400000);
    set_xmeas_ctrl_param(10, ControllerProperties.DURATION.Value, 1);
    
    setRandSeed(rand);
    sim('sim/TEModel_random');
    
    csvwrite(['~/economic_attacks/xmeas10_zero/xmeas10_zero_data_' num2str(ii) '.csv'],simout)
    csvwrite(['~/economic_attacks/xmeas10_zero/xmeas10_zero_data_' num2str(ii) '_hf.csv'],simout_hf)
    csvwrite(['~/economic_attacks/xmeas10_zero/xmeas10_zero_operating_costs_' num2str(ii) '.csv'],OpCost)
    fprintf('xmeas10_zero no.: %d .\n',ii);
    close all
end

for ii=1:10,
    rmatks;
    reset_disturb;
    set_xmeas_ctrl_param(10, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmeas_ctrl_param(10, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmeas_ctrl_param(10, ControllerProperties.VALUE.Value, 0.01);
    set_xmeas_ctrl_param(10, ControllerProperties.START.Value, 400000);
    set_xmeas_ctrl_param(10, ControllerProperties.DURATION.Value, 1);
    
    setRandSeed(rand);
    sim('sim/TEModel_random');
    
    csvwrite(['~/economic_attacks/xmeas10_001/xmeas10_001_data_' num2str(ii) '.csv'],simout)
    csvwrite(['~/economic_attacks/xmeas10_001/xmeas10_001_data_' num2str(ii) '_hf.csv'],simout_hf)
    csvwrite(['~/economic_attacks/xmeas10_001/xmeas10_001_operating_costs_' num2str(ii) '.csv'],OpCost)
    fprintf('xmeas10_001 no.: %d .\n',ii);
    close all
end

for ii=1:10,
    rmatks;
    reset_disturb;
    set_xmeas_ctrl_param(7, ControllerProperties.ATTACK.Value, AttackType.INTEGRITY.String);
    set_xmeas_ctrl_param(7, ControllerProperties.MODE.Value, AttackMode.STEP.String);
    set_xmeas_ctrl_param(7, ControllerProperties.VALUE.Value, 2803);
    set_xmeas_ctrl_param(7, ControllerProperties.START.Value, 400000);
    set_xmeas_ctrl_param(7, ControllerProperties.DURATION.Value, 1);
    setRandSeed(rand);
    sim('sim/TEModel_random');
    
    csvwrite(['~/economic_attacks/xmeas7_2803/xmeas7_2803_data_' num2str(ii) '.csv'],simout)
    csvwrite(['~/economic_attacks/xmeas7_2803/xmeas7_2803_data_' num2str(ii) '_hf.csv'],simout_hf)
    csvwrite(['~/economic_attacks/xmeas7_2803/xmeas7_2803_operating_costs_' num2str(ii) '.csv'],OpCost)
    fprintf('xmeas7_2803 no.: %d .\n',ii);
    close all
end
