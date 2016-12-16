It is for recoginizing 3D-digit number produced by leapmotion.

In the `digit_classify_HM` , There are code for our demo. We used knn algorithm to recognize the numbers. The accuracy is about 80 percent.



digit_classify_HM

- parsing.m
- knn.m
- digit_classify_run.m
- digit_classify.m
- training_data



`parsing.m` is for pasring data from `training_data` the return value is cell of the training data and no input data.

`knn.m` is for the algorithm to recognize the number.

`digit_classify_run.m` is demo for testing the our algorithm.

`digit_classify.m` is function using knn algorithm to recognize the input data is test data or test data set, return value is C about classified classes.

`training_data` is directory containing our samples produced by leapmotion. It contains 3D-digits number from 0 to 9. The data size is different in each case.



It is a practical assignment for Pattern recognition course at LUT.
