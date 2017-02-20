#!/bin/bash
mkdir -p $HOME/algs4/bin

cd $HOME/algs4

wget http://algs4.cs.princeton.edu/linux/drjava.jar
wget http://algs4.cs.princeton.edu/linux/drjava
chmod 700 drjava
mv drjava bin

wget http://algs4.cs.princeton.edu/code/algs4.jar
wget http://algs4.cs.princeton.edu/linux/javac-algs4
wget http://algs4.cs.princeton.edu/linux/java-algs4
chmod 700 javac-algs4 java-algs4
mv javac-algs4 bin
mv java-algs4 bin

wget http://algs4.cs.princeton.edu/linux/checkstyle.zip
wget http://algs4.cs.princeton.edu/linux/findbugs.zip
unzip checkstyle.zip
unzip findbugs.zip
wget http://algs4.cs.princeton.edu/linux/checkstyle.xml
wget http://algs4.cs.princeton.edu/linux/findbugs.xml
wget http://algs4.cs.princeton.edu/linux/checkstyle-algs4
wget http://algs4.cs.princeton.edu/linux/findbugs-algs4
chmod 700 checkstyle-algs4 findbugs-algs4
mv checkstyle-algs4 bin
mv findbugs-algs4 bin
mv checkstyle.xml checkstyle-6.9
mv findbugs.xml findbugs-3.0.1

cd -
