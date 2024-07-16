PACKAGES := $(wildcard packages/*)
FEATURES := $(wildcard packages/features/*)
PLATFORMS := $(wildcard packages/platform/*)
UXS := $(wildcard packages/ux/*)

print:
	for feature in $(FEATURES); do echo $${feature} ; done
	for package in $(PACKAGES); do echo  $${package} ; done
	for platform in $(PLATFORMS); do echo $${platform} ; done
	for ux in $(UXS); do echo $${ux} ; done

pods-clean:
	rm -Rf ios/Pods ; \
	rm -Rf ios/.symlinks ; \
	rm -Rf ios/Flutter/Flutter.framework ; \
	rm -Rf ios/Flutter/Flutter.podspec ; \
	rm ios/Podfile ; \
	rm ios/Podfile.lock ; \

get:
	flutter pub get
	for feature in $(FEATURES); do \
		cd $${feature}; \
		echo "Updating dependencies on $${feature}"; \
		flutter pub get; \
		cd ../../../ ; \
	done
	for platform in $(PLATFORMS); do \
		cd $${platform};\
		echo "Updating dependencies on $${platform}"; \
		flutter pub get; \
		cd ../../../ ; \
	done
	for ux in $(UXS); do \
		cd $${ux}; \
		echo "Updating dependencies on $${ux}"; \
		flutter pub get; \
		cd ../../../ ; \
	done

upgrade:
	flutter pub upgrade
	for feature in $(FEATURES); do \
		cd $${feature}; \
		echo "Updating dependencies on $${feature}"; \
		flutter pub upgrade; \
		cd ../../../ ; \
	done
	for platform in $(PLATFORMS); do \
		cd $${platform};\
		echo "Updating dependencies on $${platform}"; \
		flutter pub upgrade; \
		cd ../../../ ; \
	done
	for ux in $(UXS); do \
		cd $${ux}; \
		echo "Updating dependencies on $${ux}"; \
		flutter pub upgrade; \
		cd ../../../ ; \
	done

lint:
	flutter analyze

format:
	flutter format --set-exit-if-changed .

test:
	flutter test
	for feature in $(FEATURES); do \
		cd $${feature}; \
		echo "Updating dependencies on $${feature}"; \
		flutter test; \
		cd ../../../ ; \
	done
	for platform in $(PLATFORMS); do \
		cd $${platform};\
		echo "Updating dependencies on $${platform}"; \
		flutter test; \
		cd ../../../ ; \
	done
	for ux in $(UXS); do \
		cd $${ux}; \
		echo "Updating dependencies on $${ux}"; \
		flutter test; \
		cd ../../../ ; \
	done

test-coverage:
	flutter test
	for feature in $(FEATURES); do \
		cd $${feature}; \
		echo "Updating dependencies on $${feature}"; \
		flutter test; \
		cd ../../../ ; \
	done
	for platform in $(PLATFORMS); do \
		cd $${platform};\
		echo "Updating dependencies on $${platform}"; \
		flutter test; \
		cd ../../../ ; \
	done
	for ux in $(UXS); do \
		cd $${ux}; \
		echo "Updating dependencies on $${ux}"; \
		flutter test; \
		cd ../../../ ; \
	done

clean:
	flutter clean
	for feature in $(FEATURES); do \
		cd $${feature}; \
		echo "Updating dependencies on $${feature}"; \
		flutter clean; \
		cd ../../../ ; \
	done
	for platform in $(PLATFORMS); do \
		cd $${platform};\
		echo "Updating dependencies on $${platform}"; \
		flutter clean; \
		cd ../../../ ; \
	done
	for ux in $(UXS); do \
		cd $${ux}; \
		echo "Updating dependencies on $${ux}"; \
		flutter clean; \
		cd ../../../ ; \
	done

