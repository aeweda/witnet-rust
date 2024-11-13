FROM --platform=$TARGETPLATFORM witnet/witnet-rust:latest

ARG TARGETPLATFORM

RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
        cp witnet-centralized-ethereum-bridge-x86_64-unknown-linux-gnu /witnet-centralized-ethereum-bridge; \
    elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
        cp witnet-centralized-ethereum-bridge-aarch64-unknown-linux-gnu /witnet-centralized-ethereum-bridge; \
    else \
        echo "Unsupported platform: $TARGETPLATFORM"; \
        exit 1; \
    fi

ENTRYPOINT ["/witnet-centralized-ethereum-bridge", "--env"]