# FPGA Acceleration Course Project #
In this work, we are trying to implement an artificial neural network (ANN) on FPGA platform which can recognize hand-writing digits from MNIST dataset in a relatively high accuracy. \

![SMC](https://github.com/sai-shi/Hardware-Acceleration-of-Neural-Networks/blob/main/SMC.png)

## Our Work ##
Our work contains mainly two parts (Figure 1): software training and testing; FPGA implementation and acceleration. First, we will use an training code to generate a low precision weight matrix. Then we will model the multilayer perceptron (MLP) using Synphony Model Compiler (SMC) to model the network on FPGA platform. After debugging, we will further optimize the design using architecture techniques such as reordering, folding and pipelining. When the function is verified, we will optimize the performance and finally map it into NEXYS 4 DDR and see the actual performance. In this process, to optimize the accuracy and hardware efficiency, several strategies such as stochastic rounding is used.
