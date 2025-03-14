// Copyright 2020 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file or at https://developers.google.com/open-source/licenses/bsd.

import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:devtools_tool/devtools_command_runner.dart';
import 'package:io/io.dart';

void main(List<String> args) async {
  final runner = DevToolsCommandRunner();
  try {
    final dynamic result = await runner
        .run(args)
        .whenComplete(sharedStdIn.terminate);

    exit(result is int ? result : 0);
  } catch (e) {
    if (e is UsageException) {
      stderr.writeln('$e');
      // Return an exit code representing a usage error.
      exit(64);
    } else {
      stderr.writeln('$e');
      // Return a general failure exit code.
      exit(1);
    }
  }
}
