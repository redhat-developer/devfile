
# Devfile object Schema

```
```

This schema describes the structure of the devfile object

| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | Yes | Experimental | No | Forbidden | Forbidden | [devfile.json](devfile.json) |

# Devfile object Properties

| Property | Type | Required | Nullable | Defined by |
|----------|------|----------|----------|------------|
| [attributes](#attributes) | `object` | Optional  | No | Devfile object (this schema) |
| [commands](#commands) | `object[]` | Optional  | No | Devfile object (this schema) |
| [components](#components) | `object[]` | Optional  | No | Devfile object (this schema) |
| [name](#name) | `string` | **Required**  | No | Devfile object (this schema) |
| [projects](#projects) | `object[]` | Optional  | No | Devfile object (this schema) |
| [apiVersion](#apiversion) | `string` | **Required**  | No | Devfile object (this schema) |
| [metadata](#metadata) | `object` | **Required** | No | Devfile object (this schema) |

## attributes


`attributes`

* is optional
* type: `object`
* defined in this schema

### attributes Type


`object` with following properties:


| Property | Type | Required |
|----------|------|----------|






## commands
### The Commands List

Description of the predefined commands to be available in workspace

`commands`

* is optional
* type: `object[]`
* defined in this schema

### commands Type


Array type: `object[]`

All items must be of the type:
`object` with following properties:


| Property | Type | Required |
|----------|------|----------|
| `actions`| array | **Required** |
| `attributes`|  | Optional |
| `name`| string | **Required** |



#### actions
##### The Command Actions List

List of the actions of given command. Now the only one command must be specified in list but there are plans to implement supporting multiple actions commands.

`actions`

* is **required**
* type: `object[]`* between `1` and `1` items in the array


##### actions Type


Array type: `object[]`

All items must be of the type:
`object` with following properties:


| Property | Type | Required |
|----------|------|----------|
| `command`| string | **Required** |
| `component`| string | **Required** |
| `type`| string | **Required** |
| `workdir`| string | Optional |



#### command

The actual action command-line string

`command`

* is **required**
* type: `string`

##### command Type


`string`






##### command Example

```json
mvn package
```




#### component

Describes component to which given action relates

`component`

* is **required**
* type: `string`

##### component Type


`string`






##### component Example

```json
mvn-stack
```




#### type

Describes action type

`type`

* is **required**
* type: `string`

##### type Type


`string`






##### type Example

```json
exec
```




#### workdir

Working directory where the command should be executed

`workdir`

* is optional
* type: `string`

##### workdir Type


`string`






##### workdir Example

```json
/projects/spring-petclinic
```











#### attributes

Additional command attributes

`attributes`

* is optional
* type: reference

##### attributes Type


* []() – `#/definitions/attributes`







#### name

Describes the name of the command. Should be unique per commands set.

`name`

* is **required**
* type: `string`

##### name Type


`string`






##### name Example

```json
build
```









## components
### The Components List

Description of the workspace components, such as editor and plugins

`components`

* is optional
* type: `object[]`
* defined in this schema

### components Type


Array type: `object[]`

All items must be of the type:
`object` with following properties:


| Property | Type | Required | Default |
|----------|------|----------|---------|
| `alias`| string | Optional |  |
| `args`| array | Optional | `null` |
| `command`| array | Optional | `null` |
| `endpoints`| array | Optional |  |
| `entrypoints`| array | Optional |  |
| `env`| array | Optional |  |
| `id`| string | Optional |  |
| `image`| string | Optional |  |
| `memoryLimit`| string | Optional |  |
| `mountSources`| boolean | Optional | `"false"` |
| `reference`| string | Optional |  |
| `referenceContent`| string | Optional |  |
| `selector`|  | Optional |  |
| `type`| string | **Required** |  |
| `volumes`| array | Optional |  |



#### alias

The name using which other places of this devfile (like commands) can refer to this component. This attribute is optional but must be unique in the devfile if specified.

`alias`

* is optional
* type: `string`

##### alias Type


`string`






##### alias Example

```json
mvn-stack
```




#### args

The arguments to supply to the command running the dockerimage component. The arguments are supplied either to the default command provided in the image or to the overridden command. Defaults to null, meaning use whatever is defined in the image.

`args`

* is optional
* type: `string[]`
* default: `null`


##### args Type


Array type: `string[]`

All items must be of the type:
`string`








##### args Example

```json
['-R', '-f']
```




#### command

The command to run in the dockerimage component instead of the default one provided in the image. Defaults to null, meaning use whatever is defined in the image.

`command`

* is optional
* type: `string[]`
* default: `null`


##### command Type


Array type: `string[]`

All items must be of the type:
`string`








##### command Example

```json
['/bin/sh', '-c']
```




#### endpoints

Describes dockerimage component endpoints

`endpoints`

* is optional
* type: `array`


##### endpoints Type


Array type: `array`

All items must be of the type:
Unknown type ``.

```json
{
  "type": "array",
  "description": "Describes dockerimage component endpoints",
  "items": {
    "name": "object",
    "description": "Describes dockerimage component endpoint",
    "required": [
      "name",
      "port"
    ],
    "properties": {
      "name": {
        "type": "string",
        "title": "The Endpoint Name",
        "description": "The Endpoint name"
      },
      "port": {
        "type": "integer",
        "title": "The Endpoint Port",
        "description": "The container port that should be used as endpoint"
      },
      "attributes": {
        "type": "object",
        "public": {
          "type": "boolean",
          "description": "Identifies endpoint as workspace internally or externally accessible.",
          "default": "true"
        },
        "secure": {
          "type": "boolean",
          "description": "Identifies server as secure or non-secure. Requests to secure servers will be authenticated and must contain machine token",
          "default": "false"
        },
        "discoverable": {
          "type": "boolean",
          "description": "Identifies endpoint as accessible by its name.",
          "default": "false"
        },
        "protocol": {
          "type": "boolean",
          "description": "Defines protocol that should be used for communication with endpoint. Is used for endpoint URL evaluation"
        },
        "additionalProperties": {
          "type": "string"
        },
        "javaType": "java.util.Map<String, String>"
      }
    },
    "simpletype": "complex"
  },
  "simpletype": "`array`"
}
```


  
Describes dockerimage component endpoint









#### entrypoints


`entrypoints`

* is optional
* type: `object[]`


##### entrypoints Type


Array type: `object[]`

All items must be of the type:
`object` with following properties:


| Property | Type | Required | Default |
|----------|------|----------|---------|
| `args`| array | Optional | `null` |
| `command`| array | Optional | `null` |
| `containerName`| string | Optional |  |
| `parentName`| string | Optional |  |
| `parentSelector`|  | Optional |  |



#### args

The arguments to supply to the command running the component. The arguments are supplied either to the default command provided in the image of the container or to the overridden command. Defaults to null, meaning use whatever is defined in the image.

`args`

* is optional
* type: `string[]`
* default: `null`


##### args Type


Array type: `string[]`

All items must be of the type:
`string`








##### args Example

```json
['-R', '-f']
```




#### command

The command to run in the component instead of the default one provided in the image of the container. Defaults to null, meaning use whatever is defined in the image.

`command`

* is optional
* type: `string[]`
* default: `null`


##### command Type


Array type: `string[]`

All items must be of the type:
`string`








##### command Example

```json
['/bin/sh', '-c']
```




#### containerName

The name of the container to apply the entrypoint to. If not specified, the entrypoint is modified on all matching containers.

`containerName`

* is optional
* type: `string`

##### containerName Type


`string`









#### parentName

The name of the top level object in the referenced object list in which to search for containers. If not specified, the objects to search through can have any name.

`parentName`

* is optional
* type: `string`

##### parentName Type


`string`









#### parentSelector

The selector on labels of the top level objects in the referenced list in which to search for containers. If not specified, the objects to search through can have any labels.

`parentSelector`

* is optional
* type: reference

##### parentSelector Type


* []() – `#/definitions/selector`














#### env

The environment variables list that should be set to docker container

`env`

* is optional
* type: `object[]`


##### env Type


Array type: `object[]`

All items must be of the type:
`object` with following properties:


| Property | Type | Required |
|----------|------|----------|
| `name`| string | **Required** |
| `value`| string | **Required** |



#### name
##### The Environment Variable Name

The environment variable name

`name`

* is **required**
* type: `string`

##### name Type


`string`









#### value
##### The Environment Variable Value

The environment variable value

`value`

* is **required**
* type: `string`

##### value Type


`string`









  
Describes environment variable









#### id

Describes the component id. It has the following format: [{REGISTRY_URL}/]{plugin/editor ID}:{plugin/editor VERSION}, where `{REGISTRY_URL}/` is an optional part.

`id`

* is optional
* type: `string`

##### id Type


`string`



All instances must conform to this regular expression 
```regex
^((https?://)[a-zA-Z0-9_\-./]+/)?[a-z0-9_\-.]+/[a-z0-9_\-.]+/[a-z0-9_\-.]+$
```

* test example: [org.eclipse.che.maven-jdk8:1.0.0](https://regexr.com/?expression=%5E((https%3F%3A%2F%2F)%5Ba-zA-Z0-9_%5C-.%2F%5D%2B%2F)%3F%5Ba-z0-9_%5C-.%5D%2B%2F%5Ba-z0-9_%5C-.%5D%2B%2F%5Ba-z0-9_%5C-.%5D%2B%24&text=org.eclipse.che.maven-jdk8%3A1.0.0)
* test example: [https://che-plugin-registry.openshift.io/org.eclipse.che.maven-jdk8:1.0.0](https://regexr.com/?expression=%5E((https%3F%3A%2F%2F)%5Ba-zA-Z0-9_%5C-.%2F%5D%2B%2F)%3F%5Ba-z0-9_%5C-.%5D%2B%2F%5Ba-z0-9_%5C-.%5D%2B%2F%5Ba-z0-9_%5C-.%5D%2B%24&text=https%3A%2F%2Fche-plugin-registry.openshift.io%2Forg.eclipse.che.maven-jdk8%3A1.0.0)




##### id Examples

```json
org.eclipse.che.maven-jdk8:1.0.0
```

```json
https://che-plugin-registry.openshift.io/org.eclipse.che.maven-jdk8:1.0.0
```





#### image

Specifies the docker image that should be used for component

`image`

* is optional
* type: `string`

##### image Type


`string`






##### image Example

```json
eclipse/maven-jdk8:1.0.0
```




#### memoryLimit

Describes memory limit for the component. You can express memory as a plain integer or as a fixed-point integer using one of these suffixes: E, P, T, G, M, K. You can also use the power-of-two equivalents: Ei, Pi, Ti, Gi, Mi, Ki

`memoryLimit`

* is optional
* type: `string`

##### memoryLimit Type


`string`






##### memoryLimit Examples

```json
128974848
```

```json
129e6
```

```json
129M
```

```json
123Mi
```





#### mountSources

Describes whether projects sources should be mount to the component. `CHE_PROJECTS_ROOT` environment variable should contains a path where projects sources are mount

`mountSources`

* is optional
* type: `boolean`
* default: `"false"`


##### mountSources Type


`boolean`







#### reference

Describes absolute or devfile-relative location of Kubernetes list yaml file. Applicable only for 'kubernetes' and 'openshift' type components

`reference`

* is optional
* type: `string`

##### reference Type


`string`






##### reference Example

```json
petclinic-app.yaml
```




#### referenceContent

Inlined content of a file specified in field 'reference'

`referenceContent`

* is optional
* type: `string`

##### referenceContent Type


`string`






##### referenceContent Example

```json
{"kind":"List","items":[{"apiVersion":"v1","kind":"Pod","metadata":{"name":"ws"},"spec":{"containers":[{"image":"eclipse/che-dev:nightly"}]}}]}
```




#### selector

Describes the objects selector for the recipe type components. Allows to pick-up only selected items from k8s/openshift list

`selector`

* is optional
* type: reference

##### selector Type


* []() – `#/definitions/selector`



##### selector Example

```json
{
   "app.kubernetes.io/name" : "mysql", 
   "app.kubernetes.io/component" : "database", 
   "app.kubernetes.io/part-of" : "petclinic" 
}
```




#### type

Describes type of the component, e.g. whether it is an plugin or editor or other type

`type`

* is **required**
* type: `string`

##### type Type


`string`






##### type Examples

```json
chePlugin
```

```json
cheEditor
```

```json
kubernetes
```

```json
openshift
```

```json
dockerimage
```





#### volumes

Describes volumes which should be mount to component

`volumes`

* is optional
* type: `object[]`


##### volumes Type


Array type: `object[]`

All items must be of the type:
`object` with following properties:


| Property | Type | Required |
|----------|------|----------|
| `containerPath`| string | **Required** |
| `name`| string | **Required** |



#### containerPath
##### The path where volume should be mount to container


`containerPath`

* is **required**
* type: `string`

##### containerPath Type


`string`






##### containerPath Example

```json
/home/user/data
```




#### name
##### The Volume Name

The volume name. If several components mount the same volume then they will reuse the volume and will be able to access to the same files

`name`

* is **required**
* type: `string`

##### name Type


`string`






##### name Example

```json
my-data
```



  
Describe volume that should be mount to component














## name
### Devfile Name

The name of the devfile. Workspaces created from devfile, will inherit this name

`name`

* is **required**
* type: `string`
* defined in this schema

### name Type


`string`






### name Example

```json
"petclinic-dev-environment"
```


## projects
### The Projects List

Description of the projects, containing names and sources locations

`projects`

* is optional
* type: `object[]`
* defined in this schema

### projects Type


Array type: `object[]`

All items must be of the type:
`object` with following properties:


| Property | Type | Required |
|----------|------|----------|
| `clonePath`| string | Optional |
| `name`| string | **Required** |
| `source`| object | **Required** |



#### clonePath

The path relative to the root of the projects to which this project should be cloned into. This is a unix-style relative path (i.e. uses forward slashes). The path is invalid if it is absolute or tries to escape the project root through the usage of '..'. If not specified, defaults to the project name.

`clonePath`

* is optional
* type: `string`

##### clonePath Type


`string`









#### name
##### The Project Name


`name`

* is **required**
* type: `string`

##### name Type


`string`






##### name Example

```json
petclinic
```




#### source
##### The Project Source object

Describes the project's source - type and location

`source`

* is **required**
* type: `object`

##### source Type


`object` with following properties:


| Property | Type | Required |
|----------|------|----------|
| `branch`| string | Optional |
| `commitId`| string | Optional |
| `location`| string | **Required** |
| `startPoint`| string | Optional |
| `tag`| string | Optional |
| `type`| string | **Required** |



#### branch

The name of the of the branch to check out after obtaining the source from the location. The branch has to already exist in the source otherwise the default branch is used. In case of git, this is also the name of the remote branch to push to.

`branch`

* is optional
* type: `string`

##### branch Type


`string`






##### branch Examples

```json
master
```

```json
feature-42
```





#### commitId

The id of the commit to reset the checked out branch to. Note that this is equivalent to 'startPoint' and provided for convenience.

`commitId`

* is optional
* type: `string`

##### commitId Type


`string`






##### commitId Example

```json
349d3ad
```




#### location

Project's source location address. Should be URL for git and github located projects, or file:// for zip.

`location`

* is **required**
* type: `string`

##### location Type


`string`






##### location Example

```json
git@github.com:spring-projects/spring-petclinic.git
```




#### startPoint

The tag or commit id to reset the checked out branch to.

`startPoint`

* is optional
* type: `string`

##### startPoint Type


`string`






##### startPoint Examples

```json
release/4.2
```

```json
349d3ad
```

```json
v4.2.0
```





#### tag

The name of the tag to reset the checked out branch to. Note that this is equivalent to 'startPoint' and provided for convenience.

`tag`

* is optional
* type: `string`

##### tag Type


`string`






##### tag Example

```json
v4.2.0
```




#### type

Project's source type.

`type`

* is **required**
* type: `string`

##### type Type


`string`






##### type Examples

```json
git
```

```json
github
```

```json
zip
```















## apiVersion
### Devfile API Version

`apiVersion`

* is **required**
* type: `string`
* defined in this schema

### apiVersion Type


`string`






### apiVersion Example

```json
"0.0.1"
```

## metadata


`metadata`

* is required
* type: `object`
* defined in this schema

### metadata Type


`object` with following properties:


| Property | Type | Required |
|----------|------|----------|
| `name`   | string | **Required** |
