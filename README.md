# OpenShift Operations Training Setup

This repository contains resources necessary for the Openshift Operations Training.


## Initial setup

Initially, deploy the AppProject and ApplicationSet resources in the `deploy/` directory:

```
oc apply -f deploy/appproject_openshift-operations.yaml
oc apply -f deploy/applicationset_openshift-operations.yaml
```

These create an AppProject called `openshift-operations` and an ApplicationSet which in turn creates an Argo CD application for all directories inside `deploy/`.

The ApplicationSet expects a `config.json` file and the following directory structure:

```
deploy/
├── ...
└── uptime-dashboard
    ├── base
    │   ├── ...
    │   └── kustomization.yaml
    └── overlays
        └── prod <- stage
            ├── ...
            ├── config.json <- JSON-formatted config file containing the namespace
            └── kustomization.yaml
```

The `config.json` file needs to define the namespace the Application has to be deployed in, e.g.:

```
{
  "namespace": "rename-me"
}
```
