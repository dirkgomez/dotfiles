#/bin/bash
stack_pattern=$1
target_directory=$2

mkdir -p $target_directory
rm -rf $target_directory/*.json

for stack_name in $(aws cloudformation describe-stacks --query "Stacks[?contains(StackName, \`$stack_pattern\`)].StackName" --output text); do
  echo "Exporting resources for $stack_name"
  aws cloudformation list-stack-resources --stack-name $stack_name > $target_directory/${stack_name}.json
done

