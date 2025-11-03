# app.py

from flask import Flask
import os

# Create a Flask application instance
app = Flask(__name__)

# Define the root route (homepage)
@app.route('/')
def hello_world():
    # Retrieve an environment variable, if set, otherwise use a default value
    message = os.environ.get('GREETING', 'Hello')
    
    # Return the response to the client
    return f"{message} from a Docker Container!"

# Run the application
if __name__ == '__main__':
    # Listen on all public IPs (0.0.0.0) and a specific port (8080)
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))
