#!/bin/sh

# Setup:
#
# 1.    Make sure brew is installed
#       >   brew install codeql
#
# 2.    Clone repo and update $REPO_DIR below
#       >   git clone https://github.com/github/codeql.git
#
# 3.    CD into that repo, place this script there, update TEMP_DIR and
#       REPO_DIR below
#
# 4.    Execute this script

TEMP_DIR="/tmp/codequality"
REPO_DIR="/Users/dslatkin/Projects/codeql"

# Pick query to run by uncommenting appropriate
QUERY_SPECIFIERS="$REPO_DIR/javascript/ql/src/codeql-suites/javascript-security-and-quality.qls"
# QUERY_SPECIFIERS="$REPO_DIR/javascript/ql/src/codeql-suites/javascript-security-extended.qls"
#QUERY_SPECIFIERS="$REPO_DIR/javascript/ql/src/codeql-suites/javascript-code-scanning.qls"
#QUERY_SPECIFIERS="$REPO_DIR/javascript/ql/src/codeql-suites/javascript-lgtm.qls"
#QUERY_SPECIFIERS="$REPO_DIR/javascript/ql/src/codeql-suites/javascript-lgtm-full.qls"

mkdir -p $TEMP_DIR

WORKING_DIR="$(pwd)"
WORKING_DIR_KEY="$(echo "$WORKING_DIR" | shasum -a 256 | sed 's: .*::')"
DATABASE="${TEMP_DIR}/$WORKING_DIR_KEY"
TIMESTAMP=$(date +"%Y-%m-%dT%H-%M-%S%z")
REPORT_CSV="${TEMP_DIR}/${WORKING_DIR_KEY}-report-${TIMESTAMP}.csv"

echo "$WORKING_DIR_KEY $WORKING_DIR" >> "${TEMP_DIR}/database-paths"

rm -rf "$DATABASE"
mkdir -p "$DATABASE"
CPU_COUNT=$(sysctl -a | grep machdep.cpu | grep machdep.cpu.thread_count | sed 's:machdep.cpu.thread_count\: ::')

REGEX="^[0-9]+$"
if ! [[ $CPU_COUNT =~ $REGEX ]]; then
    CPU_COUNT="4"
fi

# - every time this runs, you need to recreate the db that this is running against
# - later on, we delete the database
# - using the sha sum of the directory to make sure it's unique
codeql database create $DATABASE --language=javascript
codeql database analyze $DATABASE $QUERY_SPECIFIERS --format=csv --output=$REPORT_CSV -j $CPU_COUNT

# REPORT_LINES=$(cat $REPORT_CSV | wc -l | sed 's: ::g')
# GREEN='\033[0;32m'
# RED='\033[0;31m'
# WHITE='\033[0;37m'
# NC='\033[0m' # No Color


# if [[ $REPORT_LINES = "0" ]]; then
#     echo "${GREEN}🎉 No issues found${NC}"
#     exit 0
# else
#   >&2 echo "\n${RED}### ISSUES FOUND ###${NC}\n"
#   cat $REPORT_CSV
#   >&2 echo "\n${RED}Report saved to ${REPORT_CSV}${NC}"
#   >&2 echo "${RED}🛑 ${REPORT_LINES} issues found${NC}"
#   exit 1
# fi
