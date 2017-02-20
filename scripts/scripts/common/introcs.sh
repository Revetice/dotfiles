#!/bin/bash

# http://introcs.cs.princeton.edu/java/linux/

mkdir -p $HOME/introcs/bin
cd $HOME/introcs

# wget http://introcs.cs.princeton.edu/java/linux/drjava.jar
# wget http://introcs.cs.princeton.edu/java/linux/drjava
# chmod 700 drjava
# mv drjava bin

wget http://introcs.cs.princeton.edu/java/stdlib/stdlib.jar
wget http://introcs.cs.princeton.edu/java/linux/javac-introcs
wget http://introcs.cs.princeton.edu/java/linux/java-introcs
chmod 700 javac-introcs java-introcs
mv javac-introcs bin
mv java-introcs bin


wget http://introcs.cs.princeton.edu/java/linux/checkstyle.zip
wget http://introcs.cs.princeton.edu/java/linux/findbugs.zip
unzip checkstyle.zip
unzip findbugs.zip
wget http://introcs.cs.princeton.edu/java/linux/checkstyle.xml
wget http://introcs.cs.princeton.edu/java/linux/findbugs.xml
wget http://introcs.cs.princeton.edu/java/linux/checkstyle-introcs
wget http://introcs.cs.princeton.edu/java/linux/findbugs-introcs
chmod 700 checkstyle-introcs findbugs-introcs
mv checkstyle-introcs bin
mv findbugs-introcs bin
mv checkstyle.xml checkstyle-5.5
mv findbugs.xml findbugs-2.0.3


# Add ~/introcs/bin to the PATH
# export PATH=$PATH:$HOME/introcs/bin
