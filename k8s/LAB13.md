# DevOps Lab 13

## Results

```

> kubectl get po,sts,svc,pvc

NAME                    READY   STATUS    RESTARTS   AGE
pod/devops-workflow-0   1/1     Running   0          49s
pod/devops-workflow-1   1/1     Running   0          49s
pod/devops-workflow-2   1/1     Running   0          49s

NAME                               READY   AGE
statefulset.apps/devops-workflow   3/3     49s

NAME                              TYPE            CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/devops-devops-workflow    LoadBalancer    10.109.59.6    <pending>     5000:30396/TCP   7d2h
service/devops-workflow           LoadBalancer    10.102.86.67   <pending>     8000:31791/TCP   49s
service/kubernetes                ClusterIP       10.96.0.1      <none>        443/TCP          14d

NAME                                              STATUS   VOLUME                                     CAPACITY    ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/visits-devops-workflow-0    Bound    pvc-2a04dc20-cca6-4436-9cd7-efb29dd36152   256M        RWO            standard       28m
persistentvolumeclaim/visits-devops-workflow-1    Bound    pvc-783ec4cb-05e1-446a-9567-1ded48366461   256M        RWO            standard       28m
persistentvolumeclaim/visits-devops-workflow-2    Bound    pvc-235744dc-212f-4522-aa1f-2901db888f59   256M        RWO            standard       28m

```

## Pods data

```

bash

> kubectl exec pod/devops-workflow-0 -- tail -n 3 media/visits.txt 

2021-10-04 20:43:34.531312+01:00
2021-10-04 20:43:20.760160+01:00
2021-10-04 20:43:23.753237+01:00

> kubectl exec pod/devops-workflow-1 -- tail -n 3 media/visits.txt 

2021-10-04 20:43:40.598310+01:00
2021-10-04 20:43:31.593093+01:00
2021-10-04 20:43:36.594332+01:00

> kubectl exec pod/devops-workflow-2 -- tail -n 3 media/visits.txt 

2021-10-04 20:43:37.330573+01:00
2021-10-04 20:43:34.329854+01:00
2021-10-04 20:43:21.329791+01:00

```

## Additional notes

### **Explain why for our app ordering guarantee are unnecessary**

We can launch our pods in parallel, because pods do not depends on other pods. 

### **Launch all pods in parallel**

To launch all pods in parallel (instead in OrderedReady Policy), field `.spec.podManagementPolicy` needs to be changed to `Parallel`.

```

> kubectl get po,sts,svc,pvc

NAME                     READY    STATUS    RESTARTS    AGE
pod/devops-workflow-0    0/1      Running   0           34s
pod/devops-workflow-1    0/1      Running   0           34s
pod/devops-workflow-2    0/1      Running   0           34s

NAME                        READY   AGE
statefulset.apps/time-app   0/3     34s

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)          AGE
service/kubernetes   ClusterIP      10.96.0.1      <none>         443/TCP          14d
service/time-app     LoadBalancer   10.96.76.150   10.96.76.150   5000:30858/TCP   34s

NAME                                             STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/visits-devops-workflow-0   Bound    pvc-14306611-512d-4686-8def-8c7b06fd3781   256M       RWO            standard       107m
persistentvolumeclaim/visits-devops-workflow-1   Bound    pvc-1f2740b2-54f6-4f80-8810-e96cc1d63463   256M       RWO            standard       107m
persistentvolumeclaim/visits-devops-workflow-2   Bound    pvc-a40c8878-9928-4ac9-94c4-420ad0fe8e79   256M       RWO            standard       107m

```