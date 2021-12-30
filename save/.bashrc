# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export JAVA_HOME="$HOME/tools/java/jdk-16"
MAVEN_HOME="$HOME/tools/maven/apache-maven-3.8.1"
ANDROID_STUDIO_HOME="$HOME/tools/android-studio"
export ANDROID_HOME="$HOME/tools/android/sdk"
GRADLE_HOME="$HOME/tools/gradle-7.0"

PATH_ANDROID_SDK="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"

PATH="$PATH:$HOME/Documents/ProjectWeb/Formations_Configs_Scripts/scripts"
PATH="$PATH:$JAVA_HOME/bin"
PATH="$PATH:$MAVEN_HOME/bin"
PATH="$PATH:$ANDROID_STUDIO_HOME/bin"
PATH="$PATH:$PATH_ANDROID_SDK"
PATH="$PATH:$GRADLE_HOME/bin"

export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
