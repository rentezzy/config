{ pkgs }:
with pkgs.vscode-marketplace; [
  # JS
  bbenoist.nix
  bradlc.vscode-tailwindcss
  dbaeumer.vscode-eslint
  prisma.prisma
  esbenp.prettier-vscode
  yoavbls.pretty-ts-errors

  # GO
  golang.go

  # Elixir
  # jakebecker.elixir-ls

  # GraphQL
  graphql.vscode-graphql
  graphql.vscode-graphql-syntax

  # SVG
  jock.svg

  # TOML/YAML/Markdown
  tamasfe.even-better-toml
  vmware.vscode-manifest-yaml
  davidanson.vscode-markdownlint

  # Utils
  vscodevim.vim

  wmaurer.change-case
  britesnow.vscode-toggle-quotes
  cardinal90.multi-cursor-case-preserve

  vivaxy.vscode-conventional-commits
  mhutchie.git-graph

  streetsidesoftware.code-spell-checker
  streetsidesoftware.code-spell-checker-ukrainian

  anseki.vscode-color

  # Themes
  itsjonq.owlet
  beardedbear.beardedtheme

  # Global Icons
  antfu.icons-carbon
]
