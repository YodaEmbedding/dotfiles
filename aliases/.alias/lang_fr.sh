### FRENCH ###

alias pour='for'                        # for
alias dans='in'                         # in
alias faire='do'                        # do
alias fais='do'                         # do
alias fin='done'                        # end
alias toujours='while true; do'         # forever
alias si='if'                           # if
alias alors='then'                      # then
alias ensuite='then'                    # then
alias puis='then'                       # then
alias sinon='else'                      # else (otherwise)
alias sinonsi='elif'                    # else if (otherwise)
alias finis='fi'                        # finish
alias retourner='return'                # to return (go back)
alias vrai='true'                       # true
alias faux='false'                      # false
alias ou='||'                           # or
alias et='&&'                           # and
alias egal='=='                         # equal

alias revenir='cd -'                    # to return (come back)
alias rentrer='cd ~'                    # to return (home)
alias copier='/bin/cp'                  # to copy
alias jour='date'                       # day
alias temps='date'                      # the time
alias dit='echo'                        # to say
alias dire='echo'                       # to say
alias parle='echo'                      # to say
alias tete='head'                       # head
alias tuer='kill'                       # to kill
alias tuertous='killall'                # to kill all
alias moins='less'                      # less
alias met='/bin/mv'                     # to put
alias mettre='/bin/mv'                  # to put
alias ici='pwd'                         # here
alias lire='read'                       # to read
alias effacer='rm'                      # to erase
alias perdre='rm'                       # to lose/throw away
alias enlever='rm'                      # to remove
alias supprimer='rm'                    # to remove
alias compter='seq'                     # to count
alias dormir='sleep'                    # to sleep
alias attendre='sleep'                  # to wait
alias quoi='type -a'                    # what
alias ouest='whereis'                   # where is
alias quel='which -a'                   # which
alias qui='who'                         # who
alias oui='yes'                         # yes
alias non='yes n'                       # no

alias contexte='b'                      # background
alias moins='bat'                       # less
alias voir='bat'                        # to see
alias haut='htop'                       # top
alias travail='htop_cpu'                # work
alias memoire='htop_mem'                # memory
alias rappeler='htop_mem'               # to remember
alias creer='make'                      # to create
alias ouvre='open'                      # open
alias copie='/usr/bin/pbcopy'           # copy
alias coller='/usr/bin/pbpaste'         # to paste
alias tomber='/usr/bin/pbpaste'         # to drop/fall
alias recommencer='reboot'              # to restart
alias regarder='watch'                  # to watch

alias noir='black -l 79'                # black
alias aujourdhui='cal'                  # today
alias trier='isort'                     # sort
alias chercher='rgi'                    # to locate
alias trouver='rgi'                     # to find
alias mais='rg --invert-match'          # but
alias envoyer='rscp'                    # to send
alias arreter='shutdown -P 0'           # to stop
alias lien='ssh'                        # link
alias liaison='ssh'                     # link
alias diviser='tmux'                    # to split
# alias faire='todo'                    # to do

alias poesie='poetry'                   # poetry
alias vers='poetry'                     # verse
alias arbre='tree'                      # tree
alias fenetres='windows'                # windows

alias modifier='gcAn'                   # to change/amend

alias combien='wc -l'                   # how many
alias ligne='wc -l'                     # line

alias apres=''                          # after
alias aucun=''                          # none
alias autour=''                         # around
alias aux=''                            # to the
alias avant=''                          # before
alias cette=''                          # this
alias cote=''                           # side
alias dernier=''                        # last
alias entre=''                          # between
alias eux=''                            # them
alias la=''                             # there
alias leur=''                           # them
alias pres=''                           # near
alias rien=''                           # none
alias sur=''                            # on
alias tout=''                           # all

# alias fois='repeat'                   # n times
# alias toujours='repeat_forever'       # forever
# alias ou='pwd'                        # where
# alias ou='where'                      # where
# alias ou='||'                         # or
# alias oui='true'                      # yes
# alias non='false'                     # no

# repeat() {
#   local n=$1; shift
#   for ((i=0; i<n; i++)); do
#     "$@"
#   done
# }

# repeat_forever() {
#   while true; do
#     "$@"
#   done
# }

# TODO: More useful functional functions.
# TODO: Consider converting infinitive verbs to imperative form. (e.g. "faire" to "fais")


# List of french aliases
francais() {
  grep -e "^alias" ~/.alias/lang_fr.sh | \
    sed -ne "s/^alias \([a-zA-Z]\{1,\}\)='\(.*\)'[[:space:]]\{1,\}# \([^#]\{1,\}\)$/\2#\1#\3/p" \
    | sort | column -t -s '#'
}

fr() {
  francais | fzf
}
