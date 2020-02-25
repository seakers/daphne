import os
import pickle

import data_helpers
import numpy as np
from text_cnn import text_cnn
from tensorflow.keras.preprocessing.text import Tokenizer
from sklearn.model_selection import train_test_split

# Parameters
# ==================================================

# Data loading params
DEV_SAMPLE_PERCENTAGE = 0.1  # Percentage of the training data to use for validation

# Model Hyperparameters
EMBEDDING_DIM = 128  # Dimensionality of character embedding (default: 128)
FILTER_SIZES = [3, 4, 5]  # Comma-separated filter sizes (default: '3,4,5')
NUM_FILTER = 128  # Number of filters per filter size (default: 128)
DROPOUT_KEEP_PROB = 0.5  # Dropout keep probability (default: 0.5)

# Training parameters
BATCH_SIZE = 128  # Batch Size (default: 64)
NUM_EPOCHS = 50  # Number of training epochs (default: 200)


def train_cnn(x_text, y, daphne_version, output_dir, label):
    # Check if there is data
    if len(x_text) == 0 or len(y) == 0:
        return

    # Build vocabulary
    tokenizer = Tokenizer(oov_token="unrecognized_word")
    tokenizer.fit_on_texts(x_text)
    x = tokenizer.texts_to_sequences(x_text)
    max_x_length = max(max(FILTER_SIZES), max(map(len, x)))  # Min added so all convolutions have enough data
    x = np.array([xi + [0] * (max_x_length - len(xi)) for xi in x])
    vocab_size = len(tokenizer.index_word.keys())+1

    # Split train/test set
    x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=DEV_SAMPLE_PERCENTAGE, random_state=10)
    print("Vocabulary Size: {:d}".format(vocab_size))
    print("Train/Dev split: {:d}/{:d}".format(len(y_train), len(y_test)))

    # Training
    # ==================================================
    model = text_cnn(sequence_length=x_train.shape[1],
                     num_classes=y_train.shape[1],
                     vocab_size=vocab_size,
                     embedding_size=EMBEDDING_DIM,
                     filter_sizes=FILTER_SIZES,
                     num_filters=NUM_FILTER,
                     label=label,
                     dropout=DROPOUT_KEEP_PROB)
    if label == "multi":
        model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['binary_accuracy'])
    elif label == "single":
        model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['binary_accuracy'])
    model.fit(x_train, y_train, validation_data=(x_test, y_test), batch_size=BATCH_SIZE, epochs=NUM_EPOCHS)  # starts training

    # Save model to disk
    output_path = os.path.join(os.getcwd(), "models", daphne_version, output_dir)
    if not os.path.exists(output_path):
        os.makedirs(output_path)
    # Write vocabulary
    with open(os.path.join(output_path, "tokenizer.pickle"), 'wb') as handle:
        pickle.dump(tokenizer, handle, protocol=pickle.HIGHEST_PROTOCOL)
    # Write model
    model.save(os.path.join(output_path, "model.h5"))


# Data Preparation
# ==================================================
if __name__ == '__main__':
    daphne_versions = ["EOSS"]  # "EDL", "AT"
    for daphne_version in daphne_versions:
        # Load data
        print("Loading data...")
        data_path = os.path.join(os.getcwd(), "data", daphne_version)
        general_x_text, general_y, specific_x_texts, specific_ys = data_helpers.load_data_and_labels(daphne_version, data_path)
        print("Data loaded!")

        # Train the skill selection NN
        train_cnn(general_x_text, general_y, daphne_version, "general", "multi")
        # Train the NN for each skill questions
        for i in range(len(specific_x_texts)):
            train_cnn(specific_x_texts[i], specific_ys[i], daphne_version, data_helpers.daphne_skills[daphne_version][i], "single")
