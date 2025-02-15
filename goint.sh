set -v 
docker run \
-v $PWD:/workspace \
--link registry \
gcr.io/kaniko-project/executor:v1.23.2-debug \
 --dockerfile /workspace/Dockerfile \
 --insecure --skip-tls-verify \
 --verbosity debug \
 --destination "registry:5000/hello2:1" \
 --context dir:///workspace/
 #--registry-mirror registry:5000 \
