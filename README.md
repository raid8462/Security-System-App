# Security System App

## Installation guide

To be able to to use the application on a Windows system the Flutter SDK will need to be downloaded from the link below.

https://docs.flutter.dev/get-started/install/windows

Install Android Studio to be able to use the application on an Android emulator.

https://developer.android.com/studio

Once completed install the Flutter and Dart plugins from Android Studio Settings => Plugins - 

<img width="550" alt="image" src="https://github.com/raid8462/Security-System-App/assets/73480311/d886b6dc-4a9d-4ee2-8b49-24d1338e4953">

Following the installation of plugins the project can now be cloned as a new project from the Git Repository. Navigate to File => New => Project From Version Control - 

<img width="550" alt="image" src="https://github.com/raid8462/Security-System-App/assets/73480311/a59dc4be-2fe3-4c49-b187-ee63d817f000">

When prompted copy and paste the url https://github.com/raid8462/Security-System-App.git and select the directory of where you would like to save the project.

<img width="550" alt="image" src="https://github.com/raid8462/Security-System-App/assets/73480311/af8ad995-1f0a-47c1-ad5e-b31f8906c1a0">

To run the application on an Android device an emulator is required. This can be setup in a virtual or a physical device. The following steps show hot to install a virtual device for a Android emulator:

From the navigation bar select Tools => Device Manager

<img width="550" alt="image" src="https://github.com/raid8462/Security-System-App/assets/73480311/18922944-e618-45b3-b39a-0a9f6a2d971e">

Under the virtual tab select Create device => Select a phone when 'Select Hardware' is shown and click next => Select System Image 'Tiramisu' which has a API level of 33 and click next => Select Finish

<img width="550" alt="image" src="https://github.com/raid8462/Security-System-App/assets/73480311/dd455d51-6b55-41d5-afea-faf741f9e832">

Once the virtual device has been installed from the toolbar select the device from the dropdown list and select the run button, shaped as a play button.

<img width="550" alt="image" src="https://github.com/raid8462/Security-System-App/assets/73480311/8718fe9f-de76-46bd-9756-48e16213a4fc">

## Using the system

When the application is run the Login screen is displayed. If not registered to an account click the 'Sign Up now' button to navigate to the Sign Up page.

<img width="300" alt="image" src="https://github.com/raid8462/Security-System-App/assets/73480311/1456b8b7-996e-4b96-8263-be9c98b36002">

From the Sign Up page enter a valid email and password. The password uses a strength checker to check for a secure password. The following conditions are required for a valid password:
- Minimum 8 characters
- At lease one uppercase character
- At least one number
- At least one special character

The Sign Up page also uses a Captcha, prompting users to slide the missing piece of an image to authenticate. If a valid email and password is entered and the captcha is verified the sign up button is enabled.

<img width="300" alt="image" src="https://github.com/raid8462/Security-System-App/assets/73480311/891584ed-c3ad-4612-8f5a-18454ab816c1">

Once the user clicks Sign Up they are taken to the Verify Email page where an email is sent to the user to verify their email. When the user clicks on the verification link the user is navigated to the OTT page.

<img width="300" alt="image" src="https://github.com/raid8462/Security-System-App/assets/73480311/fa4f4366-6044-41bf-85b2-2144768d0462">

When navigated to the OTT page the user is prompted to enter the token sent to their email and click the 'Verify' button. If the token is not valid an error message is displayed. If the token is valid they are navigated to the Home page. The OTT email  can be sent again by clicking on the 'Resend OTT' button.

<img width="300" alt="image" src="https://github.com/raid8462/Security-System-App/assets/73480311/c553b377-d5af-4e9e-9add-d7385754f6b7">

