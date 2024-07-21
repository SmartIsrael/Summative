from fastapi import FastAPI
from pydantic import BaseModel
import numpy as np
import joblib

app = FastAPI()

# Load the trained model, scaler, and polynomial features
model = joblib.load('insurance_prediction_model.joblib')
scaler = joblib.load('insurance_prediction_scaler.joblib')
poly = joblib.load('polynomial_features.joblib')

class InsuranceInput(BaseModel):
    age: float
    bmi: float
    children: int
    sex_male: int
    smoker_yes: int
    region_northwest: int
    region_southeast: int
    region_southwest: int

@app.post('/predict')
def predict(input_data: InsuranceInput):
    # Convert input data to array
    input_array = np.array([[
        input_data.age, 
        input_data.bmi, 
        input_data.children, 
        input_data.sex_male, 
        input_data.smoker_yes, 
        input_data.region_northwest, 
        input_data.region_southeast, 
        input_data.region_southwest
    ]])
    
    # Apply scaling
    scaled_input = scaler.transform(input_array)
    
    # Apply polynomial feature transformation
    poly_input = poly.transform(scaled_input)
    
    # Predict
    prediction = model.predict(poly_input)
    
    return {'prediction': prediction[0]}
