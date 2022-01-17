# Uptime dashboard

This Helm Chart produces a Grafana dashboard displaying all trainees' [uptime applications and consoles from the OpenShift 4 Operations training](https://openshift-4-ops.training.acend.ch/docs/01/05_deploy-uptime-app/#uptime-app). It deploys a Prometheus server, Alertmanager, blackbox exporter and Grafana with preconfigured blackbox probes.

Usernames used in labs can be defined in the values.yaml file.


## Deployment

Deploy the stack to a separate k8s cluster with the following command with, e.g., release name `uptime-dashboard`:

```bash
helm install uptime-dashboard -n <namespace> ./uptime-dashboard
```

The Grafana admin password is automatically generated. Use the following command to get it:

```bash
kubectl get secret uptime-dashboard-grafana -o jsonpath="{.data.admin-password}" --namespace <namespace> | base64 --decode
```

**Note**: Make sure to change the namespace to your setup.


### Update deployment

When updating the chart, you have to pass the current Grafana admin password or it will be generated and overwritten anew each time.

Export the current password into the `GRAFANA_ADMIN_PASSWORD` variable:

```bash
export GRAFANA_ADMIN_PASSWORD=$(kubectl get secret uptime-dashboard-grafana -o jsonpath="{.data.admin-password}" --namespace <namespace> | base64 --decode)
```

Pass it to the `helm upgrade` command:

```bash
helm upgrade uptime-dashboard -n <namespace> --set grafana.adminPassword=$GRAFANA_ADMIN_PASSWORD ./uptime-dashboard
```
