#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Sep 27 16:18:53 2018

@author: Jaydip Patel
"""
# Data Preprocessing
# Importing the library
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# importing dataset
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:,:-1].values      # all rows, and all columns except last one
Y = dataset.iloc[:,3].values

# Taking care of missing data
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = 'NaN', strategy = 'mean', axis = 0)
imputer = imputer.fit(X[:,1:3])   #Upperbound in python is excluded
X[:,1:3] = imputer.transform(X[:,1:3])

# Label categorical data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X = LabelEncoder()
X[:,0] = labelencoder_X.fit_transform(X[:,0])
onehotencoder = OneHotEncoder(categorical_features = [0])
X = onehotencoder.fit_transform(X).toarray()

labelencoder_Y = LabelEncoder()
Y = labelencoder_Y.fit_transform(Y)
onehotencoder = OneHotEncoder(categorical_features = [0])
Y = onehotencoder.fit_transform(Y).toarray()








quit()
