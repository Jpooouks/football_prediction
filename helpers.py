import pandas as pd
import numpy as np
from statsmodels.stats.outliers_influence import variance_inflation_factor


def find_outliers(df):
    outlier_indices = []
    for column in df.columns:
        if df[column].dtype in ['int64', 'float64']:
            Q1 = df[column].quantile(0.25)
            Q3 = df[column].quantile(0.75)
            IQR = Q3 - Q1
            
            lower_bound = Q1 - 1.5 * IQR
            upper_bound = Q3 + 1.5 * IQR
            
            column_outliers = df[(df[column] < lower_bound) | (df[column] > upper_bound)].index
            
            outlier_indices.extend(column_outliers)
    
    unique_outlier_indices = list(set(outlier_indices))
    
    return df.loc[unique_outlier_indices]


def calc_vif(X):
    vif = pd.DataFrame()
    vif["variable"] = X.columns
    vif["VIF"] = [variance_inflation_factor(X.values, i) for i in range(X.shape[1])]
    return vif