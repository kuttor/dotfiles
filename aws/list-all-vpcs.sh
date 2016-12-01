#!/usr/local/bin/bash

accounts=~/.aws/credentials
profiles=($(awk '/\[production/{ gsub(/\[|\]/,"") ; print $NF }' $accounts))
format='%-30s %-16s %-16s\n'
regions=('us-west-2' 'us-east-1')

# Describes and pretty outputs VPCs in us-west-2 and us-east-1
for account in "${profiles[@]}"
do
	echo $account
	for region in 'us-west-2' 'us-east-1'
	do
		aws ec2 describe-vpcs --query 'Vpcs[].[Tags[?Key==`Name`] | [0].Value,VpcId,CidrBlock]' \
	                          --profile $account \
	                          --region $region \
	                          --output text | sort -f | xargs printf "$format"
	done
	echo ""
done






	                  
