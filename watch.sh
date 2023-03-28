prefixwith() {
    local prefix="$1"
    shift
    "$@" > >(sed "s/^/$prefix: /") 2> >(sed "s/^/$prefix (err): /" >&2)
}


copyOnChange() {
  while inotifywait -e modify,create,delete,move -r $1; do
    echo "Detected changes in $1, copying to $2"
    rm -r $2 
    cp -r $1 $2
  done
}

mkdir -p build/popup

prefixwith "cp-manifest" copyOnChange manifest.json build/manifest.json &

prefixwith "cp-background" copyOnChange background/build/main.js build/background.js &
prefixwith "background" cd background && yarn watch &

prefixwith "content" cd content && yarn watch & 

prefixwith "cp-content" copyOnChange content/build/main.js build/content.js & 
prefixwith "content" cd content && yarn watch & 

prefixwith "cp-popup" copyOnChange popup/dist build/popup &
prefixwith "popup" cd popup && yarn watch & 

# kill all child processes on exit
trap "pkill -P $$" SIGHUP SIGINT SIGTERM EXIT
sleep infinity
