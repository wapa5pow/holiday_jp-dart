#!/bin/bash

# Update lib/holiday.g.dart
(cd holiday_jp && git checkout master && git pull)
dart tool/generate.dart
dart format lib/src/holiday.g.dart