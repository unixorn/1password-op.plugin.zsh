#!/usr/bin/env zsh
#
#    Copyright 2022-2023 Joe Block <jpb@unixorn.net>
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

if (( $+commands[op] )); then
  if ! $(command -v _op &> /dev/null) ; then
    # Set up a shim function so that until we actually use the 'op' command,
    # don't bother to load its completions until the first time we actually
    # use it
    op() {
      # Now that we're running 'op', load its completions
      eval "$(op completion zsh)"; compdef _op op
      # We can get rid of the shim and execute 'op' directly from now on
      unfunction "$0"
      # Execute 'op' binary
      $0 "$@"
    }
  fi
fi
