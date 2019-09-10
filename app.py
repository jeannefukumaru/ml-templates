from flask import Flask, jsonify, request
from predict import prediction_controller 
# from train import train_model

app = Flask(__name__)

@app.route('/')
def index():
    return "Hello, World!"

# endpoint to trigger preprocessing
# @app.route('/preproc', methods=['POST'])
# def preproc():
#     '''clean links, extract article text from links before splitting into train and test sets'''
#     from src.modules.preproc import extract_links 
#     from src.modules.preproc import extract_text 
#     from src.modules.preproc import train_test_split

# endpoint to trigger model training
# @app.route('/train', methods=['POST'])
# def train():
#     '''takes in train set with text as strings and categories as OHE 
#     trains ensemble classifier'''
#     return train_model.main()

# endpoint to get predictions for single article
@app.route('/predict', methods=['POST'])
def predict():
    '''takes in text string and returns predicted categories and countries''' 
    return prediction_controller.main()

# endpoint to add feedback to training set 
# @app.route('/feedback', methods=['POST'])
# def feedback():


if __name__ == '__main__':
    app.run(host='0.0.0.0',debug=True)

