if [ $CODEBUILD_BUILD_SUCCEEDING -eq 1 ]
then
  aws s3 sync build/ s3://$S3 --delete --cache-control max-age=2592000

  aws s3 cp s3://$S3/index.html s3://$S3/index.html --metadata-directive REPLACE --cache-control max-age=0,no-cache,no-store,must-revalidate --content-type text/html

  # aws cloudfront create-invalidation --distribution-id $CLOUDFRONT --paths "/*"
fi
