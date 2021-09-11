# G&R 
![Logo](/images/logo.png)

### Give and Receive 

#### Contacts:</br>
Danielli Cassiano: <daniellicass@ibm.com> </br>
Juliana Morroni: <juliana.morroni@ibm.com> </br>
Suemy Inagaki: <suemy.inagaki@ibm.com>


## What is G&R?
G&R is a mobile app solution for everyone: farmers, merchants or the common population. Its purpose is to serve as a tool that enables the match between food and someone who is in need of it, whether for their own consumption, for animal feed or for fertilizers. With this, we were able to reduce food waste and consequently the emission of carbon dioxide. Using state-of-the-art technology to classify food through images and to identify potential users interested in the food, so we will be able to reduce waste. In a single application, the user can donate, order food and see your waste and sustainability statistics.

### Contents:

- [Short Description](#Short-Description)
- [Long Description](#Long-Description)
- [Video](#video)
- [App](#app)
- [Screens Prototype](#Screens-Prototype)
- [Architecture](#architecture)
- [Technology](#technology)
- [Timeline](#timeline)
- [Project Roadmap](#Project-Roadmap)

### Team Project Name

Give & Receive  


### Project Theme

Responsible production and green consumption



### Short Description

Solve food waste problem and encourage conscious consumption.

### Long Description

#### The Problem
To Have Environmental responsibility is around applying innovation in your business.
With that in mind, our purpose will be decreasing the waste, pollution and emission of gases as a result of improperly discarded food.


#### Description 
Our application aims to solve these problems in relation to Responsible production and green consumption, avoiding the possible accumulation of waste or gases emission by the same. Filling the gap between the farmers and donors, who wish to correctly dispose of these foods ,and the people who may require and use this food for some purpose, from self-consumption to fertilizer. This application will also provide statistics on how much food has been saved.


#### Database
Some data that we count as important topics around this theme: 
-30% of all food in the world is wasted - ONU
-45% of all the fruits and vegetables that grow are missed - ONU
-Food waste is responsible for 8% of the gases emissions that trigger the greenhouse effect - ONU


#### What we are building
We implemented the app in flutter as it is a very versatile language and allows using the same code for an iOS, Android and Web app. So if it is necessary, we can easily scale the application.
We plan to use machine learning model in two ways:
-With Watson Visual Recognition and Watson Studio the application can classify images in consumption, animal food and fertilizer. Facilitating the user experience and improving the accuracy of the solution.
-With Watson Machine Learning the application can predict potential people interested in the food, enabling the increase of matches and the reduction of waste. 


In order to scale the application, we thought about deploying it on the IBM Cloud and using Cloud Object Storage to store the data.


#### How to use the APP
You must first create your account to access our features and all the informations about the proccess.
In the main menu, our app will present some information about issues related to waste, encouraging you to the sustainable movement.
We have 2 possibilities, you can look for donated food at collection points near your region, assuming green consumption.
On the other hand, you can also provide donations by registering your food in the app, may be the food left over from your harvest or considered unsuitable for sale, so will be reducing your waste levels.


#### Why it matters
It is our social responsibility to take steps not only to check all types of waste, but also to protect natural resources. This can be done through innovative approaches and initiatives with a higher purpose.

### Video
[![video](/images/video.png)](https://ibm.box.com/s/nfwyb44k9jryjq4s4kcj4p0oip5q1dy0)


### App

You can simulate using the app by clicking the link below. As at first we developed it to be a mobile app, we've restricted the screen size to simulate how it works on a cell phone. The app isn't complete yet, but it's a great way to experience and feel what it would be like in the future.  

You have two options to access the app: you can click on Sign In and create your own access credentials, or you can use the example that we have previously registered: 

email: john@mail.com and password: 123@abc

By logging in, you can now add food, order food, see your latest orders and see your statistics.

[Click here to open the app](https://suemy-inagaki.github.io/#/) 

### Screens Prototype

The images below show the prototypes of the next screens to be implemented. 

![screens1](/images/telas5.png)
![screens2](/images/telas2.png)
![screens3](/images/telas3.png)



### Architecture
![Architecture](/images/architecture.png)

1) User access the mobile app
2) Upload a photo to phone and add a food
3) NodeRed receive the data and send it to private cloud
4) The image is sent to a model created with Visual Recognition and Watson Studio to be classified into consumption, animal feed and fertilizer. Then, data will be stored in Cloud Object Storage. 
5) The Machine Learning model will predict a potential interest in the food and send the notification to contribute to the match. 
### Technology

We implemented the app in flutter as it is a very versatile language and allows using the same code for an iOS, Android and Web app. So if it is necessary, we can easily scale the application.
We plan to use machine learning model in two ways:
-With Watson Visual Recognition and Watson Studio the application can classify images in consumption, animal food and fertilizer. Facilitating the user experience and improving the accuracy of the solution.
-With Watson Machine Learning the application can predict potential people interested in the food, enabling the increase of matches and the reduction of waste. 


In order to scale the application, we thought about deploying it on the IBM Cloud and using Cloud Object Storage to store the data.

- [Watson Studio](https://www.ibm.com/br-pt/cloud/watson-studio)
- [Watson Visual Recognition](https://www.ibm.com/br-pt/cloud/watson-visual-recognition/pricing)
- [Watson Machine Learning](https://www.ibm.com/br-pt/cloud/machine-learning)
- [IBM Cloud Object Storage](https://www.ibm.com/br-pt/cloud/object-storage)
- [Node-Red](https://nodered.org/)

### Timeline
![Logo](/images/timeline.png)

### Project Roadmap 
![Roadmap](/images/roadmap-n.png)
![Roadmap](/images/next.png)

We have a beta of our application, the language used was Flutter. It is already usable, the user can access our features, being able to simulate all the actions, as a demo. A prototype with the design and functions was made too, so it could demonstrate where we plan to go. 


As next steps, we plan to use the Watson Visual Recognition and Watson Studio to identify automatically the finality of the food by classifying images in consumption, animal food and fertilizer. Facilitating the user experience and improving the accuracy of the solution, without the user input. We also plan to use a map API as a filter to show the closest donations. 


We hope in the future that we could identify potential interests, about the user, in available food. Making recommendations for next times. 

🍎🤝👨‍🌾🌱



