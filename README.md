rp-canvas
=========
**rp-canvas**, a control for draw on view or use as signature pad.  

This is a UI control for iOS  written in **Objective C**. It draw a as per touch input from the user. _**rp-canvas**_ is a subclass of a `UIView` and it draw as image on `UIImageView` and it will gives your users to make signature or draw works.

Can be used as a signature pad control (iOS only).
_**rp-canvas**_ can be customized in the Storyboard without writing code.

## Project-Setup

Currently, There is only single way you can add _**rp-canvas**_ to your Xcode project.

## Add source

Simply add **RPDraw** folder or its all files into your Xcode project.

## Usage

1. Drag View object from the Object Library into your storyboard.

![pasted graphic](https://user-images.githubusercontent.com/45240621/53308622-d7d40600-3870-11e9-910d-be6116194afe.png)
 
2. Set the view's class to **`RPDrawContentView`** in the Identity Inspector.

![pasted graphic 1](https://user-images.githubusercontent.com/45240621/53308668-271a3680-3871-11e9-8c99-1f656cc32b4d.png)

3. Customize the _**rp-canvas**_ appearance in the Attributes Inspector.

![pasted graphic 2](https://user-images.githubusercontent.com/45240621/53308706-69437800-3871-11e9-90dc-a215a03368e9.png)


## Using rp-canvas in code

You can style and control _**rp-canvas**_ from your code by creating an outlet in your view controller. Alternatively, one can instantiate **`RPDrawContentView`** class and add it to the view manually without using Storyboard.


```
  //create Outlet object . 
  IBOutlet RPDrawContentView *drawView;  
  
  // Change Pencil point width . 
  [drawView setPencilWidth:10];  
  
  // Change Pencil color . 
  [drawView setPencilColor:[UIColor greenColor]];  
  
  // Clear Draw Data or drawView . 
  [drawView clearCanvas];
  
  ```
  
### Thanks 👍
