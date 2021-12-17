% function [] = applyStochasticSquaredErrorTwoLayerPerceptronMNIST()
%applyStochasticSquaredErrorTwoLayerPerceptronMNIST Train the two-layer
%perceptron using the MNIST dataset and evaluate its performance.

clear;
close all;
%format long
epoch = 1;
accuracy = zeros(1,epoch);

for eee = 1:epoch
    % Load MNIST.
    inputValues = loadMNISTImages('train-images.idx3-ubyte');
    labels = loadMNISTLabels('train-labels.idx1-ubyte');
    
    % Transform the labels to correct target values.
    targetValues = zeros(10, size(labels, 1));
    for n = 1: size(labels, 1)
        targetValues(labels(n) + 1, n) = 1;
    end;
    
    % Choose form of MLP:
    numberOfHiddenUnits = 100;
    
    % Choose appropriate parameters.
    learningRate = 0.5;
    
    % Choose activation function.
    activationFunction = @logisticSigmoid;
    dActivationFunction = @dLogisticSigmoid;
    
    % Choose batch size and epochs. Remember there are 60k input values.
    batchSize = 100;
    epochs = 600;
    
    fprintf('Train twolayer perceptron with %d hidden units.\n', numberOfHiddenUnits);
    fprintf('Learning rate: %d.\n', learningRate);
    

    [hiddenWeights, outputWeights, error] = trainStochasticSquaredErrorTwoLayerPerceptron(activationFunction, dActivationFunction, numberOfHiddenUnits, inputValues, targetValues, epochs, batchSize, learningRate);
    
    % Load validation set.
    inputValues = loadMNISTImages('t10k-images.idx3-ubyte');
    labels = loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    % Choose decision rule.
    fprintf('Validation: %d\n',eee);
    
    [correctlyClassified, classificationErrors] = validateTwoLayerPerceptron(activationFunction, hiddenWeights, outputWeights, inputValues, labels);
    
    fprintf('Classification errors: %d\n', classificationErrors);
    fprintf('Correctly classified: %d\n', correctlyClassified);
    
    accuracy(1,eee) = correctlyClassified/100;
end

accuracy_ave = mean(accuracy);
fprintf('Accuracy: %d\n', accuracy_ave);

