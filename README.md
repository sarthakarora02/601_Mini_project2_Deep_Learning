# 601_Mini_project2_deep_learning
EC 601 Mini Project2- A project that trains a model to detect 6 different handwritten greek alphabets

# Dataset
9074 jpg images of handwritten greek alphabets. Image_size 28x28
- epsilon
- mu
- omega
- lambda
- nu
- psi

## Built using
* Python 3.6.6 (latest keras compatible) 
* TensorFlow 1.11.0
* Numpy 1.15.2 
* matplotlib.pyplot 3.0.0
* scikit-learn 0.20.0

## Paths
* Path to dataset images ./train_images (Contains 9074 images of 6 different greek alphabets)
* Path to test images for predcitor.ipynb ./test_images (Contains 60 images of 6 different greek alphabets to try the model)

## User Guide
* main.ipynb - Splits the dataset(./train_images) into train, test and validation. Trains the model with the images and saves the model as json and weights as .h5
* predictor.ipynb - Loads the saved model and evaluates another set of images(./test_images) and displays the images with the predcitions and the true labels in a grid.

## References
* https://www.tensorflow.org/tutorials/keras/basic_classification
* https://www.pyimagesearch.com/2016/08/01/lenet-convolutional-neural-network-in-python/
* https://machinelearningmastery.com/save-load-keras-deep-learning-models/
