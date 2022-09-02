if status is-interactive
    # Commands to run in interactive sessions can go here
end
abbr genSshKey 'ssh-keygen -t rsa -b 4096 -f'
abbr promise-it-wont-hurt 'docker run -it -v $(pwd):/root oreng/promises-workshop'

alias composer='docker run -ti --rm --workdir /var/www -v $PWD:/var/www docker_php composer'

set -x EDITOR /usr/bin/nvim

set -x JAVA_HOME $HOME/tools/java/jdk-15
set -x MAVEN_HOME $HOME/tools/maven/apache-maven-3.8.1
set -x ANDROID_STUDIO_HOME $HOME/tools/android-studio
set -x ANDROID_HOME $HOME/tools/android/sdk
set -x GRADLE_HOME $HOME/tools/gradle-7.0

set -x PATH_ANDROID_SDK $ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

set -x PATH $PATH $HOME/.symfony/bin
set -x PATH $PATH $HOME/Documents/ProjectWeb/Formations_Configs_Scripts/scripts
set -x PATH $PATH $HOME/tools
set -x PATH $PATH $JAVA_HOME/bin
set -x PATH $PATH $MAVEN_HOME/bin
set -x PATH $PATH $ANDROID_STUDIO_HOME/bin
set -x PATH $PATH $PATH_ANDROID_SDK
set -x PATH $PATH $GRADLE_HOME/bin

set -x PATH $PATH $HOME/tools/node/bin

set -x PATH $PATH $HOME/.npm-global/bin

set -x PATH $PATH $HOME/bin

# set SSH_AUTH_SOCK /tmp/ssh-XXXXXX4yDBYE/agent.3218
# config.fish
#if not pgrep -f ssh-agent > /dev/null
#  eval (ssh-agent -c)
#  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
#  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
#end
#fish_ssh_agent

#eval (ssh-agent -c)

fish_default_key_bindings
#fish_vi_key_bindings

# config.fish

# FZF 

#set -x FZF_DEFAULT_COMMAND 'fd --hidden --exclude node_modules --exclude vendor --exclude .git' --exclude .database --exclude .env --exclude .formation --exclude .environement --exclude .crm
fzf_configure_bindings --directory=\,f --variables=\,v --history=\,h  --git_log=\,l --git_status=\,s

