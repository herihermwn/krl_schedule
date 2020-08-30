# KRL Schedule

[<img src="https://play.google.com/intl/en_us/badges/images/generic/en-play-badge.png" alt="Get it on Google Play" height=
"80">](https://hecolab.id)


## Features
*  User profilling
*  Check Schedule KRL

## 📸 Example Android
<pre>
<img src="screenshot/android1.jpg" width="200"> <img src="screenshot/android2.jpg" width="200"> <img src="screenshot/android3.jpg" width="200"> <img src="screenshot/android4.jpg" width="200"> <img src="screenshot/android5.jpg" width="200">
</pre>

## 📁 Direktori
    # Root Project
    .
    ├── app                    # Setup service locator.
    |
    ├── core                   # Logic File/class.
    │   └── model              # Model class.
    │   │   └── request        # Model for request http.
    │   │   └── response       # Model for json response.
    │   └── service            # Functional like shared preference, http request, etc.
    │   └── viewmodel          # All functional logic to prossess data.
    |
    └── UI                     # UI File/class.
        ├── page               # Page/UI File/class.
        ├── shared             # Custom function, extension, etc which can be used repeatedly on each method.
        └── widget             # Custom widget which can be used repeatedly.

## 📁 Git commit format
* Add
Use when add new feature/update
* Fix
Use when fix some bug/error
* Remove
Use when remove some feature
#### Example :
    Add: Home page
    Fix: Layout not responsive
    Remove: Shadow on item list 
