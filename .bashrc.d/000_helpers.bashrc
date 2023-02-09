# Helper functions that are used by other .bashrc scripts
# (hence why it is prepended with an underscore)

generate_aliases_for_subdirectories() {
	for directory in $(find ${1} -maxdepth 1 -type d | tail -n +2); do {
		alias go$(echo $(basename ${directory})| tr [:upper:] [:lower:] | tr -d [:punct:])="cd ${directory}"
	}
	done
}

