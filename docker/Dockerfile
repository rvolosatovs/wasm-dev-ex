FROM --platform=arm64 rust
COPY . /src
RUN cargo install --path /src
RUN rm -rf /src
ENTRYPOINT ["app"]
