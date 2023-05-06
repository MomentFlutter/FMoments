# Config

- [Config](#config)
  - [Overview](#overview)
  - [Dependencies](#dependencies)
  
## Overview

We are using `.env` file to pass certain configuration to app.
Env file's  name depends on the environment you are working within.
Examples
- For Local -> local.env
- For Prod -> prod.env

You can pass current environment by adding `--dart-define=ENV=<<YOUR ENV>>` to run command.

## Dependencies
- [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv)
