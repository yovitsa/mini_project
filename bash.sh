#!/bin/bash

bucket_name="macak-bucket"
website_directory="mini_project\resume_sta"

region="us-west-2"
profile='Playground'

# Create an new backet

aws s3 mb \
    --profile $profile \
    --region $region \
    --region us-eat-1 "s3://$bucket_name"

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
                \"Resource\": \"arn:aws:s3:::macak-bucket/*\"
            }
        ]
}" \

--profile Playground

# Enabling the s3 Bucket for page hosting

aws s3 webiste "s3://macak-bucket" \
    --profile $profile \
    --region $region \
    --index-document index.html
    # directing to index adjust at cloud front gui on aws
    --error-document index.html

# Uploading the webiste

aws s3 sunc \
    --profile $profile \
    --region $region \
    $website_directory "s3://$bucket_name/"