# OpenShift 4 Training Trainee Cluster Monitoring

This Helm Chart deploys a Prometheus server, Alertmanager, Blackboxexporter, Grafana stack, with preconfigured blackbox probes for the console and uptime-app endpoints for each Trainee (01 - 10).

## Deployment

Deploy the stack to a separate k8s cluster with the following command, don't change the release `acend-ocp-uptime-monitoring`:

```bash
helm install acend-ocp-uptime-monitoring -n <namespace> ./openshift-4-ops-training-monitoring
```

This will automatically generate an admin password, use the following command store it in the `GRAFANA_ADMIN_PASSWORD` variable:

```bash
export GRAFANA_ADMIN_PASSWORD=$(kubectl get secret acend-ocp-uptime-monitoring-grafana -o jsonpath="{.data.admin-password}" --namespace <namespace> | base64 --decode)
```

**Note**: make sure to change the namespace to your setup

### Update Deployment

When updating your deplyoment, you have to pass the current admin password, otherwise each time will be generated a new one.

Export it

```bash
export GRAFANA_ADMIN_PASSWORD=$(kubectl get secret acend-ocp-uptime-monitoring-grafana -o jsonpath="{.data.admin-password}" --namespace <namespace> | base64 --decode)
```

Pass it to the `upgrade` command

```bash
helm upgrade acend-ocp-uptime-monitoring -n <namespace> --set grafana.adminPassword=$GRAFANA_ADMIN_PASSWORD ./openshift-4-ops-training-monitoring
```
