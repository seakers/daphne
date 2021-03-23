# Image
FROM python:3.7

# Environment
ENV USER=daphne
ENV PASSWORD=daphne

# Working Directory
WORKDIR /app/brain

RUN git clone https://github.com/seakers/daphne_brain.git && \
    git clone https://github.com/seakers/command_classifier.git && \
    git clone https://github.com/seakers/historical_db.git && \
    pip3 install -r ./daphne_brain/requirements.txt && \
    pip3 install -r ./command_classifier/requirements.txt && \
    pip3 install -r ./historical_db/requirements.txt && \
    python3 -m spacy download en_core_web_sm && \
    cd historical_db && \
    scrapy crawl ceosdb_scraper && \
    cd ../command_classifier && \
    python3 question_generator.py && \
    python3 train.py && \
    cp -r ./models ../daphne_brain/dialogue/models && \
    cd ../daphne_brain && \
    mkdir logs && \
    touch ./logs/daphne.log && \
    python3 manage.py makemigrations --merge && \
    python3 manage.py migrate && \

CMD daphne -b 0.0.0.0 -p 8000 daphne_brain.asgi:application




