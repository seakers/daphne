FROM node:latest

ENV USER=daphne
ENV PASSWORD=daphne
ENV HOST=0.0.0.0


WORKDIR /app/interface

RUN git clone https://github.com/seakers/daphne-interface.git && \
    cd daphne-interface && \
    npm install

WORKDIR /app/interface/daphne-interface

CMD npm run dev