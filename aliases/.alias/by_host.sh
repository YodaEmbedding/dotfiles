### BY HOST ###

HOSTNAME="$(hostname)"

PORPT_PREFIX="porp -m compressai_trainer.run.train"

if [[ "$HOSTNAME" == "PC-Mordor-Arch" ]]; then
  alias porpt="${PORPT_PREFIX} --config-path=$HOME/code/research/conf --config-name=root paths=pc-mordor"
fi

if [[ "$HOSTNAME" == *computecanada.ca ]]; then
  cluster_name() {
    local CLUSTER="unknown"
    if [[ "$HOSTNAME" == *beluga.computecanada.ca ]]; then
      CLUSTER="beluga"
    elif [[ "$HOSTNAME" == *cedar.computecanada.ca ]]; then
      CLUSTER="cedar"
    elif [[ "$HOSTNAME" == *graham.computecanada.ca ]]; then
      CLUSTER="graham"
    elif [[ "$HOSTNAME" == *narval.computecanada.ca ]]; then
      CLUSTER="narval"
    fi
    echo "$CLUSTER"
  }
  export CC_CLUSTER_NAME="$(cluster_name)"
  alias porpt="${PORPT_PREFIX} --config-path=$HOME/code/research/conf --config-name=root paths=computecanada ++paths._cluster=$CC_CLUSTER_NAME"
fi

if [[ "$HOSTNAME" == ensc-mcl-* ]]; then
  alias porpt="${PORPT_PREFIX} --config-path=$HOME/code/research/conf --config-name=root paths=ensc-mcl"
fi
