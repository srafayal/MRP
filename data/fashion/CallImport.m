fashionmnisttrain = importfile('fashion-mnist_train.csv', 2, 60001);
save('fashionmnisttrain.mat','fashionmnisttrain')

fashionmnisttest = importfile('fashion-mnist_test.csv', 2, 10001);
save('fashionmnisttest.mat','fashionmnisttest')