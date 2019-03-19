
# Devfile object Schema

```
```

This schema describes the structure of the devfile object

| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | Yes | Experimental | No | Forbidden | Forbidden | [devfile.json](devfile.json) |

# Devfile object Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [commands](#commands) | `object[]` | Optional | Devfile object (this schema) |
| [name](#name) | `string` | **Required** | Devfile object (this schema) |
| [projects](#projects) | `object[]` | Optional | Devfile object (this schema) |
| [specVersion](#specversion) | `string` | **Required** | Devfile object (this schema) |
| [tools](#tools) | `object[]` | **Required** | Devfile object (this schema) |

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
* type: `object[]`
* between `1` and `1` items in the array


##### actions Type


Array type: `object[]`

All items must be of the type:
`object` with following properties:


| Property | Type | Required |
|----------|------|----------|
| `command`| string | **Required** |
| `tool`| string | **Required** |
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




#### tool

Describes tool to which given action relates

`tool`
* is **required**
* type: `string`

##### tool Type


`string`





##### tool Example

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
| `name`| string | **Required** |
| `source`| object | **Required** |



#### name
##### The Project Name

undefined

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

Unknown type `object`.

```json
{
  "type": "object",
  "title": "The Project Source object",
  "description": "Describes the project's source - type and location",
  "required": [
    "type",
    "location"
  ],
  "properties": {
    "type": {
      "type": "string",
      "description": "Project's source type.",
      "examples": [
        "git",
        "github",
        "zip"
      ]
    },
    "location": {
      "type": "string",
      "description": "Project's source location address. Should be URL for git and github located projects, or file:// for zip.",
      "examples": [
        "git@github.com:spring-projects/spring-petclinic.git"
      ]
    }
  },
  "simpletype": "`object`"
}
```












## specVersion
### Devfile Specification Version

`specVersion`
* is **required**
* type: `string`
* defined in this schema

### specVersion Type


`string`





### specVersion Example

```json
"0.0.1"
```


## tools
### The Tools List

Description of the workspace tools, such as editor and plugins

`tools`
* is **required**
* type: `object[]`

* defined in this schema

### tools Type


Array type: `object[]`

All items must be of the type:
`object` with following properties:


| Property | Type | Required | Default |
|----------|------|----------|---------|
| `args`| array | Optional |  |
| `command`| array | Optional |  |
| `endpoints`| array | Optional |  |
| `env`| array | Optional |  |
| `id`| string | Optional |  |
| `image`| string | Optional |  |
| `local`| string | Optional |  |
| `localContent`| string | Optional |  |
| `memoryLimit`| string | Optional |  |
| `mountSources`| boolean | Optional | `"false"` |
| `name`| string | **Required** |  |
| `selector`|  | Optional |  |
| `type`| string | **Required** |  |
| `volumes`| array | Optional |  |



#### args

The arguments to supply to the command running the dockerimage tool. The arguments are supplied either to the default command provided in the image or to the overridden command.

`args`
* is optional
* type: `string[]`


##### args Type


Array type: `string[]`

All items must be of the type:
`string`







##### args Example

```json
['-R', '-f']
```




#### command

The command to run in the dockerimage tool instead of the default one provided in the image.

`command`
* is optional
* type: `string[]`


##### command Type


Array type: `string[]`

All items must be of the type:
`string`







##### command Example

```json
['/bin/sh', '-c']
```




#### endpoints

Describes dockerimage tool endpoints

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
  "description": "Describes dockerimage tool endpoints",
  "items": {
    "name": "object",
    "description": "Describes dockerimage tool endpoint",
    "required": [
      "name",
      "port"
    ],
    "properties": {
      "name": {
        "type": "string",
        "title": "The Environment Variable Name",
        "description": "The environment variable name"
      },
      "port": {
        "type": "integer",
        "title": "The Environment Variable Name",
        "description": "The environment variable name"
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


  
Describes dockerimage tool endpoint









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

Describes the tool FQN

`id`
* is optional
* type: `string`

##### id Type


`string`





##### id Example

```json
eclipse/maven-jdk8:1.0.0
```




#### image

Specifies the docker image that should be used for tool

`image`
* is optional
* type: `string`

##### image Type


`string`





##### image Example

```json
eclipse/maven-jdk8:1.0.0
```




#### local

Describes location of Kubernetes list yaml file. Applicable only for 'kubernetes' and 'openshift' type tools

`local`
* is optional
* type: `string`

##### local Type


`string`





##### local Example

```json
petclinic-app.yaml
```




#### localContent

Inlined content of a file specified in field 'local'

`localContent`
* is optional
* type: `string`

##### localContent Type


`string`





##### localContent Example

```json
{"kind":"List","items":[{"apiVersion":"v1","kind":"Pod","metadata":{"name":"ws"},"spec":{"containers":[{"image":"eclipse/che-dev:nightly"}]}}]}
```




#### memoryLimit

Describes memory limit for the tool. You can express memory as a plain integer or as a fixed-point integer using one of these suffixes: E, P, T, G, M, K. You can also use the power-of-two equivalents: Ei, Pi, Ti, Gi, Mi, Ki

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

Describes whether projects sources should be mount to the tool. `CHE_PROJECTS_ROOT` environment variable should contains a path where projects sources are mount

`mountSources`
* is optional
* type: `boolean`
* default: `"false"`


##### mountSources Type


`boolean`







#### name

Describes the name of the tool. Should be unique per tool set.

`name`
* is **required**
* type: `string`

##### name Type


`string`





##### name Example

```json
mvn-stack
```




#### selector

Describes the objects selector for the recipe type tools. Allows to pick-up only selected items from k8s/openshift list

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

Describes type of the tool, e.g. whether it is an plugin or editor or other type

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

Describes volumes which should be mount to tool

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

undefined

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

The volume name. If several tools mount the same volume then they will reuse the volume and will be able to access to the same files

`name`
* is **required**
* type: `string`

##### name Type


`string`





##### name Example

```json
my-data
```



  
Describe volume that should be mount to tool













