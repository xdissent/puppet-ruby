# Configure and activate rbenv. You know, for rubies.

set -x RBENV_ROOT $BOXEN_HOME/rbenv

set -x PATH $BOXEN_HOME/rbenv/bin $BOXEN_HOME/rbenv/plugins/ruby-build/bin $PATH

# Allow bundler to use all the cores for parallel installation
set -x BUNDLE_JOBS <%= scope.lookupvar("::processorcount") %>

. (rbenv init - fish | psub)
