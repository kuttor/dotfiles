#!/usr/local/bin/bash

# check arg count
# [[ $# -ne 1 ]] && { echo "usage: $(basename "$0") [vpc_id]"; exit 1; }

# set args
vpc_ids="vpc-0d60eb69"

# set printf format

format="%-30s %-16s %-16s\n"

for vpc_id in "${vpc_ids[@]}"
do
	aws ec2 describe-subnets  \
	                --filters "Name=vpc-id,Values=${vpc_id}" \
	                --region us-west-2 \
	                --query 'Subnets[][].[Tags[?Key==`Name`] | [0].Value,SubnetId,CidrBlock]' \
	                --output text | sort | xargs printf "${format}"
done
