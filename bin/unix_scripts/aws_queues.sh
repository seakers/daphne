docker run --rm -it amazon/aws-cli --endpoint-url=http://localhost:4576 sqs create-queue --queue-name vassar_request
docker run --rm -it amazon/aws-cli --endpoint-url=http://localhost:4576 sqs create-queue --queue-name vassar_response
docker run --rm -it amazon/aws-cli --endpoint-url=http://localhost:4576 sqs create-queue --tags problem_id=5 --queue-name algorithm_queue