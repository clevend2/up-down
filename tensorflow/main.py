# Import necessary libraries
import numpy as np
import tensorflow as tf
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder

LSTM_UNITS = 64


# Sample data: Sentences as lists of words, and POS tags as lists of tags
# Create a list of sentences, where each sentence is represented as a list of words
sentences = [["I", "love", "coding"], ["Python", "is", "great"]]
# Create a list of POS tags corresponding to each sentence
pos_tags = [["PRP", "VBP", "VBG"], ["NNP", "VBZ", "JJ"]]

# Initialize LabelEncoder for words and tags
# Create encoder objects to convert words and tags to integers
word_encoder = LabelEncoder()
tag_encoder = LabelEncoder()

# Flatten the list of sentences and list of tags to fit the encoder
all_words = [word for sentence in sentences for word in sentence]
all_tags = [tag for tags in pos_tags for tag in tags]

# Fit the encoder on the words and tags
word_encoder.fit(all_words)
tag_encoder.fit(all_tags)

# Transform each sentence to a list of integers based on the previously fitted encoder
encoded_sentences = [word_encoder.transform(sentence) for sentence in sentences]
# Transform each list of POS tags to a list of integers
encoded_tags = [tag_encoder.transform(tags) for tags in pos_tags]

# Padding sequences
# Define a constant length for each sequence and pad shorter sequences with zeros
MAXLEN = 100
encoded_sentences = tf.keras.preprocessing.sequence.pad_sequences(encoded_sentences, maxlen=MAXLEN, padding="post")
encoded_tags = tf.keras.preprocessing.sequence.pad_sequences(encoded_tags, maxlen=MAXLEN, padding="post")

# Split the dataset into training and testing sets
# Randomly split the data into 80% training and 20% testing
X_train, X_test, y_train, y_test = train_test_split(encoded_sentences, encoded_tags, test_size=0.2)

# Build the neural network model
# Define the architecture of the neural network model for POS tagging
vocab_size = len(word_encoder.classes_)
tag_size = len(tag_encoder.classes_)

model = tf.keras.Sequential([
    # Add an Embedding layer to convert each word to a fixed-size vector
    tf.keras.layers.Embedding(input_dim=vocab_size, output_dim=50, input_length=MAXLEN),
    # Add a Bi-directional LSTM layer to capture the sequence information
    tf.keras.layers.Bidirectional(tf.keras.layers.LSTM(LSTM_UNITS, return_sequences=True)),
    # Add a Dense layer to classify each word into one of the POS tag classes
    tf.keras.layers.Dense(tag_size, activation="softmax")
])

# Compile the model specifying the optimizer, loss function, and metric to track
model.compile(optimizer="adam", loss="sparse_categorical_crossentropy", metrics=["accuracy"])

# Reshape y_train to match the output shape of the model
# Add an extra dimension to y_train to make it compatible with the model's expected input shape
y_train = y_train.reshape(y_train.shape[0], y_train.shape[1], 1)

# Train the model using the training data
# Fit the model on the training data for 5 epochs using a batch size of 32
model.fit(X_train, y_train, epochs=5, batch_size=32)

# Add your evaluation and prediction code here
# (You would typically evaluate the model on the test set and make predictions)
