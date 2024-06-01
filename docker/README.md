docker build \
--build-arg AWS_ACCESS_KEY_ID=<my_access_key> \
--build-arg AWS_SECRET_ACCESS_KEY=<my_secret_key> \
--build-arg S3_BUCKET_PATH=s3://dariastudiesdocker \
-t dariavesn/dockerexersice:1.0 --no-cache .


docker run -d -p 80:80/tcp dariavesn/dockerexersice:1.0