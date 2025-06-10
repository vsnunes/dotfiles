# Converts an ISO date YYYY-MM-DD to Unix timestamp
date-to-timestamp()
{
    # Fetch current word from buffer without any quotes
    CURRENTWORD=$(echo "${LBUFFER/* /}${RBUFFER/ */}" | tr -d "'\"")

    if [[ "$CURRENTWORD" =~ [0-9]{4}-[0-9]{2}-[0-9]{2} ]]; then
        TS=$(echo -n $(date -d "$CURRENTWORD" +%s))
    else
        TS=$(echo -n $(date -d "@$CURRENTWORD" -I))
    fi

    BUFFER=${BUFFER/$CURRENTWORD/$TS}
}

zle -N date-to-timestamp
bindkey -M vicmd t date-to-timestamp
