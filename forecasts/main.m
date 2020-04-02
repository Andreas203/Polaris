%
% BABA
symbol = 'BABA';
data = num2cell(readmatrix('stocks/BABA.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7));


lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

conn = database('polarisanalytics','wvybtafwuesjox','4281f10d82eafab7f60f193fddb9b970c476af56b7b5c964f9faf952aeef0eb3');

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);



%
%
%
% GOOGL
symbol = 'GOOGL';
data = num2cell(readmatrix('stocks/GOOGL.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);


%
%
%
% AMZN
symbol = 'AMZN';
data = num2cell(readmatrix('stocks/AMZN.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);

%
%
%
% AAPL
symbol = 'AAPL'
data = num2cell(readmatrix('stocks/AAPL.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))


lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);


%
%
%
% BIDU
symbol = 'BIDU';
data = num2cell(readmatrix('stocks/BIDU.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);


%
%
%
% CSCO
symbol = 'CSCO';
data = num2cell(readmatrix('stocks/CSCO.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);



%
%
%
% FB
symbol = 'FB';
data = num2cell(readmatrix('stocks/FB.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);




%
%
%
% IBM
symbol = 'IBM';
data = num2cell(readmatrix('stocks/IBM.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);

%
%
%
% INTC
symbol = 'INTC';
data = num2cell(readmatrix('stocks/INTC.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);


%
%
%
% MSFT
symbol = 'MSFT';
data = num2cell(readmatrix('stocks/MSFT.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);

%
%
%
% NFLX
symbol = 'NFLX';
data = num2cell(readmatrix('stocks/NFLX.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);



%
%
%
% ORCL
symbol = 'ORCL';
data = num2cell(readmatrix('stocks/ORCL.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);



%
%
%
% PYPL
symbol = 'PYPL';
data = num2cell(readmatrix('stocks/PYPL.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);


%
%
%
% CRM
symbol = 'CRM';
data = num2cell(readmatrix('stocks/CRM.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);



%
%
%
% SSNLF
symbol = 'SSNLF';
data = num2cell(readmatrix('stocks/SSNLF.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);

%
%
%
% SAP
symbol = 'SAP';
data = num2cell(readmatrix('stocks/SAP.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);


%
%
%
% SFTBY
symbol = 'SFTBY';
data = num2cell(readmatrix('stocks/SFTBY.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);

%
%
%
% TCEHY
symbol = 'TCEHY'
data = num2cell(readmatrix('stocks/TCEHY.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

llastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);

%
%
%
% TSLA
symbol = 'TSLA';
data = num2cell(readmatrix('stocks/TSLA.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))
lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);

%
%
%
% TWTR
symbol = 'TWTR';
data = num2cell(readmatrix('stocks/TWTR.csv').');
data = [data{:}];
numTimeStepsTrain = floor(0.999999999999*numel(data));
dataTrain = data(1:numTimeStepsTrain+1);
dataTest = data(numTimeStepsTrain+1:end);
mu = mean(dataTrain);
sig = std(dataTrain);
mu = mean(dataTrain);
sig = std(dataTrain);
dataTrainStandardized = (dataTrain - mu) / sig;
XTrain = dataTrainStandardized(1:end-1);
YTrain = dataTrainStandardized(2:end);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
dataTestStandardized = (dataTest - mu) / sig;
XTest = dataTestStandardized(1:end-1);
net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));
numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest+7
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','gpu');
end
YPred = sig*YPred + mu;
sprintf('%s: %f', symbol, YPred(7))

lastval = ((YPred(end)-data(end))/data(end))*100;

S = jsonencode(YPred);
T = jsonencode(data);

query = compose("UPDATE companies SET change = %f WHERE companysymbol =  '%s'",lastval, symbol);
execute(conn, query);

query = compose("UPDATE companies SET pred = '%s' WHERE companysymbol =  '%s'",S, symbol);
execute(conn, query);

query = compose("UPDATE companies SET past = '%s' WHERE companysymbol =  '%s'",T, symbol);
execute(conn, query);

close(conn);



