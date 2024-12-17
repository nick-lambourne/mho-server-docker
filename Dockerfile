FROM mcr.microsoft.com/dotnet/sdk:8.0

RUN apt-get update && apt-get upgrade -y
RUN apt install -y git sqlite3 curl

# Make sure we download the latest code
ARG CACHEBUST
ARG SERVER_BRANCH
ARG GIT_URL

WORKDIR /space/MHServerEmu
RUN git clone ${GIT_URL} $(pwd)
RUN git checkout $SERVER_BRANCH

WORKDIR /space/
ADD web/ web/

WORKDIR /space/MHServerEmu

# Build the server for the first time
RUN dotnet build MHServerEmu.sln

# Copy the necessary files over
COPY data/Calligraphy.sip /space/MHServerEmu/src/MHServerEmu/bin/x64/Debug/net8.0/Data/Game/
COPY data/mu_cdata.sip /space/MHServerEmu/src/MHServerEmu/bin/x64/Debug/net8.0/Data/Game/

# Copy the configuration
COPY data/Config.Default.ini /space/MHServerEmu/src/MHServerEmu/bin/x64/Debug/net8.0/Config.ini

# sqlite interop files
ADD data/sqlite/* /space/MHServerEmu/src/MHServerEmu/bin/x64/Debug/net8.0/

EXPOSE 8080/tcp 4306/udp 4306/tcp

ENTRYPOINT ["/space/MHServerEmu/src/MHServerEmu/bin/x64/Debug/net8.0/MHServerEmu"]

