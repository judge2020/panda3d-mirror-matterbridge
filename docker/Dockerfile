FROM 42wim/matterbridge

RUN apk add --no-cache bash dos2unix

COPY docker-entrypoint.sh /entrypoint.sh
RUN dos2unix /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN touch /matterbridge.toml && chmod 777 /matterbridge.toml
ENTRYPOINT "/entrypoint.sh"
