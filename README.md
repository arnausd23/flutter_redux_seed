# Flutter-Redux seed

A Flutter seed: 
- Redux (flutter_redux)
- Persistance of the state to SharedPreferences
- Model examples
- Infrastructure examples (repositories, gateway)
- ViewModel examples
- Environment examples (PROD, STAGING, QA)
- IntelliJ/Makefile run configurations in different modes and environments
- Test examples
- UI screen and widget examples
- UI test examples

## Values
##### ENVIRONMENT
- PROD
- QA
- STAGING

##### MODE
- RELEASE
- DEBUG

## Makefile usage

Apk generation

    make generate env=ENVIRONMENT mode=MODE

App run

    make run env=ENVIRONMENT mode=MODE
    
Test run

    make test