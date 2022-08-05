dsh() {
	docker exec -it ${1} bash
}

ksh() {
	kubectl exec -it ${1} bash
}

smartresize() {
	mogrify -verbose -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

fixup() {
	for file in $(git diff --name-only);
	do
		git add "${file}"
		git commit --fixup "$(git log -1 --format="format:%H" -- "${file}")"
	done
}

fixup_dry_run() {
	for file in $(git diff --name-only);
	do
		git add "${file}"
		git log -1 --format="format:%H" -- "${file}"
	done
}

say_done() {
	spd-say -i -75 -p +40 -r -50 -t female1 "finished"
}
