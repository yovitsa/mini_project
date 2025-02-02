#!/bin/bash

bucket_name="bucket-test001"
website_directory="Path_to_the_bucket"

region="us-west-2"
profile='Production'

# Create an new backet

aws s3 mb \
    --profile $profile \
    --region $region \
    --region us-east-1 "s3://$bucket_name"


# Public access to the bucket
aws s3api put-public-access-block \
    --profile $profile \
    --region $region \
    --bucket $bucket_name \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false" 

# Bucket Policy

aws s3api put-bucket-policy \
    --profile $profile \
    --region $region \
    --bucket $region \
    --bucket $bucket_name \
    --policy "{
        \"Version\": \"2012-10-17\",
        \"Statement\": [
            {
                \"Sid\": \"PublicReadGetObject\",
                \"Effect\": \"Allow\",
                \"Principal\": \"*\",
                \"Action\": \"s3:GetObject\",
                \"Resource\": \"arn:aws:s3:::$bucket_name/*\"
            }
        ]
}" \


# Enabling the s3 Bucket for page hosting

aws s3 website "s3://$bucket_name" \
    --profile $profile \
    --region $region \
    --index-document index.html \
    --error-document index.html

# Uploading the webiste

aws s3 sync \
    --profile $profile \
    --region $region \
    $website_directory "s3://$bucket_name/"