dsh() {
  docker exec -it ${1} sh
}

ksh() {
  kubectl exec -it ${1} sh
}
