docker run -d -p 5000:5000 --name registry registry:latest
docker run -p 5000:5000 --rm --name registry \
 -v $PWD/certs:/certs -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/tls.crt -e REGISTRY_HTTP_TLS_KEY=/certs/tls.key registry

openssl req -newkey rsa:4096 -nodes -sha256 -keyout ./certs/tls.key -x509 -days 365 -subj "/C=GR/ST=./L=./O=./CN=registry.local.doc" -addext "subjectAltName = DNS:registry.local.doc" -out ./certs/tls.crt

curl -s -k https://localhost:5000/v2/_catalog

set -v
docker run \
-v $PWD:/workspace \
--link registry \
gcr.io/kaniko-project/executor:latest \
 --dockerfile /workspace/Dockerfile \
 --insecure --destination "registry:5000/myhallo:latest" \
 --context dir:///workspace/

fonctionne bien

si on veut utiliser la registry locale en lieu et place de dockerhub
