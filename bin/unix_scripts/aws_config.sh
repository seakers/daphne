echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "Follow the instructions in https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html to fill the following information. Choose 'us-east-1' as the region"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli configure
