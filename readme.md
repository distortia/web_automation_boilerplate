# Web Automation Boilerplate

### Getting Started

- bundle install


### Running

- The command to run all the cucumber tests without any extra commands run `cucumber --format pretty`
- If you want to test on another browser besides FireFox, set the ENV variable to your browser of choice: `cucumber BROWSER=safari --format pretty`. See below for browser support.

### Other Browsers

- Install Chromedriver `brew install chromedriver` for Mac. Or visit this [URL](https://sites.google.com/a/chromium.org/chromedriver/downloads) for the latest
- SafariDriver - Use the safari extension in the project
- Edge isn't supported on OSX unless we use a VM ¯\\_(ツ)_/¯
- IE Hah, see Edge

### Mobile Web

Here are the various devices you can simulate on mobile web by running `cucumber DEVICE=iphone_6_plus_portrait --format pretty`

#### Web Breakpoints
Note: To get the exact sizes of the browser window check out `features/support/devices.yml` 

These are based off of [Google's Device Metrics](https://design.google.com/devices/)

You may want to scale these down based on what you are running on.
 
#### iPhone

- iphone_6_plus_portrait
- iphone_6_plus_landscape 
- iphone_6_portrait
- iphone_6_landscape
- iphone_5_portrait
- iphone_5_landscape
- iphone_4_portrait
- iphone_4_landscape
- ipad_retina_portrait
- ipad_retina_landscape
 
#### Nexus

- nexus_5_portrait
- nexus_5_landscape
- nexus_5x_portrait
- nexus_5x_landscape
- nexus_6_portrait
- nexus_6_landscape
- nexus_6p_portrait
- nexus_6p_landscape
 
#### Samsung

- note_4_portrait
- note_4_landscape
- s4_portait
- s5_portrait
- s5_landscape
- s6_portrait
- s6_landscape

### Physical Devices coming soon