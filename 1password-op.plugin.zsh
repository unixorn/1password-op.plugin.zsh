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
  OP_COMPLETIONS_D="${0:A:h}/completions"
  OP_COMPLETIONS_REFRESH_TIME="${OP_COMPLETIONS_REFRESH_TIME:-+5d}"

  # Set up a shim function so that until we actually use the 'op' command,
  # don't bother to load its completions until the first time we actually
  # use it
  op() {
    # If the completion file is more than a day old, scrub it and
    # regenerate it - if op was updated, it might have changed the
    # completion function.
    #
    # Do this only on first use of op so we don't slow down every session
    # start - user may not always use op in a given session
    mkdir -p "$OP_COMPLETIONS_D"
    find "$OP_COMPLETIONS_D" -name _op.zsh -ctime "${OP_COMPLETIONS_REFRESH_TIME}" -delete
    if [[ ! -f "$OP_COMPLETIONS_D/_op.zsh" ]]; then
      op completion zsh 2> /dev/null > "$OP_COMPLETIONS_D/_op.zsh"
    fi
    # Add completions to the FPATH
    typeset -TUx FPATH fpath
    fpath=("$OP_COMPLETIONS_D" $fpath)

    # We can get rid of the shim and execute 'op' directly from now on
    # in this session.
    unset -f op
    # Now that completions are ready, execute 'op' binary
    $0 "$@"
  }
fi
