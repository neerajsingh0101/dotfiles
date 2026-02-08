# TOC

* Introduction
* dotfiles
* Mac defaults
* Mac applications
* Profiles for managing gmail accounts
* Getting to zero inbox

# Setting up Mac laptop

The goal of this writeup is to provide sensible defaults to get started with.
Once you have started using a particular tool you should customize the tool to
match your working style.


I have covered the most important app [Raycast](https://www.raycast.com/) at the very end because
that takes the maximum space. Before that let me go through some of the other items.

## Emoji app

[Rocket](https://matthewpalmer.net/rocket/) is a free Mac app that lets you type emojis slack style.
Download the app. Install it. Open it.

Now open Apple notes. Type I `:hear` AI and you will see heart emoji pop up.
Now open google doc and do the same. Do the same in google sheet.

Point is once this app is installed then you can type emojis really fast Slack style. This is so good that
it should be the default feature of Mac and Apple should ship it out of the box.

## Menu Bar Calendar

Sometimes in the call I need to share a calendar to discuss dates.
Typically I open google calendar but it has information about my upcoming meetings
and appointments.

[Menu Bar Calendar](https://sindresorhus.com/menu-bar-calendar) is a free calendar app
which sits on the menu bar.

## Firwally

[Firewally](https://nektony.com/firewally) is a free Mac app that let's me see all the applications that are sending and receiving data from the Internet. With a click of a button I can cut off the network access of any application.

## Speediness

[Speediness](https://sindresorhus.com/speediness) is a free Mac app that tests my upload and download speed. Mostly I use it to check
if I have Internet access or not.

## Raycast

[Raycast](https://raycast.com) is a wonderful Mac app that has replaced many Mac apps for me.

### Installing Raycast

Visit [Raycast exports](https://www.dropbox.com/scl/fo/5zwdp2ydu0ca0l4lkxe0w/APQ_dCDs0PgH6e3_zeodLPM?rlkey=vvex28wd4nlnj9y14sgwf1ex5&dl=0) and look for the most recent export. Download the file.

Open Raycast. Hit Command + `,`. Click on **Advanced** tab. Scroll down and click on **Import**. Import the downloaded file in the previous step.

Now you should be ready to use Raycast with all the Settings of Neeraj. The whole point of importing the settings was to start with sensible defaults. As you learn more about Raycast you should change the settings to match your working style.

Here is what your Raycast can do now.

#### Clipboard history

After copying we do Command + v to paste. If you add Shift to it then you would see the history of all previously copied values. Commnd + Shift + v will let you see the past clipboards. You can even search to find the right value.

#### Hot keys for common applications

If you want to get to Slack app then you don't have to cycle through all open apps to get to Slack. Here are the hot keys for certain applications:

* Ctrl + 1 -> 1password
* Ctrl + s -> Slack
* Ctrl + w -> Whatsapp
* Ctrl + d -> downloads in finder
* Ctrl + z -> Wezterm
* Ctrl + n -> Apple notes
* Ctrl + o -> Obsidian


#### Resizing screens

There are some commonly used resizing options preconfigured. Before we discuss them please note that if you are not familar with Vim then the
choice of keys `h`, `j`, `k` and `l` might seem odd. In vim these keys are configured to move in different directions. For our fingures it's
much easier to reach `h j k l` than arrows.

If you are not familar with vim then these keys might take a while to get used to it but don't get discouraged. Once you have masterd them
then you would be flyging through your windows magically. Here are general settings in vim.

h -> go left
j -> go down
k -> go up
l -> go right

These keys combined with Ctrl makes your screen move. Open Apple notes and hit `Ctrl + h`. See what happens.

Ctrl + h -> take left half of the vertical screen
Ctrl + j -> take bottom half of the horizontal screen
Ctrl + k -> take top half of the vertical screen
Ctrl + l -> take the right half of the vertical screen

If you want to take 1/4th and not half then add Alt key.

Ctrl + Alt +  h -> take left 25% of the vertical screen
Ctrl + Alt + j -> take bottom 25% of the horizontal screen
Ctrl + Alt + k -> take top 25% of the vertical screen
Ctrl + Alt + l -> take the right 25% of the vertical screen

Ctrl + m -> to maximize any application in the given monitor

#### Multiple monitor

If you use an external monitor and you want to move an application from one monitor to another monitor then
use `Ctrl + Alt + ]` to move the application to the monitor to the right of the main monitor. Use `Ctrl + Alt + [`
to move the application in the other direction.

#### Neeto GitHub repo shortcuts

If you want to go to neeto-cal-web repo to create an issue then in the browser you can type `/calw` and it will
do the right thing. Here `cal` stands for `neet-cal` and `w` stands for `web`. Similarly if you want to go to
neeto-form-rn repo then type `/formr`.

What I just showed you is the power of snippets. Snippets are small keywords that expand to full text. You can use
keyword if you are already in the browser.

If you are typing on Slack then you don't have to go to browser and open a new tab and then type `/calw`. Instead
you can open raycast and you can type `calw`. This will open up a quicklink. All you need to do is hit enter and
a new tab in your browser will be opened with the right url.

This pattern of `/calw` and `calw` is set for all neeto products. If you find it not working for any repo then please
let me know.
