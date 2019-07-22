.PHONY: all test clean

####################################################
###
### Generate an apk with different environments
### [PROD, QA, STAGING]
### and different modes
### [RELEASE, DEBUG]
###
####################################################
generate:
	@sh ./scripts/generate.sh

####################################################
###
### Run an app with different environments
### [PROD, QA, STAGING]
### and different modes
### [RELEASE, DEBUG]
###
####################################################
run:
	@sh ./scripts/run.sh

####################################################
###
### Check definition of env and mode
### Execute proper command
###
####################################################
build-apk:
### Simple definition check
ifndef env
	@echo 'You need to specify "env" variable [PROD, QA, STAGING]'
endif
ifndef mode
	@echo 'You need to specify "mode" variable [DEBUG, RELEASE]'
endif
### Generation
ifeq ($(mode)-$(env),RELEASE-PROD)
	flutter clean
	flutter build apk --release w lib/core/main.dart
	sh ./scripts/rename_apk.sh release prod
else ifeq ($(mode)-$(env),DEBUG-PROD)
	flutter build apk --debug -t lib/core/main.dart
	sh ./scripts/rename_apk.sh debug prod
else ifeq ($(mode)-$(env),RELEASE-QA)
	flutter clean
	flutter build apk --release -t lib/core/main_qa.dart
	sh ./scripts/rename_apk.sh release qa
else ifeq ($(mode)-$(env),DEBUG-QA)
	flutter build apk --debug -t lib/core/main_qa.dart
	sh ./scripts/rename_apk.sh debug qa
else ifeq ($(mode)-$(env),RELEASE-STAGING)
	flutter clean
	flutter build apk --release -t lib/core/main_staging.dart
	sh ./scripts/rename_apk.sh release staging
else ifeq ($(mode)-$(env),DEBUG-STAGING)
	flutter build apk --debug -t lib/core/main_staging.dart
	sh ./scripts/rename_apk.sh debug staging
endif

####################################################
###
### Check definition of env and mode
### Execute proper command
###
####################################################
run-apk:
### Simple definition check
ifndef env
	@echo 'You need to specify "env" variable [PROD, QA, STAGING]'
endif
ifndef mode
	@echo 'You need to specify "mode" variable [DEBUG, RELEASE]'
endif
### Execution
ifeq ($(mode)-$(env),RELEASE-PROD)
	flutter run --release -t lib/core/main.dart
else ifeq ($(mode)-$(env),DEBUG-PROD)
	flutter run --debug -t lib/core/main.dart
else ifeq ($(mode)-$(env),RELEASE-QA)
	flutter run --release -t lib/core/main_qa.dart
else ifeq ($(mode)-$(env),DEBUG-QA)
	flutter run --debug -t lib/core/main_qa.dart
else ifeq ($(mode)-$(env),RELEASE-STAGING)
	flutter run --release -t lib/core/main_staging.dart
else ifeq ($(mode)-$(env),DEBUG-STAGING)
	flutter run --debug -t lib/core/main_staging.dart
endif

####################################################
###
### Run tests
###
####################################################
test:
	flutter test

####################################################
###
### Clean project
###
####################################################
clean:
	flutter clean

