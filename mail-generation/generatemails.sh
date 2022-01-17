#!/bin/bash

# Set the sender address as the default account in evolution before generating the mails.
# Expected data input is a csv file with the following fields:
# username firstname name mail slackmail ipaddr
# e.g.:
# user00,Max,Muster,invalid@notexistent,invalid@notexistent,1.2.3.4

accounts=accounts_test.csv
#accounts=accounts.csv
subject="Infos zum OpenShift 4 Operations Training"

while IFS=, read -r username firstname name mail slackmail ipaddr
do
  evolution mailto:"${mail}"?subject="${subject}"\&body="Hallo $firstname,

Hier alle Infos, die du für die Durchführung des OpenShift Operations-Trainings benötigst:

- Labs URL: https://openshift-4-ops.training.acend.ch/
- Username: ${username}
- Bastion Host IP: $ipaddr
- Bastion Host Username: ec2-user
- Slack URL: https://acend-workspace.slack.com
- Slack Join URL: FIXME

Beste Grüsse
Chrigu und Benj"
done < $accounts
