// Autogenerated from Pigeon (v11.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

/// Represents a relying party
class RelyingParty {
  RelyingParty({
    required this.name,
    required this.id,
  });

  /// Name of the relying party
  String name;

  /// ID of the relying party
  String id;

  Object encode() {
    return <Object?>[
      name,
      id,
    ];
  }

  static RelyingParty decode(Object result) {
    result as List<Object?>;
    return RelyingParty(
      name: result[0]! as String,
      id: result[1]! as String,
    );
  }
}

/// Represents a public key credential parameter
class PubKeyCredParam {
  PubKeyCredParam({
    required this.type,
    required this.alg,
  });

  /// The type
  String type;

  /// The algorithm
  int alg;

  Object encode() {
    return <Object?>[
      type,
      alg,
    ];
  }

  static PubKeyCredParam decode(Object result) {
    result as List<Object?>;
    return PubKeyCredParam(
      type: result[0]! as String,
      alg: result[1]! as int,
    );
  }
}

/// Represents a user
class User {
  User({
    required this.displayName,
    required this.name,
    required this.id,
    this.icon,
  });

  /// The display name
  String displayName;

  /// The name
  String name;

  /// The ID
  String id;

  /// The icon
  String? icon;

  Object encode() {
    return <Object?>[
      displayName,
      name,
      id,
      icon,
    ];
  }

  static User decode(Object result) {
    result as List<Object?>;
    return User(
      displayName: result[0]! as String,
      name: result[1]! as String,
      id: result[2]! as String,
      icon: result[3] as String?,
    );
  }
}

/// Represents an allowed credential
class AllowCredential {
  AllowCredential({
    required this.type,
    required this.id,
    required this.transports,
  });

  /// The type
  String type;

  /// The ID
  String id;

  /// The transports
  List<String?> transports;

  Object encode() {
    return <Object?>[
      type,
      id,
      transports,
    ];
  }

  static AllowCredential decode(Object result) {
    result as List<Object?>;
    return AllowCredential(
      type: result[0]! as String,
      id: result[1]! as String,
      transports: (result[2] as List<Object?>?)!.cast<String?>(),
    );
  }
}

class ExcludeCredential {
  ExcludeCredential({
    required this.type,
    required this.id,
  });

  /// The type
  String type;

  /// The ID
  String id;

  Object encode() {
    return <Object?>[
      type,
      id,
    ];
  }

  static ExcludeCredential decode(Object result) {
    result as List<Object?>;
    return ExcludeCredential(
      type: result[0]! as String,
      id: result[1]! as String,
    );
  }
}

/// Represents an authenticator selection
class AuthenticatorSelection {
  AuthenticatorSelection({
    this.authenticatorAttachment,
    required this.requireResidentKey,
    required this.residentKey,
    required this.userVerification,
  });

  /// The authenticator attachment
  String? authenticatorAttachment;

  /// Whether a resident key is required
  bool requireResidentKey;

  /// The resident key
  String residentKey;

  /// The user verification
  String userVerification;

  Object encode() {
    return <Object?>[
      authenticatorAttachment,
      requireResidentKey,
      residentKey,
      userVerification,
    ];
  }

  static AuthenticatorSelection decode(Object result) {
    result as List<Object?>;
    return AuthenticatorSelection(
      authenticatorAttachment: result[0] as String?,
      requireResidentKey: result[1]! as bool,
      residentKey: result[2]! as String,
      userVerification: result[3]! as String,
    );
  }
}

/// Represents a register response
class RegisterResponse {
  RegisterResponse({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.attestationObject,
    required this.transports,
  });

  /// The ID
  String id;

  /// The raw ID
  String rawId;

  /// The client data JSON
  String clientDataJSON;

  /// The attestation object
  String attestationObject;

  /// The supported transports for the authenticator
  List<String> transports;

  Object encode() {
    return <Object?>[
      id,
      rawId,
      clientDataJSON,
      attestationObject,
      transports,
    ];
  }

  static RegisterResponse decode(Object result) {
    result as List<Object?>;
    return RegisterResponse(
      id: result[0]! as String,
      rawId: result[1]! as String,
      clientDataJSON: result[2]! as String,
      attestationObject: result[3]! as String,
      transports: result[4]! as List<String>,
    );
  }
}

/// Represents an authenticate response
class AuthenticateResponse {
  AuthenticateResponse({
    required this.id,
    required this.rawId,
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
    required this.userHandle,
  });

  /// The ID
  String id;

  /// The raw ID
  String rawId;

  /// The client data JSON
  String clientDataJSON;

  /// The authenticator data
  String authenticatorData;

  /// The signature
  String signature;

  String userHandle;

  Object encode() {
    return <Object?>[
      id,
      rawId,
      clientDataJSON,
      authenticatorData,
      signature,
      userHandle,
    ];
  }

  static AuthenticateResponse decode(Object result) {
    result as List<Object?>;
    return AuthenticateResponse(
      id: result[0]! as String,
      rawId: result[1]! as String,
      clientDataJSON: result[2]! as String,
      authenticatorData: result[3]! as String,
      signature: result[4]! as String,
      userHandle: result[5]! as String,
    );
  }
}

class _PasskeysApiCodec extends StandardMessageCodec {
  const _PasskeysApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AllowCredential) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is AuthenticateResponse) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is AuthenticatorSelection) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is ExcludeCredential) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is PubKeyCredParam) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is RegisterResponse) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is RelyingParty) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is User) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return AllowCredential.decode(readValue(buffer)!);
      case 129:
        return AuthenticateResponse.decode(readValue(buffer)!);
      case 130:
        return AuthenticatorSelection.decode(readValue(buffer)!);
      case 131:
        return ExcludeCredential.decode(readValue(buffer)!);
      case 132:
        return PubKeyCredParam.decode(readValue(buffer)!);
      case 133:
        return RegisterResponse.decode(readValue(buffer)!);
      case 134:
        return RelyingParty.decode(readValue(buffer)!);
      case 135:
        return User.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class PasskeysApi {
  /// Constructor for [PasskeysApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  PasskeysApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _PasskeysApiCodec();

  Future<bool> canAuthenticate() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.passkeys_android.PasskeysApi.canAuthenticate',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as bool?)!;
    }
  }

  Future<RegisterResponse> register(
      String arg_challenge,
      RelyingParty arg_relyingParty,
      User arg_user,
      AuthenticatorSelection arg_authenticatorSelection,
      List<PubKeyCredParam?>? arg_pubKeyCredParams,
      int? arg_timeout,
      String? arg_attestation,
      List<ExcludeCredential?> arg_excludeCredentials) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.passkeys_android.PasskeysApi.register', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(<Object?>[
      arg_challenge,
      arg_relyingParty,
      arg_user,
      arg_authenticatorSelection,
      arg_pubKeyCredParams,
      arg_timeout,
      arg_attestation,
      arg_excludeCredentials
    ]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as RegisterResponse?)!;
    }
  }

  Future<AuthenticateResponse> authenticate(
      String arg_relyingPartyId,
      String arg_challenge,
      int? arg_timeout,
      String? arg_userVerification,
      List<AllowCredential?>? arg_allowCredentials) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.passkeys_android.PasskeysApi.authenticate', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(<Object?>[
      arg_relyingPartyId,
      arg_challenge,
      arg_timeout,
      arg_userVerification,
      arg_allowCredentials
    ]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as AuthenticateResponse?)!;
    }
  }

  Future<void> cancelCurrentAuthenticatorOperation() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.passkeys_android.PasskeysApi.cancelCurrentAuthenticatorOperation',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}
