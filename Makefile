####################################################
###
### Generate an apk with different environments
### [PROD, QA, STAGING]
### and different modes
### [RELEASE, DEBUG]
###
####################################################
generate:
### Simple definition check
ifndef env
	@echo 'You need to specify "env" variable [PROD, QA, STAGING]'
endif
ifndef mode
	@echo 'You need to specify "mode" variable [DEBUG, RELEASE]'
endif
### Generation
ifeq ($(mode)-$(env),RELEASE-PROD)
	flutter build apk --release -t lib/main.dart
else ifeq ($(mode)-$(env),DEBUG-PROD)
	flutter build apk --debug -t lib/main.dart
else ifeq ($(mode)-$(env),RELEASE-QA)
	flutter build apk --release -t lib/main_qa.dart
else ifeq ($(mode)-$(env),DEBUG-QA)
	flutter build apk --debug -t lib/main.dart
else ifeq ($(mode)-$(env),RELEASE-STAGING)
	flutter build apk --release -t lib/main_staging.dart
else ifeq ($(mode)-$(env),DEBUG-STAGING)
	flutter build apk --debug -t lib/main_staging.dart
endif

####################################################
###
### Run the app with different environments
### [PROD, QA, STAGING]
### and different modes
### [RELEASE, DEBUG]
###
####################################################
run:
### Simple definition check
ifndef env
	@echo 'You need to specify "env" variable [PROD, QA, STAGING]'
endif
ifndef mode
	@echo 'You need to specify "mode" variable [DEBUG, RELEASE]'
endif
### Execution
ifeq ($(mode)-$(env),RELEASE-PROD)
	flutter run --release -t lib/main.dart
else ifeq ($(mode)-$(env),DEBUG-PROD)
	flutter run --debug -t lib/main.dart
else ifeq ($(mode)-$(env),RELEASE-QA)
	flutter run --release -t lib/main_qa.dart
else ifeq ($(mode)-$(env),DEBUG-QA)
	flutter run --debug -t lib/main.dart
else ifeq ($(mode)-$(env),RELEASE-STAGING)
	flutter run --release -t lib/main_staging.dart
else ifeq ($(mode)-$(env),DEBUG-STAGING)
	flutter run --debug -t lib/main_staging.dart
endif