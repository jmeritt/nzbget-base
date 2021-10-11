FROM jmeritt/debian-htpc

USER htpc

ENV VER=21.1

RUN cd ~ && wget https://github.com/nzbget/nzbget/releases/download/v21.1/nzbget-21.1-bin-linux.run && \
	chmod u+x nzbget-21.1-bin-linux.run && \
	~/nzbget-21.1-bin-linux.run && \
	rm nzbget-21.1-bin-linux.run

EXPOSE 6789

VOLUME /downloads
VOLUME /config

ENV PATH="/home/htpc/nzbget:${PATH}"

CMD nzbget -o OutputMode=log -c /config/nzbget.conf -s

