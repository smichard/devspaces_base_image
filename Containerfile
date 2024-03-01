FROM registry.redhat.io/devspaces/udi-rhel8:3.11-14

USER 0

RUN dnf -y update --allowerasing && \
    dnf -y install zsh util-linux-user --allowerasing && \
    dnf clean all && \
    rm -rf /var/cache/yum

# Install Skaffold
RUN curl -sSL https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 -o /usr/local/bin/skaffold && \
    chmod +x /usr/local/bin/skaffold

# Install Tekton CLI
RUN curl -L https://github.com/tektoncd/cli/releases/download/v0.33.0/tkn_0.33.0_Linux_x86_64.tar.gz | tar -xz -C /usr/local/bin/ tkn && \
    chmod +x /usr/local/bin/tkn

# Install Argo CD CLI
RUN curl -sSL https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 -o /usr/local/bin/argocd && \
    chmod +x /usr/local/bin/argocd

# Install minio client
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc && \
    chmod +x mc && \
    mv mc /usr/local/bin/mc

# Install and configure Oh-My-ZSH
RUN sed -i 's#/bin/bash#/bin/zsh#g' /etc/passwd && \
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \
    wget -O ~/.zshrc https://gist.githubusercontent.com/smichard/aa95623add96c4405f1314bdf9f6784d/raw/f6ef299ad9520b994363c4919ba9ab91559a8309/my_theme_10k.zshrc && \
    wget -O ~/.p10k.zsh https://gist.githubusercontent.com/smichard/e91215bc02017fa6aa5bf9ecb4b14ca5/raw/762174d03954bdf6f38235583bd7e9b1b7fef9f9/my_p10k.zsh

# Copy entrypoint.sh script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

USER 10001

ENTRYPOINT ["/entrypoint.sh"]

CMD ["tail", "-f", "/dev/null"]