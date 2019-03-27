This folder contains a list of samples devfiles for Eclipse Che workspaces. 

You can use them to start a Che workspace:

- With a Che Factory: 
```
https://<your-che-host>/f?url=https://raw.githubusercontent.com/redhat-developer/devfile/master/samples/<selected_sample>/devfile.yaml
```
  
- With cURL (Requires clone the repo) : 
```
curl -X POST  -H "Authorization: <TOKEN>" -H "Content-Type: application/yaml" -d "data=@path/to/devfile.yaml"  https://<your-che-host>/api/devfile
```

- With [chectl](https://github.com/che-incubator/chectl/) (Requires clone the repo): 
```
chectl workspace:start --devfile=path/to/devfile.yaml
```