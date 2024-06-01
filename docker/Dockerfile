FROM amazon/aws-cli AS awscli

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG S3_BUCKET_PATH

WORKDIR /from-aws
RUN aws s3 cp ${S3_BUCKET_PATH} ./ --recursive

# Next container
FROM nginx

WORKDIR /app

COPY --from=awscli /from-aws/index.html /usr/share/nginx/html/index.html