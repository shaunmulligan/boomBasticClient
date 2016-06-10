FROM resin/raspberrypi-buildpack-deps:jessie-curl-20160411

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  libasound2-dev \
  libvorbisidec-dev \
  libvorbis-dev \
  libflac-dev \
  alsa-utils \
  libavahi-client-dev \
  avahi-daemon \
  git \
&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/badaix/snapcast.git
RUN cd snapcast/externals && git submodule update --init --recursive
RUN cd snapcast/client && make && make install

ENV INITSYSTEM=on
COPY start.sh /start.sh

CMD /start.sh
