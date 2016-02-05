# CKSButtonSlider
Custom UIButton with built in Slider functionality

## Usage
### Design
Add a UIButton to Storyboard and set the class to             CKSButtonSlider.

### Event Handling

**Button**

All typical UIButton actions will be sent as per usual.

_`.TouchUpInside` events will be triggered every time a user is done sliding the slider. You can use .TouchDownRepeat to respond to a double tap_

**Slider**

CKSButtonSlider will send the `.ValueChanged` action to all targets while the user is sliding the slider.
