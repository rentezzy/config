{ pkgs }:
with pkgs.vscode-marketplace; [
  # JS
  jnoortheen.nix-ide
  bradlc.vscode-tailwindcss
  dbaeumer.vscode-eslint
  prisma.prisma
  esbenp.prettier-vscode
  biomejs.biome
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
  remcohaszing.schemastore
  
  # Docker
  ms-azuretools.vscode-containers

  # Utils
  vscodevim.vim
  vintharas.learn-vim

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
  catppuccin.catppuccin-vsc
  dracula-theme.theme-dracula
  eliverlara.andromeda
  jdinhlife.gruvbox
  mvllow.rose-pine
  subframe7536.theme-maple
  whizkydee.material-palenight-theme
  aetherdes.sakura-aetherdes

  # Global Icons
  antfu.icons-carbon
  file-icons.file-icons
  catppuccin.catppuccin-vsc-icons
]
