FROM jmeritt/ubuntu-htpc

USER htpc

ENV VER=21.1

RUN cd ~ && wget "https://github.com/nzbget/nzbget/releases/download/v${VER}/nzbget-${VER}-bin-linux.run" && \
	chmod u+x "nzbget-${VER}-bin-linux.run" && \
	~/nzbget-*-bin-linux.run && \
	rm "nzbget-${VER}-bin-linux.run"

EXPOSE 6789

VOLUME /downloads
VOLUME /config

ENV PATH="/home/htpc/nzbget:${PATH}"

CMD nzbget -o OutputMode=log -c /config/nzbget.conf -s

