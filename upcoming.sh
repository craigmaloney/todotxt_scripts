#!/bin/bash
TODO=/usr/local/bin/todo.sh
PAST=`$TODO view past`
TWO_WEEKS=`$TODO view 2weeks`
ONE_MONTH=`$TODO view 1month`
PRIORITY=`$TODO -p lsp`

MESSAGE="

Due and overdue actions
=======================
$PAST


Upcoming next actions (Two Weeks)
=================================
$TWO_WEEKS


Prioritized next actions
========================
$PRIORITY"

echo "$MESSAGE" | /usr/bin/mail -e -s "Upcoming and Prioritized next actions" craig@localhost
