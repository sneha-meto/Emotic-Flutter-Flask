import pandas as pd
# train Data
trainData = pd.read_csv("train.csv")
# test Data
testData = pd.read_csv("test.csv")

trainData.sample(frac=1).head(5) # shuffle the df and pick first 5

from sklearn.feature_extraction.text import TfidfVectorizer
# Create feature vectors
vectorizer = TfidfVectorizer(min_df = 5,
                             max_df = 0.8,
                             sublinear_tf = True,
                             use_idf = True)
train_vectors = vectorizer.fit_transform(trainData['text'])
test_vectors = vectorizer.transform(testData['text'])

import time
from sklearn import svm
from sklearn.metrics import classification_report
# Perform classification with SVM, kernel=linear
classifier_linear = svm.SVC(kernel='linear')
t0 = time.time()
classifier_linear.fit(train_vectors, trainData['label'])
t1 = time.time()
prediction_linear = classifier_linear.predict(test_vectors)
t2 = time.time()
time_linear_train = t1-t0
time_linear_predict = t2-t1
# results
print("Training time: %fs; Prediction time: %fs" % (time_linear_train, time_linear_predict))
report = classification_report(testData['label'], prediction_linear, output_dict=True)
print('sadness: ', report['0'])
print('joy: ', report['1'])
print('love: ', report['2'])
print('anger: ', report['3'])
print('fear: ', report['4'])
print('surprise: ', report['5'])

# review = """SUPERB, I AM SO GLAD"""
# print(review)
# review_vector = vectorizer.transform([review]) # vectorizing
# print(classifier_linear.predict(review_vector))

# review = """i liked it"""
# print(review)
# review_vector = vectorizer.transform([review]) # vectorizing
# print(classifier_linear.predict(review_vector))

# review = """i am sad"""
# print(review)
# review_vector = vectorizer.transform([review]) # vectorizing
# print(classifier_linear.predict(review_vector))

# review = """im scared"""
# print(review)
# review_vector = vectorizer.transform([review]) # vectorizing
# print(classifier_linear.predict(review_vector))

# review = """so strange im dazed"""
# print(review)
# review_vector = vectorizer.transform([review]) # vectorizing
# print(classifier_linear.predict(review_vector))

# review = """im angry"""
# print(review)
# review_vector = vectorizer.transform([review]) # vectorizing
# print(classifier_linear.predict(review_vector))

import pickle
# pickling the vectorizer
pickle.dump(vectorizer, open('vectorizer.sav', 'wb'))
# pickling the model
pickle.dump(classifier_linear, open('classifier.sav', 'wb'))

