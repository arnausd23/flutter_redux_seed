# Flutter-Redux seed

A seed for Flutter using best practices and Redux

## Getting Started

These instructios will let you run the app on your local machise as well as building an apk for Android. 
See Run or Generate for more information

### Run

You can run the project using the run configurations on IntelliJ. You can use also the command line
using the next command

```
make run
```

It will appear 2 select options. First is for environment, second is for mode.


More information about environment or mode below.

### Running the tests

It will also run UI tests
```
make test
```

### Generate

You can build your app to an apk with different environments or modes. Just run:

```
make generate
```

It will appear 2 select options. First is for environment, second is for mode.

## Environments

* Production - Used to show the app to the world
* QA - Used to show the app to the client
* Staging - Used for development purposes

## Modes

* Release - Optimized build for high performance app
* Debug - Development or simple showcase build

## Done

- [x] Redux (flutter_redux)
- [x] State persistance to SharedPreferences
- [x] Model examples
- [x] Infrastructure examples (repositories, gateway)
- [x] ViewModel examples
- [x] Environment examples (PROD, STAGING, QA)
- [x] Test examples
- [x] UI screen and widget examples
- [x] UI test examples
- [x] IntelliJ/Makefile run configurations in different modes and environments
- [x] Navigation without context (using Redux)

## ToDo

- [ ] I18n
- [ ] Redux Devtools
- [ ] Service locator
- [ ] Theming
- [ ] Http gateway (dio)
- [ ] Versioning
- [ ] Isolate example
- [ ] Device info
- [ ] Alert/Toast
- [ ] Fonts
- [ ] Image/assets example
- [ ] Library example

## Authors

* **Albert Parrón** - *Initial work* - [Apiumhub](https://www.apiumhub.com)

See also the list of [contributors](https://github.com/parronator/flutter_redux_seed/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Apiumhub
* Antoni Sanchez