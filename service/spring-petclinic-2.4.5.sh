#!/bin/sh
SERVICE_NAME=spring-petclinic-2.4.5
PATH_TO_JAR=/home/jenkins/jenkins/workspace/work_pet/target/spring-petclinic-2.4.5.jar
PID_PATH_NAME=/tmp/spring-petclinic-2.4.5-pid
case $1 in
    start)
        echo "Starting $SERVICE_NAME ..."
        if [ ! -f $PID_PATH_NAME ]; then
            nohup java -jar $PATH_TO_JAR /tmp 2>> /dev/null >> /dev/null &
                        echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is already running ..."
        fi
    ;;
    stop)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stoping ..."
            kill $PID;
            echo "$SERVICE_NAME stopped ..."
            rm $PID_PATH_NAME
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
    restart)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stopping ...";
                        kill $PID;
                        echo "$SERVICE_NAME stopped ...";
                        rm $PID_PATH_NAME
                        echo "$SERVICE_NAME starting ..."
                        nohup java -jar $PATH_TO_JAR /tmp 2>> /dev/null >> /dev/null &
                                    echo $! > $PID_PATH_NAME
                        echo "$SERVICE_NAME started ..."
                    else
                        echo "$SERVICE_NAME is not running ..."
                    fi
                ;;
            esac
