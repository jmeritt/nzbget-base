FROM jmeritt/debian-htpc

USER htpc

RUN cd ~ && wget https://nzbget.net/download/nzbget-latest-bin-linux.run && \
	chmod u+x nzbget-latest-bin-linux.run && \
	~/nzbget-latest-bin-linux.run && \
	rm nzbget-latest-bin-linux.run

EXPOSE 6789

VOLUME /downloads
VOLUME /config

ENV PATH="/home/htpc/nzbget:${PATH}"

CMD nzbget -o OutputMode=log -c /config/nzbget.conf -s

