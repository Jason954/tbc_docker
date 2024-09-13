FROM debian:stable


RUN apt-get update -y
#RUN apt-get install python3-pkginfo -y

#RUN apt-get install -y gfortran
RUN apt install grep  \
    build-essential \
    gcc \
    g++ \
    automake \
    git-core \
    autoconf \
    make \
    patch \
    cmake \
    libmariadb-dev \
    libmariadb-dev-compat \
    libtool \
    libssl-dev \
    binutils \
    libc6 \
    libbz2-dev  \
    subversion  \
    libboost-all-dev -y


# Créer un répertoire de travail
WORKDIR /app

# Cloner le dépôt Git
RUN git clone https://github.com/cmangos/mangos-tbc.git
#RUN git clone https://github.com/cmangos/playerbots.git

# Se placer dans le répertoire du code source
WORKDIR /app/mangos-tbc

# Créer un répertoire de construction
RUN mkdir build
WORKDIR /app/mangos-tbc/build

RUN ls -ls
# Générer les fichiers de construction avec CMake
RUN cmake .. -DBUILD_PLAYERBOTS=ON -DBUILD_AHBOT=ON

# Compiler le code source
RUN make -j$(nproc)

# Exposer le port du serveur MaNGOS TBC (à adapter)
EXPOSE 8085


# Créer le répertoire /app/conf dans l'image
RUN mkdir /app/conf && mkdir /app/logs

# Copier et renommer les fichiers de configuration
RUN cp /app/mangos-tbc/build/src/mangosd/mangosd.conf.dist /app/conf/mangosd.conf && \
    cp /app/mangos-tbc/build/src/mangosd/ahbot.conf.dist /app/conf/ahbot.conf && \
    cp /app/mangos-tbc/build/src/modules/PlayerBots/aiplayerbot.conf.dist /app/conf/aiplayerbot.conf && \
    cp /app/mangos-tbc/src/realmd/realmd.conf.dist.in /app/conf/realmd.conf

# Copier le script dans l'image
COPY start.sh /app/

RUN ls -ls /app/conf
#CMD ["/app/mangos-tbc/build/src/mangosd/mangosd", "-c", "/app/conf/mangosd.conf", "-a", "/app/conf/ahbot.conf", "-b", "/app/conf/aiplayerbot.conf"]
#CMD ["/app/mangos-tbc/build/src/realmd", "-c", "/app/conf/realmd.conf"]
CMD ["/bin/bash", "/app/start.sh"]
VOLUME /app/conf
VOLUME /app/logs
