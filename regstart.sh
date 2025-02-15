docker run -p 5000:5000 --rm --name registry \
 -v $PWD/certs:/certs -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/tls.crt -e REGISTRY_HTTP_TLS_KEY=/certs/tls.key registry
