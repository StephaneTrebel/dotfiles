# To include custom .bashrc files located in ~/.bashrc.d/,
# add this the end of your ~/.bashrc:
for file in ~/.bashrc.d/*.bashrc;
do
  source "$file"
done
