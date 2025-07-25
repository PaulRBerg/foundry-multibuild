# Foundry Multibuild

A GitHub Action for testing that a Foundry project can be built with a range of Solidity versions.

This is useful to continuously check that your Solidity project remains compatible with all compiler versions allowed by
your [pragma][pragma].

## Usage

Tip: you probably don't want to run this action on every push to your repository. Instead, you may want to run it on a
cron schedule, e.g., once per week.

```yml
- uses: PaulRBerg/foundry-multibuild@v1
  with:
    min: "0.8.0"
    max: "0.8.30"
    skip-test: "true"
```

## Inputs

| Name        | Required | Default | Description                                  |
| ----------- | -------- | ------- | -------------------------------------------- |
| `min`       | Yes      | 0.8.0   | Minimum Solidity version to build with       |
| `max`       | Yes      | 0.8.30  | Maximum Solidity version to build with       |
| `skip-test` | No       | True    | Whether to skip compiling the test directory |

## Examples

See how this action is used in the wild:

- [Sablier Lockup](https://github.com/sablier-labs/lockup/blob/main/.github/workflows/ci-multibuild.yml)
- [PRBMath](https://github.com/PaulRBerg/prb-math/blob/main/.github/workflows/multibuild.yml)
- [PRBTest](https://github.com/PaulRBerg/prb-test/blob/main/.github/workflows/multibuild.yml)

## License

This project is licensed under MIT.

<!-- Links -->

[pragma]: https://docs.soliditylang.org/en/develop/layout-of-source-files.html#version-pragma
