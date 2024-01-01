# Foundry Multibuild

A GitHub Action for testing that a Foundry project can be built with a range of Solidity versions.

This is useful if you've created a reusable Solidity project and you want to continuously check that your files remain
compatible with all compiler versions allowed by your [version pragma][version-pragma].

## Usage

Tip: you probably don't want to run this action on every push to your repository. Instead, you may want to run it on a
cron schedule, e.g., once per week.

```yml
- uses: PaulRBerg/foundry-multibuild@v1
  with:
    min: "0.8.0"
    max: "0.8.23"
```

## Inputs

| Name  | Description                            | Default  | Required |
| ----- | -------------------------------------- | -------- | -------- |
| `min` | Minimum Solidity version to build with | `0.8.0`  | Yes      |
| `max` | Maximum Solidity version to build with | `0.8.23` | Yes      |

## Examples

See how this action is used in the wild:

- [Sablier V2 Core](https://github.com/sablier-labs/v2-core/blob/main/.github/workflows/multibuild.yml)
- [PRBMath](https://github.com/PaulRBerg/prb-math/blob/main/.github/workflows/multibuild.yml)
- [PRBTest](https://github.com/PaulRBerg/prb-test/blob/main/.github/workflows/multibuild.yml)

## License

This project is licensed under MIT.

<!-- Links -->

[version-pragma]: https://docs.soliditylang.org/en/v0.8.23/layout-of-source-files.html?highlight=pragma#version-pragma
