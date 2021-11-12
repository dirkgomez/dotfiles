SFN_ARN=$1
COUNTER=1
for execution in `aws stepfunctions list-executions --state-machine-arn $SFN_ARN --query 'executions[?status==\`RUNNING\`].executionArn' --output text`; do
    echo "Execution $COUNTER "
    aws stepfunctions stop-execution --execution-arn $execution &
    COUNTER=$[$COUNTER +1]

    if ! (( $COUNTER % 7)) ; then
      wait
    fi
done
