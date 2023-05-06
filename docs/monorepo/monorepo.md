# Monorepo
## What is Monorepo?
Monorepos or "monolithic repositories", are single repositories containing multiple apps or packages.
It can help speed up development for larger projects, makes it easier to share code, and act as a
single source of truth. But it also adds more complexity, and often requires specific tooling
configuration.

### Advantages
1. Code reuse: A monorepo enables you to split your codebase into small independent packages, which is
great for code reuse and testing
2. Better CI: With a monorepo, you can easily trigger the CI when changing something else in your
repository (for example, you can trigger Flutter integration tests when making changes to the back end)
3. Dependency management: You have local packages without needing a dependency manager, like pub.dev
4. Enforces layered architecture: You can require yourself and your team to apply a layered
architecture by splitting the layers into multiple packages
5. Keeps everything stored in one place: New developers simply clone the monorepo and have everything
in one repository


### Disadvantage
1. More overhead: You need to set up tools to manage the repository
2. No per-project access control: When you have everything in one repository, everyone with repository access can access everything


In flutter to manage monorepo we need tools, as flutter project manager doesn't provides feature to support monorepo.
Tools provide excellent way to manage monorepo.Advantageously it provide features like, Getting the dependencies,
Checking linting & formatting, Running tests for all packages etc. In order to deal with these tasks more quickly,
we can use community tools, like Melos, Very Good CLI, or Sidekick.

For Flutter Starter, we are using melos as it is used by many open source projects like [FlutterFire](https://github.com/firebase/flutterfire),
[Plus Plugins](https://github.com/fluttercommunity/plus_plugins), [Riverpod](https://github.com/rrousselGit/riverpod)

## Usage

### Install Melos
```shell
flutter pub global activate melos
```

### Install Dependencies
To install flutter dependencies run the following commands

```shell
flutter pub global run melos bootstrap
```
or we can use make commands that are already configured

```shell
make bootstrap
```
### Run Analysis, Format and Test
 Run the following commands to execute Analysis, Format and Test

```shell
flutter pub global run melos run analyze
flutter pub global run melos run format
flutter pub global run melos run test
```

or we can use make commands as mentioned below:

```shell
make run/analyze
make run/format
make run/test
```

### Run app in different devices

Run command to list all the devices
```shell
flutter devives
# OR
make list-devices
```

To run app we can pass prefix of devices in below mention commands:
```shell
make app/<DEVICE PREFIX>
```

Default Flavor and Build Type is development and debug respectively. We can change them by passing FLAVOR and B_TYPE in make command as follows:

```shell
make app/<DEVICE PREFIX> FLAVOR=<FLAVOR> B_TYPE=<Build_Type>
```

## Adding new commands in melos

To add new commandS in melos, we need to modify melos.yaml file. Under scripts we can add commands in following format.

```yaml
<COMMAND NAME>:
  run: <COMMAND TO BE RUN>
  description: <DESCRIPTION OF COMMAND>
```

For further information we can refer the melos documentation [https://melos.invertase.dev/](https://melos.invertase.dev/)
