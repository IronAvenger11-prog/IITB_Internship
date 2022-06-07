robot = loadrobot('abbYumi','Gravity',[0 0 -9.81]);
iviz = interactiveRigidBodyTree(robot);
ax = gca;
exampleHelperSetupWorkspace(ax);

load abbSavedConfigs.mat configSequence

q0 = configSequence(:,1);
dq0 = zeros(size(q0));
ddq0 = zeros(size(q0));

open_system('modelWithSimplifiedSystemDynamics.slx');

simout = sim('modelWithSimplifiedSystemDynamics.slx');

iviz.ShowMarker = false;
iviz.showFigure;
rateCtrlObj = rateControl(length(simout.tout)/(max(simout.tout)));
for i = 1:length(simout.tout)
    iviz.Configuration = simout.yout{1}.Values.Data(i,:);
    waitfor(rateCtrlObj);
end


