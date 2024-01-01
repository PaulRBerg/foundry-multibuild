# Foundry Multibuild

A GitHub Action for testing that a Foundry project can be built with a range of Solidity versions.

This is useful if you've created a reusable Solidity project and you want to continuously check that your files remain
compatible with all compiler versions allowed by your [version pragma][version-pragma].

## CI Use

```yaml
- uses: PaulRBerg/foundry-multibuild
  with:
    min: "0.8.0"
    max: "0.8.23"
```

## Inputs

| Name  | Description                            | Default  | Required |
| ----- | -------------------------------------- | -------- | -------- |
| `min` | Minimum Solidity version to build with | `0.8.0`  | Yes      |
| `max` | Maximum Solidity version to build with | `0.8.23` | Yes      |

## Manual Use

This is how to run the [`multibuild.sh`](./src/multibuild.sh) script directly:

```shell
./scr/multibuild.sh MIN_VERSION MAX_VERSION
```

For example, if you want to build using all Solidity versions from v0.8.0 to v0.8.23, use the following command:

```shell
./src/multibuild.sh 0.8.0 0.8.23
```

## License

This project is licensed under MIT.

<!-- Links -->

[version-pragma]: https://docs.soliditylang.org/en/v0.8.23/layout-of-source-files.html?highlight=pragma#version-pragma
