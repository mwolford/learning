FROM eclipse-temurin:21.0.1_12-jre-jammy

# Create app directory
WORKDIR /root/structurizr

RUN apt-get update && apt-get install -y unzip && apt install -y graphviz && rm -rf /var/lib/apt/lists/*

# Install structurizr
RUN wget https://github.com/structurizr/cli/releases/download/v2024.07.03/structurizr-cli.zip

RUN unzip structurizr-cli.zip -d structurizr-cli 

RUN chmod +x ./structurizr-cli/structurizr.sh

ENTRYPOINT [ "bash", "/root/structurizr/structurizr-cli/structurizr.sh" ]