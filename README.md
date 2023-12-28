# Foundry Multibuild

A GitHub Action for building a Foundry project with a range of Solidity versions.

This is useful if you're building a Solidity library and you want to continuously check that your files remain
compatible with all compiler versions allowed by your [version pragma][version-pragma].

## Manual Use

This is how you can run the `multibuild.sh` script directly:

```shell
./scr/multibuild.sh MIN_VERSION MAX_VERSION
```

For instance, if you want to build using all Solidity versions from v0.8.0 to v0.8.23, use the following command:

```shell
./src/multibuild.sh 0.8.0 0.8.23
```

## License

This project is licensed under MIT.

<!-- Links -->

[version-pragma]: https://docs.soliditylang.org/en/v0.8.23/layout-of-source-files.html?highlight=pragma#version-pragma
