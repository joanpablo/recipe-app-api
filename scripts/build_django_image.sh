docker compose build \
    --build-arg USER_ID=$(id -u) \
    --build-arg DEV=true \
    app