#!/usr/bin/env zsh

set -e

echo "Adding asdf plugins ..."
asdf plugin add awscli                       https://github.com/MetricMike/asdf-awscli.git
asdf plugin add container-diff               https://github.com/cgroschupp/asdf-container-diff.git
asdf plugin add create-change-pr             git@hmf.gitlab.otxlab.net:cybersecurity-enterprise/identity/devops/iga/asdf-iga.git
asdf plugin add create-multiple-change-pr    git@hmf.gitlab.otxlab.net:cybersecurity-enterprise/identity/devops/iga/asdf-iga.git
asdf plugin add direnv                       https://github.com/asdf-community/asdf-direnv.git
asdf plugin add eksctl                       https://github.com/elementalvoid/asdf-eksctl.git
asdf plugin add fetch                        git@hmf.gitlab.otxlab.net:cybersecurity-enterprise/identity/devops/iga/asdf-fetch.git
asdf plugin add gh2gl                        git@hmf.gitlab.otxlab.net:tharris2/asdf-tyler-harris.git
asdf plugin add glab                         https://github.com/particledecay/asdf-glab.git
asdf plugin add golang                       https://github.com/asdf-community/asdf-golang.git
asdf plugin add gruntwork-install            git@hmf.gitlab.otxlab.net:cybersecurity-enterprise/identity/devops/iga/asdf-gruntwork-install.git
asdf plugin add helm                         https://github.com/Antiarchitect/asdf-helm.git
asdf plugin add ig-tenant-upgrade            git@hmf.gitlab.otxlab.net:cybersecurity-enterprise/identity/devops/iga/asdf-iga.git
asdf plugin add iga-renderizer               git@hmf.gitlab.otxlab.net:cybersecurity-enterprise/identity/devops/iga/asdf-iga.git
asdf plugin add java                         https://github.com/halcyon/asdf-java.git
asdf plugin add jenkins-release              git@hmf.gitlab.otxlab.net:cybersecurity-enterprise/identity/devops/iga/asdf-iga.git
asdf plugin add jq                           https://github.com/lsanwick/asdf-jq.git
asdf plugin add kubectl                      https://github.com/Banno/asdf-kubectl.git
asdf plugin add kubectx                      https://gitlab.com/wt0f/asdf-kubectx.git
asdf plugin add kubergrunt                   https://github.com/NeoHsu/asdf-kubergrunt.git
asdf plugin add nodejs                       https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add packer                       https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin add python                       https://github.com/danhper/asdf-python.git
asdf plugin add rust                         https://github.com/code-lever/asdf-rust.git
asdf plugin add shellcheck                   https://github.com/luizm/asdf-shellcheck.git
asdf plugin add shfmt                        https://github.com/luizm/asdf-shfmt.git
asdf plugin add terraform                    https://github.com/Banno/asdf-hashicorp.git
asdf plugin add terragrunt                   https://github.com/ohmer/asdf-terragrunt.git
asdf plugin add tg-infra-live                git@hmf.gitlab.otxlab.net:cybersecurity-enterprise/identity/devops/iga/asdf-iga.git
asdf plugin add tomcat                       https://github.com/mbutov/asdf-tomcat
