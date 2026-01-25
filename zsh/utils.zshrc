# Utility functions

# tree but only print directories
# by default the depth level is 1 but an argument can be passed
# treed 3 - to have three levels of depth
treed() {
  tree -AdL ${1:-1}
}

# Create a new directory and enter it
mk() {
  mkdir -p "$@" && cd "$@"
}

# cd into latest created directory
# this is needed because I keep forgetting to use mk
cdl() {
  cd "$(ls -dt */ | head -n 1)"
}

# List only duplicate lines
duplines() {
  sort $1 | uniq -d
}

# List only unique lines
uniqlines() {
  sort $1 | uniq -u
}

# Show system information
sysinfo() {
  echo "CPU: $(sysctl -n machdep.cpu.brand_string)"
  echo "RAM: $(top -l 1 -s 0 | grep PhysMem | sed 's/^[[:space:]]*//')"
  echo
  system_profiler SPDisplaysDataType
}
