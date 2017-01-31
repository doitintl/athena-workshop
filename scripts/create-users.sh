while read p; do
  aws iam create-user --user-name $p
  aws iam update-login-profile --user-name $p --password iLoveAthena2017 --password-reset-required
  aws iam add-user-to-group --user-name $p --group-name athena-workshop
  aws iam create-access-key --user-name $p | jq -r '.AccessKey | $p + ", " + .AccessKeyId + ", " + .SecretAccessKey' >> mail.csv
done <students.txt