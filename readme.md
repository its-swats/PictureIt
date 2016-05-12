# PictureIt
Upload pictures to PictureIt directly from your phone's browser for all users to see. Pictures last only until the next picture is uploaded. 

## Installation
```
> git clone https://github.com/its-swats/PictureIt.git
> rake db:create
> rake db:migrate
> rails s
> open http://localhost:3000
```
##Usage
PictureIt is currently only designed to work on Phones and Tablets. While it can be accessed on desktop, the UI does not yet support it and the experience will be suboptimal. A full fledged desktop and landscape UI is in the works. 

[Deployed to Heroku](http://pic-it.herokuapp.com)

<img src="./readme_screenshots/01.png" width="300">

## Known Issues
* Images are deleted when the Heroku Dyno shuts down


## Update Plans
* Reworked UI for Desktop and Landscape mode
* Pictures that automatically expire over time, modified based on up and down votes
* Better image scaling
* Better handling of captions

## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request!

## History
* 5/12/16 - Images are now compressed on upload, and caption text is placed on the image itself
* 5/11/16 - Fixed issue with crashing on launch when no records exist
* 5/7/16 - Initial release

## License
MIT License