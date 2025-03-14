// Copyright 2023 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file or at https://developers.google.com/open-source/licenses/bsd.

import 'dart:js_interop';

import 'package:web/web.dart';

import 'post_message.dart';

Stream<PostMessageEvent> get onPostMessage {
  return window.onMessage.map(
    (message) =>
        PostMessageEvent(origin: message.origin, data: message.data.dartify()),
  );
}

void postMessage(Object? message, String targetOrigin) =>
    window.parent?.postMessage(message.jsify(), targetOrigin.toJS);
