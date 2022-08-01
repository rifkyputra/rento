br:
	fvm flutter pub get
	fvm flutter pub run build_runner build --delete-conflicting-outputs

wr:
	fvm flutter pub get
	flutter pub run build_runner watch