# Enforce Https
from flask import Flask
from flask_talisman import Talisman
from flask_security import Security
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

app = Flask(__name__)
Talisman(app)  # Enforces HTTPS

@app.route('/')
def home():
    return "Secure Flask App"

if __name__ == '__main__':
    app.run(ssl_context=('cert.pem', 'key.pem'))  # Enable HTTPS

# Sanitization
from flask_wtf import FlaskForm
from wtforms import StringField
from wtforms.validators import DataRequired, Length

class SecureForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired(), Length(min=3, max=20)])

# Restrict SQL Injection
import sqlite3

def get_user(username):
    conn = sqlite3.connect("users.db")
    cur = conn.cursor()
    cur.execute("SELECT * FROM users WHERE username = ?", (username,))  # Secure Query
    return cur.fetchone()

# Enabling MFA

from flask_security import Security, SQLAlchemyUserDatastore
from flask_limiter import Limiter

app = Flask(__name__)
limiter = Limiter(app)

@app.route('/login')
@limiter.limit("4 per minute")  # Rate limiting to prevent brute-force
def login():
    return "Login Page"

# Securing headers
from flask_talisman import Talisman

Talisman(app, content_security_policy={
    'default-src': "'self'",
    'img-src': "'self' data:",
    'script-src': "'self'"
})

# Best Session Management Practices
app.config.update(
    SESSION_COOKIE_SECURE=True,  # Only send over HTTPS
    SESSION_COOKIE_HTTPONLY=True,  # Restrict JavaScript access
    SESSION_COOKIE_SAMESITE='Strict'  # Protect against CSRF
)
