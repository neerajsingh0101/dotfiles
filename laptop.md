# TOC

* [Introduction](#introduction)
* [dotfiles](#dotfiles)
* [Mac defaults](#mac-defaults)
* [Mac applications](#mac-applications)

# Introduction

The goal of this writeup is to provide sensible defaults to get started with.
Once you have started using a particular tool you should customize the tool to
match your working style.

# dotfiles

If you are using a Mac and you are developer then you should use the
[dotfiles](https://github.com/neerajsingh0101/dotfiles) to setup your laptop.

# Mac defaults

I don't like when Mac boots then it makes a sound. So I decided to turn off that feature.
Similarly I don't like the warning that comes up when I'm deleting items in trash.

All such configurations and more can be done [here](https://github.com/neerajsingh0101/dotfiles/blob/main/macos/set-defaults.sh).
Once you have made the changes then go to the root folder and execute `./macos/set-defaults.sh`. See
README for more information.

# Mac applications

Here are some Mac applications that I use and I recommend.

## Rocket Emoji app

[Rocket](https://matthewpalmer.net/rocket/) is a free Mac app that lets you type emojis slack style.
Download the app. Install it. Open it.

Now open Apple notes. Type I `:hear` AI and you will see heart emoji pop up.
Now open google doc and do the same. Do the same in google sheet.

Point is once this app is installed then you can type emojis really fast Slack style. This is so good that
it should be the default feature of Mac and Apple should ship it out of the box.

Rocket by default disables the trigger key `:` in applications like `Terminal` and `iTerm2`. If you are using
wezterm then you should add wezterm to this list. Click on Rocket application from the top menu bar. Click on
"Preferences". Add wezterm to the list of "Disable apps".

## Hidden bar

[Hideen bar](https://apps.apple.com/us/app/hidden-bar/id1452453066?mt=12) is a free and open source Mac app
that helps clean up the menus. [Here](https://www.youtube.com/watch?v=EHeg_onNDr8) is a YouTube video with all the information.
On Reddit a lot of people complain that the software has not been updated in the last 5 years. I consider this a
positive sign. It indicates that the software is mature and stable. [Here](https://github.com/dwarvesf/hidden) is link to GitHub repo.

## Raycast

[Raycast](https://raycast.com) is a wonderful Mac app that has replaced many Mac apps for me.

### Installing Raycast

Visit [Raycast exports](https://www.dropbox.com/scl/fo/5zwdp2ydu0ca0l4lkxe0w/APQ_dCDs0PgH6e3_zeodLPM?rlkey=vvex28wd4nlnj9y14sgwf1ex5&dl=0) and look for the most recent export. Download the file.

Open Raycast. Hit Command + `,`. Click on **Advanced** tab. Scroll down and click on **Import**. Import the file downloaded in the previous step. Password is `welcome1234`.

You should now be ready to use Raycast with all the settings from Neeraj. The whole point of importing the settings was to start with sensible defaults. As you learn more about Raycast you should change the settings to match your working style.

Here is what your Raycast can do now.

### Clipboard history

After copying we do Command + v to paste. If you add Shift to it then you would see the history of all previously copied values. Command + Shift + v will let you see the past clipboards. You can even search to find the right value.

### Hot keys for common applications

If you want to get to Slack app then you don't have to cycle through all open apps to get to Slack. Here are the hot keys for certain applications:

* Ctrl + 1 -> 1password
* Ctrl + s -> Slack
* Ctrl + w -> Whatsapp
* Ctrl + d -> downloads in finder
* Ctrl + z -> Wezterm
* Ctrl + n -> Apple notes
* Ctrl + o -> Obsidian


### Resizing screens

There are some commonly used resizing options preconfigured. Before we discuss them please note that if you are not familiar with Vim then the
choice of keys `h`, `j`, `k` and `l` might seem odd. In vim these keys are configured to move in different directions. For our fingers it's
much easier to reach `h j k l` than arrows.

If you are not familiar with vim then these keys might take a while to get used to it but don't get discouraged. Once you have mastered them
then you would be flying through your windows magically. Here are general settings in vim.

* h -> go left
* j -> go down
* k -> go up
* l -> go right

These keys combined with Ctrl makes your screen move. Open Apple notes and hit `Ctrl + h`. See what happens.

* Ctrl + h -> take left half of the vertical screen
* Ctrl + j -> take bottom half of the horizontal screen
* Ctrl + k -> take top half of the vertical screen
* Ctrl + l -> take the right half of the vertical screen

If you want to take 1/4th and not half then add Alt key.

* Ctrl + Alt +  h -> take left 25% of the vertical screen
* Ctrl + Alt + j -> take bottom 25% of the horizontal screen
* Ctrl + Alt + k -> take top 25% of the vertical screen
* Ctrl + Alt + l -> take the right 25% of the vertical screen

* Ctrl + m -> to maximize any application in the given monitor

### Multiple monitor

If you use an external monitor and you want to move an application from one monitor to another monitor then
use `Ctrl + Alt + ]` to move the application to the monitor to the right of the main monitor. Use `Ctrl + Alt + [`
to move the application in the other direction.

### Neeto GitHub repo shortcuts

If you want to go to neeto-cal-web repo to create an issue then in the browser you can type `/calw` and it will
do the right thing. Here `cal` stands for `neeto-cal` and `w` stands for `web`. Similarly if you want to go to
neeto-form-rn repo then type `/formr`.

What I just showed you is the power of snippets. Snippets are small keywords that expand to full text. You can use
keyword if you are already in the browser.

If you are typing on Slack then you don't have to go to browser and open a new tab and then type `/calw`. Instead
you can open raycast and you can type `calw`. This will open up a quicklink. All you need to do is hit enter and
a new tab in your browser will be opened with the right url.

This pattern of `/calw` and `calw` is set for all neeto products. If you find it not working for any repo then please
let me know.

## Menu Bar Calendar

Sometimes in the call I need to share a calendar to discuss dates.
Typically I open google calendar but it has information about my upcoming meetings
and appointments.

[Menu Bar Calendar](https://sindresorhus.com/menu-bar-calendar) is a free calendar app
which sits on the menu bar.

## Firewally

[Firewally](https://nektony.com/firewally) is a free Mac app that lets me see all the applications that are sending and receiving data from the Internet. With a click of a button I can cut off the network access of any application.

## Speediness

[Speediness](https://sindresorhus.com/speediness) is a free Mac app that tests my upload and download speed. Mostly I use it to check
if I have Internet access or not.
