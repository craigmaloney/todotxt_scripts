#!/bin/bash
TODOTXTDIR=/home/craig/Dropbox/todo
TODOTXTFILE=$TODOTXTDIR/todo.txt
TODOSH=/home/craig/bin/todo.sh

NUMREPEATS=$(grep "+recur" $TODOTXTFILE | wc -l)
NUMNOCONTEXT=$(grep -v -n @ $TODOTXTFILE | grep -v +project | grep -v +someday)
NUMCOMPLETE=$($TODOSH -p lately 1 | grep -v "Closed tasks" | grep -v "^$"| wc -l)
CLOSEDSINCE=`date +%F -d "yesterday 13:00"`
SEPERATOR="------------------------------------------------------------------------------"

if ls $TODOTXTDIR/*conflict* &> /dev/null
then
    echo "** Conflicted files present. **"
    echo
fi


if [ "$NUMNOCONTEXT" ]
then
    echo "These lines have no context:"
    echo $NUMNOCONTEXT
    echo ""
    echo $SEPERATOR
    echo ""
fi

if (( $NUMREPEATS > "0" ))
then
    echo "$NUMREPEATS repeating items remain:"
    echo
    $TODOSH -p ls "+recur"
    echo
    echo "Please get these done as soon as possible."
fi
echo ""
echo $SEPERATOR
echo ""
echo "$NUMCOMPLETE tasks closed since $CLOSEDSINCE. Good job! Keep going!"
