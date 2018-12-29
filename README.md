# Pre-work - Tip Calculator

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Xinhao Liang**

Time spent: 8 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Settings page to change the theme color (light or dark)

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/vwkSqfc.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

* The UI layout part was challenging at first. Oftentimes I forgot to hold down `ctrl` to create functions for a UI component (e.g. UITextField) or connect a component to an existing function, thus messing up the View.
* It took me awhile to figure out how to save/update data between *Home* and *Settings*. Originally, I thought I should retrieve the recently saved default percentages in `viewOnLoad`; actually, I should retrieve in `viewWillAppear`.
* When updating the theme color, the default colors are not enough. Moreover, it is tedious to specify the rgb components for UIColor; the cleanest way would be to use hex. So, I searched up online and found out that I could convert hex to rgb by adding or shifting bits like the way we did in `C`.

## License

    Copyright 2018 Xinhao Liang

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
