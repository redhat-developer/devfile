# Devfile object Schema

```

```

This schema describes the structure of the devfile object

| Abstract            | Extensible | Status       | Identifiable | Custom Properties | Additional Properties | Defined In |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | ---------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             |            |

# Devfile object Properties

| Property                  | Type       | Required     | Nullable | Defined by                   |
| ------------------------- | ---------- | ------------ | -------- | ---------------------------- |
| [apiVersion](#apiversion) | `const`    | **Required** | No       | Devfile object (this schema) |
| [attributes](#attributes) | `object`   | Optional     | No       | Devfile object (this schema) |
| [commands](#commands)     | `object[]` | Optional     | No       | Devfile object (this schema) |
| [components](#components) | `object[]` | Optional     | No       | Devfile object (this schema) |
| [metadata](#metadata)     | `object`   | **Required** | No       | Devfile object (this schema) |
| [projects](#projects)     | `object[]` | Optional     | No       | Devfile object (this schema) |

## apiVersion

### Devfile API Version

`apiVersion`

- is **required**
- type: `const`
- defined in this schema

The value of this property **must** be equal to:

```json
"1.0.0"
```

## attributes

`attributes`

- is optional
- type: `object`
- defined in this schema

### attributes Type

`object` with following properties:

| Property | Type | Required |
| -------- | ---- | -------- |


## commands

### The Commands List

Description of the predefined commands to be available in workspace

`commands`

- is optional
- type: `object[]`
- defined in this schema

### commands Type

Array type: `object[]`

All items must be of the type: `object` with following properties:

| Property     | Type   | Required     |
| ------------ | ------ | ------------ |
| `actions`    | array  | **Required** |
| `attributes` |        | Optional     |
| `name`       | string | **Required** |

#### actions

##### The Command Actions List

List of the actions of given command. Now the only one command must be specified in list but there are plans to
implement supporting multiple actions commands.

`actions`

- is **required**
- type: `object[]`\* between `1` and `1` items in the array

##### actions Type

Array type: `object[]`

All items must be of the type: `object` with following properties:

| Property           | Type   | Required |
| ------------------ | ------ | -------- |
| `command`          | string | Optional |
| `component`        | string | Optional |
| `reference`        | string | Optional |
| `referenceContent` | string | Optional |
| `type`             | string | Optional |
| `workdir`          | string | Optional |

#### command

The actual action command-line string

`command`

- is optional
- type: `string`

##### command Type

`string`

##### command Example

```json
mvn package
```

#### component

Describes component to which given action relates

`component`

- is optional
- type: `string`

##### component Type

`string`

##### component Example

```json
mvn - stack
```

#### reference

the path relative to the location of the devfile to the configuration file defining one or more actions in the
editor-specific format

`reference`

- is optional
- type: `string`

##### reference Type

`string`

##### reference Example

```json
../ide-config/launch.json
```

#### referenceContent

The content of the referenced configuration file that defines one or more actions in the editor-specific format

`referenceContent`

- is optional
- type: `string`

##### referenceContent Type

`string`

##### referenceContent Example

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "type": "typescript",
      "tsconfig": "tsconfig.json",
      "problemMatcher": ["$tsc"],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    }
  ]
}
```

#### type

Describes action type

`type`

- is optional
- type: `string`

##### type Type

`string`

##### type Example

```json
exec
```

#### workdir

Working directory where the command should be executed

`workdir`

- is optional
- type: `string`

##### workdir Type

`string`

##### workdir Example

```json
/projects/spring-petclinic
```

#### attributes

Additional command attributes

`attributes`

- is optional
- type: reference

##### attributes Type

- []() – `#/definitions/attributes`

#### name

Describes the name of the command. Should be unique per commands set.

`name`

- is **required**
- type: `string`

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

- is optional
- type: `object[]`
- defined in this schema

### components Type

Array type: `object[]`

All items must be of the type: `object` with following properties:

| Property       | Type    | Required     | Default   |
| -------------- | ------- | ------------ | --------- |
| `alias`        | string  | Optional     |           |
| `mountSources` | boolean | Optional     | `"false"` |
| `type`         |         | **Required** |           |

#### alias

The name using which other places of this devfile (like commands) can refer to this component. This attribute is
optional but must be unique in the devfile if specified.

`alias`

- is optional
- type: `string`

##### alias Type

`string`

##### alias Example

```json
mvn - stack
```

#### mountSources

Describes whether projects sources should be mount to the component. `CHE_PROJECTS_ROOT` environment variable should
contains a path where projects sources are mount

`mountSources`

- is optional
- type: `boolean`
- default: `"false"`

##### mountSources Type

`boolean`

#### type

Describes type of the component, e.g. whether it is an plugin or editor or other type

`type`

- is **required**
- type: `enum`

The value of this property **must** be equal to one of the [known values below](#components-known-values).

##### type Known Values

| Value         | Description |
| ------------- | ----------- |
| `cheEditor`   |             |
| `chePlugin`   |             |
| `kubernetes`  |             |
| `openshift`   |             |
| `dockerimage` |             |

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

## metadata

`metadata`

- is **required**
- type: `object`
- defined in this schema

### metadata Type

`object` with following properties:

| Property       | Type   | Required |
| -------------- | ------ | -------- |
| `generateName` | string | Optional |
| `name`         | string | Optional |

#### generateName

##### Devfile Generate Name

Workspaces created from devfile, will use it as base and append random suffix. It's used when name is not defined.

`generateName`

- is optional
- type: `string`

##### generateName Type

`string`

- minimum length: 1 characters

##### generateName Example

```json
petclinic-
```

#### name

##### Devfile Name

The name of the devfile. Workspaces created from devfile, will inherit this name

`name`

- is optional
- type: `string`

##### name Type

`string`

- minimum length: 1 characters

##### name Example

```json
petclinic - dev - environment
```

## projects

### The Projects List

Description of the projects, containing names and sources locations

`projects`

- is optional
- type: `object[]`
- defined in this schema

### projects Type

Array type: `object[]`

All items must be of the type: `object` with following properties:

| Property    | Type   | Required     |
| ----------- | ------ | ------------ |
| `clonePath` | string | Optional     |
| `name`      | string | **Required** |
| `source`    | object | **Required** |

#### clonePath

The path relative to the root of the projects to which this project should be cloned into. This is a unix-style
relative path (i.e. uses forward slashes). The path is invalid if it is absolute or tries to escape the project root
through the usage of '..'. If not specified, defaults to the project name.

`clonePath`

- is optional
- type: `string`

##### clonePath Type

`string`

#### name

##### The Project Name

`name`

- is **required**
- type: `string`

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

- is **required**
- type: `object`

##### source Type

`object` with following properties:

| Property            | Type   | Required     |
| ------------------- | ------ | ------------ |
| `branch`            | string | Optional     |
| `commitId`          | string | Optional     |
| `location`          | string | **Required** |
| `sparseCheckoutDir` | string | Optional     |
| `startPoint`        | string | Optional     |
| `tag`               | string | Optional     |
| `type`              | string | **Required** |

#### branch

The name of the of the branch to check out after obtaining the source from the location. The branch has to already
exist in the source otherwise the default branch is used. In case of git, this is also the name of the remote branch to
push to.

`branch`

- is optional
- type: `string`

##### branch Type

`string`

##### branch Examples

```json
master
```

```json
feature - 42
```

#### commitId

The id of the commit to reset the checked out branch to. Note that this is equivalent to 'startPoint' and provided for
convenience.

`commitId`

- is optional
- type: `string`

##### commitId Type

`string`

##### commitId Example

```json
349d3ad
```

#### location

Project's source location address. Should be URL for git and github located projects, or file:// for zip.

`location`

- is **required**
- type: `string`

##### location Type

`string`

##### location Example

```json
git@github.com:spring-projects/spring-petclinic.git
```

#### sparseCheckoutDir

Part of project to populate in the working directory.

`sparseCheckoutDir`

- is optional
- type: `string`

##### sparseCheckoutDir Type

`string`

##### sparseCheckoutDir Examples

```json
/core/
```

```json
core/
```

```json
core
```

```json
/wsmaster/che-core-api-workspace/
```

```json
/d*
```

#### startPoint

The tag or commit id to reset the checked out branch to.

`startPoint`

- is optional
- type: `string`

##### startPoint Type

`string`

##### startPoint Examples

```json
release / 4.2
```

```json
349d3ad
```

```json
v4.2.0
```

#### tag

The name of the tag to reset the checked out branch to. Note that this is equivalent to 'startPoint' and provided for
convenience.

`tag`

- is optional
- type: `string`

##### tag Type

`string`

##### tag Example

```json
v4.2.0
```

#### type

Project's source type.

`type`

- is **required**
- type: `string`

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
