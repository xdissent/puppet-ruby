# Put ruby-build on PATH
set -x PATH <%= scope.lookupvar("::ruby::build::prefix") %>/bin $PATH

# Allow bundler to use all the cores for parallel installation
set -x BUNDLE_JOBS <%= scope.lookupvar("::processorcount") %>

<%- if scope.lookupvar("::ruby::provider") == "rbenv" -%>
# Configure RBENV_ROOT and put RBENV_ROOT/bin on PATH
set -x RBENV_ROOT <%= scope.lookupvar("::ruby::rbenv::prefix") %>
set -x PATH $RBENV_ROOT/bin $PATH

# Load rbenv
. (rbenv init - fish | psub)

<%- end -%>