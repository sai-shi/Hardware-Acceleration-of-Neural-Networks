%% Generate test vectors
%clear;
input_sample_rate = 1e5; % Hz 
input_sample_time=1/input_sample_rate;
system_sample_time=input_sample_time/10;
system_sample_rate=1e6;
system_sample_time2=system_sample_time/10;
BMUX_sample_time=system_sample_time*10;

t=[0:783]'/input_sample_rate;
t2=[0:99]'/system_sample_rate;
Input_Layer.time=t;
Input_Layer.signals.values=inputValues(:,1);
Input_layer.signals.dimensions=1;

for i=1:100
    eval(['Hidden_Layer_Weight',num2str(i),'.time=t']);
    eval(['Hidden_Layer_Weight',num2str(i),'.signals.values=transpose(hiddenWeights(',num2str(i),',:))']);
    eval(['Hidden_Layer_Weight',num2str(i),'.signals.dimensions=1']);
end


for j=1:10
    eval(['Output_Layer_Weight',num2str(j),'.time=t2']);
    eval(['Output_Layer_Weight',num2str(j),'.signals.values=transpose(outputWeights(',num2str(j),',:))']);
    eval(['Output_Layer_Weight',num2str(j),'.signals.dimensions=1']);
end

%Input_Layer=[0 1];
%for i=1:100
%    eval(['Hidden_Layer_Weight',num2str(i),'=[',num2str(0),' ',num2str(mod(i,10)),' ',']']);
%end
%for j=1:10
%    eval(['Output_Layer_Weight',num2str(j),'=[',num2str(0),' ',num2str(1),']']);
%end

%A = rand(64,64);
%x = rand(64,1);
%t = [0:63]'/input_sample_rate;
%xt.time = t;
%xt.signals.values = x;
%xt.signals.dimensions = 1;
%xt2.time = t;
%xt2.signals.values = x;
%xt2.signals.dimensions = 1;
%for i = 1:64 
%   At(i).time = t;
%   At(i).signals.values = A(i,:)';
%   At(i).signals.dimensions = 1;
%end

%y_matlab = A*x;

%%Activation Test
%Activation_gold=(exp(-1*x)+1).^(-1);

%%%%%%%%%%%%%%%%%%%%%
%% Configure Simulink models
% %List all the % parameters of a block
% load_system('CEN598_HW2/From Workspace');
% list = get_param('CEN598_HW2/From Workspace','ObjectParameters');

% Set the value of a parameter in a block
%BlockName = 'CEN598_HW2';
%set_param([BlockName '/From Workspace'],'VariableName','At(1)')
%set_param([BlockName '/To Workspace'],'VariableName','yt1')
%set_param([BlockName '/To Workspace'],'SaveFormat',['Structure With Time'])
%for i=1:63
%    set_param([BlockName '/From Workspace' num2str(i)],'VariableName',['At(' num2str(i+1) ')'])
%    set_param([BlockName '/To Workspace' num2str(i)],'VariableName',['yt' num2str(i+1)])
%    set_param([BlockName '/To Workspace' num2str(i)],'SaveFormat',['Structure With Time'])
%end
%set_param([BlockName '/From Workspace64'],'VariableName','xt')

%% Verify the results 


