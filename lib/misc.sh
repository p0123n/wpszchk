getPageStat() {
  echo `$PHANTOM                                           \
    --ignore-ssl-errors=yes                                \
    --load-images=yes                                      \
    --disk-cache=no                                        \
    --debug=no                                             \
    --cookies-file=$VARPATH/cookie.txt                     \
      lib/yslow.js --info basic --format plain $CHEKURL`
}

getPageSize() {
  PAGE_STATS=$1
  echo $PAGE_STATS | head -n 1 | cut -d'(' -f2 | cut -d' ' -f1
}

getScreenshot() {
  echo 'TODO'
}

startChecking() {
  getPageSize "$(getPageStat)"
  # getScreenshot
}

#
# Magic time (❍ᴥ❍ʋ)!
#

cleanup() {
  trap - ALRM; kill -ALRM $a 2>/dev/null
  kill $! 2>/dev/null && exit 124
}

watchit() {
  trap "cleanup" ALRM; sleep $1& wait; kill -ALRM $$ ; echo 0
}

setTimeout() {
  watchit $1& a=$!
  shift ; trap "cleanup" ALRM INT
  "$@"& wait $! ; RET=$?
  kill -ALRM $a ; wait $a ; exit $RET
}
