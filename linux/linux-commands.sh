#!/bin/bash

ls #- Lists directory contents. You will use ls to display information about files and directories.
cd [dir] #- Changes the current directory to dir . If you execute cd without specifying a directory,
cd #changes the current directory to your home directory. This is how you navigate around the
system.
pwd #- Displays the present working directory name. If you don't know what directory you are in, pwd will tell you.
cat [file] #- Concatenates and displays files. This is the command you run to view the contents of a file.
echo [argument] #- Displays arguments to the screen.
man command #- Displays the online manual for command . Type q to quit viewing the manual page. The documentation provided by the man command is commonly called "man pages."

exit , logout , or Ctrl-d #- Exits the shell or your current session.
clear #- Clears the screen.
man -k SEARCH_ITEM #is a Linux command used to search for manual pages (man pages) related to a specific keyword.

. #This directory
.. #The parent directory
cd #- Change to the previous directory
/ #Directory separator 

#Creating and removing directory

mkdir[-p] directory #- Create directory
rmdir[-p] directory # remove directory
rm-rf directory # recursively removes directory

#listing files by time and in reverse

ls -t #list files by time
ls -r # reverse order
ls -latr # long listing including all files in reverse sorted by time
ls -R 

#file and directory permissions
- #Regular file
d #Directory
l #Symbolic link

umask [-S] [mode] #S: Displays the current umask in symbolic (human-readable) format

                  #mode: Optional octal value to set a new umask


#Finding Files and Directories
find /path/to/search -name "filename.txt"
find /path/to/search -iname "*.jpg"
find /home -type f -mtime -7 #Find Files Modified in Last 7 Days
find /tmp -empty #Find Empty Files/Directories
find /path -name "*.tmp" -delete #Find and Delete Files 

nano #perfect for quick edits without learning complex commands

#removing files

rm file #remove file 
rm -r dir #Remove the directory and its contents recursively
rm -f file #Force removal and never prompt for confirmation

cp source_file destination_file #Copy source_file to destination_file.
cp src_file1 [src_fileN ...] dest_dir #Copy source_files to destination_directory.

#cp Options

cp -i #Run in interactive mode.
cp -r #source_directory destination
    #Copy src_directory recursively to destination.

#Moving and Renaming Files

mv #Move or rename files and directories.
mv #source destination
mv -i #source destination

#Sorting Data

sort file #Sort text in file.

#Aliases
 
 #Fix Typos
  alias grpe ='grep'
 #Make Linux behave like another OS.
  alias cls ='clear'

  #Listing Processes and Information
 ps #Display process status.

 #ps Options
-e #Everything, all processes.
-f #Full format listing.
-u username # Display username’s processes. 
-p pid #Display information for PID. 

 Ctrl-c #Kill the foreground process.
 Ctrl-z #Suspend the foreground process.

 ps -e  #Display all processes.
 ps -ef  #Display all processes, full.
 ps -eH  #Display a process tree.
 ps -e --forest #Display a process tree.
 ps -u username #Display user’s processes.


#killing processes
 Ctrl-c  #Kills the foreground proc.
 kill [-sig] pid #Send a signal to a process.
 kill -l #Display a list of signals.

  su [username] #Change user ID or become superuser

  sudo #Execute a command as another user,typically the superuser.

sudo -l  #List available commands.
sudo command #Run command as root. 
sudo -u root command #Same as above. 
sudo -u user command #Run as user.

 yum search string  #Search for string
 yum info [package] # Display info
 yum install [-y] package  # Install package
 yum remove package  #Remove package
 yum upgrade [package]  #  Update package


#yum and dnf are both package managers used on Linux systems (like CentOS or Fedora) to install, update, and remove software. Here’s the difference in simple terms:

#yum (Yellowdog Updater, Modified):
#Older tool, widely used in CentOS 7 and earlier.
#Slower and less efficient because it’s written in Python and has older logic.
#Works fine but is considered outdated.
#dnf (Dandified YUM):
#Newer tool, introduced as the next generation of yum.
#Used in Fedora and CentOS 8+ (replaced yum).
#Faster, more efficient, and has better dependency handling.
#Still uses similar commands (e.g., dnf install vs yum install), so it’s easy to switch.
#Key Difference:
#hink of yum as an old car—it gets you there but is slower and clunkier. dnf is like a newer model—faster, smoother, and more modern. On newer systems, dnf is the go-to, but yum still lingers on older setups (and often just redirects to dnf anyway).

#Example:
#Install a package with yum:

yum install httpd
#Same thing with dnf
dnf install httpd

 apt-cache search string #Search for string
 apt-get install [-y] package #Install package

 lt #long term support