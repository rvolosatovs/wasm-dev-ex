{
  nixConfig.extra-substituters = [
    "https://wasmcloud.cachix.org"
    "https://nixify.cachix.org"
    "https://crane.cachix.org"
    "https://bytecodealliance.cachix.org"
    "https://nix-community.cachix.org"
    "https://cache.garnix.io"
  ];
  nixConfig.extra-trusted-public-keys = [
    "wasmcloud.cachix.org-1:9gRBzsKh+x2HbVVspreFg/6iFRiD4aOcUQfXVDl3hiM="
    "nixify.cachix.org-1:95SiUQuf8Ij0hwDweALJsLtnMyv/otZamWNRp1Q1pXw="
    "crane.cachix.org-1:8Scfpmn9w+hGdXH/Q9tTLiYAE/2dnJYRJP7kl80GuRk="
    "bytecodealliance.cachix.org-1:0SBgh//n2n0heh0sDFhTm+ZKBRy2sInakzFGfzN531Y="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
  ];

  inputs.nixify.inputs.nixpkgs-darwin.follows = "nixpkgs";
  inputs.nixify.inputs.nixpkgs-nixos.follows = "nixpkgs";
  inputs.nixify.url = "github:rvolosatovs/nixify";
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.wasmcloud.url = "github:wasmcloud/wasmcloud/wash-cli-v0.25.0";
  inputs.wit-deps.inputs.nixify.follows = "nixify";
  inputs.wit-deps.url = "github:bytecodealliance/wit-deps/v0.3.5";

  outputs = {
    nixify,
    wasmcloud,
    wit-deps,
    ...
  }:
    with nixify.lib;
      rust.mkFlake {
        name = "dev-ex";
        src = ./.;

        overlays = [
          wasmcloud.overlays.default
          wit-deps.overlays.default
        ];

        buildOverrides = {pkgs, ...}: {
          buildInputs ? [],
          depsBuildBuild ? [],
          ...
        }:
          with pkgs; {
            buildInputs =
              buildInputs
              ++ lib.optional stdenv.hostPlatform.isDarwin libiconv;

            depsBuildBuild =
              depsBuildBuild
              ++ lib.optional stdenv.hostPlatform.isDarwin darwin.apple_sdk.frameworks.SystemConfiguration;
          };

        withDevShells = {
          devShells,
          pkgs,
          ...
        }:
          extendDerivations {
            buildInputs = [
              pkgs.fermyon-spin
              pkgs.wasmtime
              pkgs.wit-deps
            ];
          }
          devShells;
      };
}
