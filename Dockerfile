FROM alpine:3.16

RUN apk add \
	openssl openssl-dev make lua5.3 lua-dev pcre2 pcre2-dev alpine-sdk && \
	wget https://github.com/lefcha/imapfilter/archive/master.zip && \
	unzip master.zip && \
	cd imapfilter-master && \
	make all && \
	make install && \
	apk del alpine-sdk && \
	cd .. && \
	rm -r imapfilter-master && \
	rm master.zip

CMD ["imapfilter"]
