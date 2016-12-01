#!/usr/local/bin/bash

# Test for args
# [[ $# -ne 1 ]] && { echo "usage: $(basename "$0") [secgroups]"; exit 1; }

# secgroups=$1
format="%-30s %-16s %-16s\n"

for secgroup in "${secgroups[@]}"
do
	aws ec2 describe-security-groups \
	                    --filter "Name=group-id,Values=$secgroup" \
                        --query 'SecurityGroups[].IpPermissions[].[IpProtocol,ToPort,join(`,`,IpRanges[].CidrIp)]' \
                        --output json | sort -f | xargs printf "${format}"
done      