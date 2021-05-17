.class public final Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;
.super Ljava/lang/Object;
.source "APIKeyDecoder.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final AMAZON_PUBLIC_CERT:Ljava/lang/String; = "-----BEGIN CERTIFICATE-----\nMIIEiTCCA3GgAwIBAgIJANVIFteXvjkPMA0GCSqGSIb3DQEBBQUAMIGJMQswCQYD\nVQQGEwJVUzEQMA4GA1UEBxMHU2VhdHRsZTETMBEGA1UEChMKQW1hem9uLmNvbTEZ\nMBcGA1UECxMQSWRlbnRpdHkgYW5kIFRheDETMBEGA1UEAxMKQW1hem9uLmNvbTEj\nMCEGCSqGSIb3DQEJARYUYXV0aC10ZWFtQGFtYXpvbi5jb20wHhcNMTIwODE0MDY1\nMDM5WhcNNzYwNjE0MDAyMjIzWjCBiTELMAkGA1UEBhMCVVMxEDAOBgNVBAcTB1Nl\nYXR0bGUxEzARBgNVBAoTCkFtYXpvbi5jb20xGTAXBgNVBAsTEElkZW50aXR5IGFu\nZCBUYXgxEzARBgNVBAMTCkFtYXpvbi5jb20xIzAhBgkqhkiG9w0BCQEWFGF1dGgt\ndGVhbUBhbWF6b24uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA\nr4LlDpmlK1+mYGXqhvY3Kcd093eUwOQhQM0cb5Y9FjkXvJiCCoLSR9L8QYm2Jz06\nL/546eF/eMegvej93VGjz9JsW+guUIGkDuyCPwBn3u/PvTVKZD67Cep66qT3xnB3\nLfMFt5ln4T5LuoqJ95s8t9P0fULBU52kPR1hwdSo7G4KRVgyXtMmqjp3PK4EbrPB\ndvXCYxVeR31yDPS0BRENC3SGrzlVzrSWYFhxuxRcfyoMJYsOt/9T5QlO2KmJoTy2\nJQtqo7rlc6rORiJH7i2x+QW14bV3miJe/p4ZHWpOT5Z4hAqMBldc0FufaED1YH/Y\nnNCethI/GrXkgzCJRU5asQIDAQABo4HxMIHuMB0GA1UdDgQWBBQBvx8zbG7Sg/MZ\nOuZ31GeYDkhqozCBvgYDVR0jBIG2MIGzgBQBvx8zbG7Sg/MZOuZ31GeYDkhqo6GB\nj6SBjDCBiTELMAkGA1UEBhMCVVMxEDAOBgNVBAcTB1NlYXR0bGUxEzARBgNVBAoT\nCkFtYXpvbi5jb20xGTAXBgNVBAsTEElkZW50aXR5IGFuZCBUYXgxEzARBgNVBAMT\nCkFtYXpvbi5jb20xIzAhBgkqhkiG9w0BCQEWFGF1dGgtdGVhbUBhbWF6b24uY29t\nggkA1UgW15e+OQ8wDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOCAQEAjOV/\nVDxeAuBqdPgoBGz8AyDtMR4Qyxpe7P0M9umtr8S0PmvYOVs5YuMbEAPUYGsBnWVJ\nn7ErwCF20bkd4x0gHzkOpEzQJnjlO9vJzJcnZH4ZwhVs5jF4IkPN8N68jawPvh5/\nLyWJuwyNY5nGvN5nEecTdUQqT1aa7+Vv3Y1ZQlTEKQtdaoXUjLG86jq9xpanNj/G\nX4VYW+m7mY7Kv7mdfAE4zeECqOY5yAqSfP1M/a5fSfHLQiCTt3mrZfOuj8Hd3Pp5\nVn1e4/UxQQCwZcvAFljEYie6CXD3U1AgzIFiv4/r2M+rDo0T7eqIqCsyG6VCgRAb\ndry4esK8/BdPhyuiZg==\n-----END CERTIFICATE-----\n"

.field private static CERTIFICATE:Ljava/security/cert/Certificate; = null

.field public static final CERTIFICATE_TYPE:Ljava/lang/String; = "X.509"

.field private static final CHAR_SET:Ljava/lang/String; = "UTF-8"

.field private static final ENCRYPTION_SCHEME:Ljava/lang/String; = "RSA-SHA256"

.field private static final EXPECTED_ISSUER:Ljava/lang/String; = "Amazon"

.field private static final FAILED_TO_DECODE:Ljava/lang/String; = "Failed to decode: "

.field private static final HASH_ALGORITHM:Ljava/lang/String; = "MD5"

.field private static final HASH_SEPARATOR:C = ':'

.field private static final HEADER_LOC:I = 0x0

.field private static final KEY_ALGORITHM:Ljava/lang/String; = "alg"

.field private static final KEY_API_KEY_VER:Ljava/lang/String; = "ver"

.field private static final KEY_APP_FAMILY_ID:Ljava/lang/String; = "appFamilyId"

.field private static final KEY_APP_ID:Ljava/lang/String; = "appId"

.field private static final KEY_APP_VARIANT_ID:Ljava/lang/String; = "appVariantId"

.field private static final KEY_CLIENT_ID:Ljava/lang/String; = "clientId"

.field private static final KEY_ISSUER:Ljava/lang/String; = "iss"

.field private static final KEY_PACKAGE_NAME:Ljava/lang/String; = "pkg"

.field private static final KEY_PERMISSIONS:Ljava/lang/String; = "perm"

.field private static final KEY_SCOPES:Ljava/lang/String; = "scopes"

.field private static final KEY_SIGNATURE:Ljava/lang/String; = "appsig"

.field private static final KEY_SPLITTER:Ljava/lang/String; = "[.]"

.field private static final LOG_TAG:Ljava/lang/String;

.field private static final PAYLOD_LOC:I = 0x1

.field private static final VER_1:Ljava/lang/String; = "1"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->$assertionsDisabled:Z

    .line 37
    const-class v0, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    .line 74
    const/4 v0, 0x0

    sput-object v0, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->CERTIFICATE:Ljava/security/cert/Certificate;

    return-void

    .line 33
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "This class is not instantiable!"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static decode(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .locals 1
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "apiKey"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 91
    const/4 v0, 0x1

    invoke-static {p0, p1, v0, p2}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->doDecode(Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v0

    return-object v0
.end method

.method private static decodeBase64ToBytes(Ljava/lang/String;)[B
    .locals 2
    .param p0, "base64String"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 197
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v0

    return-object v0
.end method

.method private static decodeBase64ToString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "base64String"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 190
    invoke-static {p0}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->decodeBase64ToBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 192
    .local v0, "byteData":[B
    new-instance v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1
.end method

.method static doDecode(Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .locals 8
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "apiKey"    # Ljava/lang/String;
    .param p2, "verify"    # Z
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 105
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Begin decoding API Key for packageName="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    sget-boolean v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->$assertionsDisabled:Z

    if-nez v4, :cond_1

    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    :cond_0
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 109
    :cond_1
    if-eqz p1, :cond_3

    if-eqz p0, :cond_3

    .line 114
    :try_start_0
    invoke-static {p1}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->getKeyParts(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 117
    .local v2, "keyParts":[Ljava/lang/String;
    new-instance v1, Lorg/json/JSONObject;

    const/4 v4, 0x0

    aget-object v4, v2, v4

    invoke-static {v4}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->decodeBase64ToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 118
    .local v1, "header":Lorg/json/JSONObject;
    new-instance v3, Lorg/json/JSONObject;

    const/4 v4, 0x1

    aget-object v4, v2, v4

    invoke-static {v4}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->decodeBase64ToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 121
    .local v3, "payload":Lorg/json/JSONObject;
    const-string v4, "alg"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4, p3}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->verifySignature([Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 123
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    const-string v5, "APIKey"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "payload="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    if-eqz p2, :cond_2

    .line 127
    invoke-static {p0, v3, p3}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->verifyPayload(Ljava/lang/String;Lorg/json/JSONObject;Landroid/content/Context;)V

    .line 131
    :cond_2
    invoke-static {v3}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->extractAppInfo(Lorg/json/JSONObject;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/NoSuchProviderException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_a

    move-result-object v4

    .line 160
    .end local v1    # "header":Lorg/json/JSONObject;
    .end local v2    # "keyParts":[Ljava/lang/String;
    .end local v3    # "payload":Lorg/json/JSONObject;
    :goto_0
    return-object v4

    .line 132
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 160
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :goto_1
    const/4 v4, 0x0

    goto :goto_0

    .line 134
    :catch_1
    move-exception v0

    .line 135
    .local v0, "e":Lorg/json/JSONException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 136
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_2
    move-exception v0

    .line 137
    .local v0, "e":Ljava/security/InvalidKeyException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/security/InvalidKeyException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 138
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v0

    .line 139
    .local v0, "e":Ljava/security/NoSuchProviderException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/security/NoSuchProviderException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 140
    .end local v0    # "e":Ljava/security/NoSuchProviderException;
    :catch_4
    move-exception v0

    .line 141
    .local v0, "e":Ljava/security/SignatureException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/security/SignatureException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 142
    .end local v0    # "e":Ljava/security/SignatureException;
    :catch_5
    move-exception v0

    .line 143
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 144
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_6
    move-exception v0

    .line 145
    .local v0, "e":Ljava/security/cert/CertificateException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/security/cert/CertificateException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 146
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    :catch_7
    move-exception v0

    .line 147
    .local v0, "e":Ljava/io/IOException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 148
    .end local v0    # "e":Ljava/io/IOException;
    :catch_8
    move-exception v0

    .line 149
    .local v0, "e":Ljava/lang/SecurityException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 150
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_9
    move-exception v0

    .line 151
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 152
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_a
    move-exception v0

    .line 153
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 158
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_3
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ApiKey/PackageName is null. pkg="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "apiKey="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1
.end method

.method private static extractAppInfo(Lorg/json/JSONObject;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .locals 10
    .param p0, "payload"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 374
    const-string v0, "ver"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 379
    .local v9, "version":Ljava/lang/String;
    const-string v0, "1"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 381
    const-string v0, "appId"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 382
    .local v1, "appFamilyId":Ljava/lang/String;
    move-object v2, v1

    .line 391
    .local v2, "appVariantId":Ljava/lang/String;
    :goto_0
    const-string v0, "pkg"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 392
    .local v3, "packageName":Ljava/lang/String;
    const-string v0, "scopes"

    invoke-static {p0, v0}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->getStringArray(Lorg/json/JSONObject;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 396
    .local v4, "allowedScopes":[Ljava/lang/String;
    :try_start_0
    const-string v0, "clientId"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 402
    .local v6, "clientId":Ljava/lang/String;
    :goto_1
    const-string v0, "perm"

    invoke-static {p0, v0}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->getStringArray(Lorg/json/JSONObject;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 404
    .local v5, "grantedPermissions":[Ljava/lang/String;
    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-object v7, p0

    invoke-direct/range {v0 .. v7}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-object v0

    .line 388
    .end local v1    # "appFamilyId":Ljava/lang/String;
    .end local v2    # "appVariantId":Ljava/lang/String;
    .end local v3    # "packageName":Ljava/lang/String;
    .end local v4    # "allowedScopes":[Ljava/lang/String;
    .end local v5    # "grantedPermissions":[Ljava/lang/String;
    .end local v6    # "clientId":Ljava/lang/String;
    :cond_0
    const-string v0, "appFamilyId"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 389
    .restart local v1    # "appFamilyId":Ljava/lang/String;
    const-string v0, "appVariantId"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "appVariantId":Ljava/lang/String;
    goto :goto_0

    .line 398
    .restart local v3    # "packageName":Ljava/lang/String;
    .restart local v4    # "allowedScopes":[Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 399
    .local v8, "jsone":Lorg/json/JSONException;
    sget-object v0, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    const-string v7, "APIKey does not contain a client id"

    invoke-static {v0, v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 400
    const/4 v6, 0x0

    .restart local v6    # "clientId":Ljava/lang/String;
    goto :goto_1
.end method

.method private static declared-synchronized getCertificate(Landroid/content/Context;)Ljava/security/cert/Certificate;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 247
    const-class v2, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->CERTIFICATE:Ljava/security/cert/Certificate;

    if-nez v1, :cond_0

    .line 249
    new-instance v0, Ljava/io/ByteArrayInputStream;

    const-string v1, "-----BEGIN CERTIFICATE-----\nMIIEiTCCA3GgAwIBAgIJANVIFteXvjkPMA0GCSqGSIb3DQEBBQUAMIGJMQswCQYD\nVQQGEwJVUzEQMA4GA1UEBxMHU2VhdHRsZTETMBEGA1UEChMKQW1hem9uLmNvbTEZ\nMBcGA1UECxMQSWRlbnRpdHkgYW5kIFRheDETMBEGA1UEAxMKQW1hem9uLmNvbTEj\nMCEGCSqGSIb3DQEJARYUYXV0aC10ZWFtQGFtYXpvbi5jb20wHhcNMTIwODE0MDY1\nMDM5WhcNNzYwNjE0MDAyMjIzWjCBiTELMAkGA1UEBhMCVVMxEDAOBgNVBAcTB1Nl\nYXR0bGUxEzARBgNVBAoTCkFtYXpvbi5jb20xGTAXBgNVBAsTEElkZW50aXR5IGFu\nZCBUYXgxEzARBgNVBAMTCkFtYXpvbi5jb20xIzAhBgkqhkiG9w0BCQEWFGF1dGgt\ndGVhbUBhbWF6b24uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA\nr4LlDpmlK1+mYGXqhvY3Kcd093eUwOQhQM0cb5Y9FjkXvJiCCoLSR9L8QYm2Jz06\nL/546eF/eMegvej93VGjz9JsW+guUIGkDuyCPwBn3u/PvTVKZD67Cep66qT3xnB3\nLfMFt5ln4T5LuoqJ95s8t9P0fULBU52kPR1hwdSo7G4KRVgyXtMmqjp3PK4EbrPB\ndvXCYxVeR31yDPS0BRENC3SGrzlVzrSWYFhxuxRcfyoMJYsOt/9T5QlO2KmJoTy2\nJQtqo7rlc6rORiJH7i2x+QW14bV3miJe/p4ZHWpOT5Z4hAqMBldc0FufaED1YH/Y\nnNCethI/GrXkgzCJRU5asQIDAQABo4HxMIHuMB0GA1UdDgQWBBQBvx8zbG7Sg/MZ\nOuZ31GeYDkhqozCBvgYDVR0jBIG2MIGzgBQBvx8zbG7Sg/MZOuZ31GeYDkhqo6GB\nj6SBjDCBiTELMAkGA1UEBhMCVVMxEDAOBgNVBAcTB1NlYXR0bGUxEzARBgNVBAoT\nCkFtYXpvbi5jb20xGTAXBgNVBAsTEElkZW50aXR5IGFuZCBUYXgxEzARBgNVBAMT\nCkFtYXpvbi5jb20xIzAhBgkqhkiG9w0BCQEWFGF1dGgtdGVhbUBhbWF6b24uY29t\nggkA1UgW15e+OQ8wDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOCAQEAjOV/\nVDxeAuBqdPgoBGz8AyDtMR4Qyxpe7P0M9umtr8S0PmvYOVs5YuMbEAPUYGsBnWVJ\nn7ErwCF20bkd4x0gHzkOpEzQJnjlO9vJzJcnZH4ZwhVs5jF4IkPN8N68jawPvh5/\nLyWJuwyNY5nGvN5nEecTdUQqT1aa7+Vv3Y1ZQlTEKQtdaoXUjLG86jq9xpanNj/G\nX4VYW+m7mY7Kv7mdfAE4zeECqOY5yAqSfP1M/a5fSfHLQiCTt3mrZfOuj8Hd3Pp5\nVn1e4/UxQQCwZcvAFljEYie6CXD3U1AgzIFiv4/r2M+rDo0T7eqIqCsyG6VCgRAb\ndry4esK8/BdPhyuiZg==\n-----END CERTIFICATE-----\n"

    const-string v3, "UTF-8"

    invoke-virtual {v1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 250
    .local v0, "is":Ljava/io/InputStream;
    const-string v1, "X.509"

    invoke-static {v1, v0}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->getCertificate(Ljava/lang/String;Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v1

    sput-object v1, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->CERTIFICATE:Ljava/security/cert/Certificate;

    .line 251
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 254
    .end local v0    # "is":Ljava/io/InputStream;
    :cond_0
    sget-object v1, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->CERTIFICATE:Ljava/security/cert/Certificate;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    return-object v1

    .line 247
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private static getCertificate(Ljava/lang/String;Ljava/io/InputStream;)Ljava/security/cert/Certificate;
    .locals 1
    .param p0, "certType"    # Ljava/lang/String;
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 258
    invoke-static {p0}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    return-object v0
.end method

.method private static getFingerprint(Ljava/lang/String;[B)[B
    .locals 1
    .param p0, "hashAlg"    # Ljava/lang/String;
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 362
    sget-boolean v0, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 363
    :cond_0
    invoke-static {p0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    return-object v0
.end method

.method private static getKeyParts(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p0, "apiKey"    # Ljava/lang/String;

    .prologue
    .line 172
    sget-boolean v1, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-nez p0, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 174
    :cond_0
    const-string v1, "[.]"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 175
    .local v0, "to_return":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x3

    if-eq v1, v2, :cond_1

    .line 176
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Decoding fails: API Key must have 3 parts {header}.{payload}.{signature}"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 179
    :cond_1
    return-object v0
.end method

.method public static getSignatureFingerprint(Ljava/lang/String;Landroid/content/pm/Signature;)Ljava/lang/String;
    .locals 4
    .param p0, "certType"    # Ljava/lang/String;
    .param p1, "sig"    # Landroid/content/pm/Signature;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/cert/CertificateException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 346
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p1}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 347
    .local v1, "is":Ljava/io/InputStream;
    invoke-static {p0, v1}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->getCertificate(Ljava/lang/String;Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    .line 348
    .local v0, "cert":Ljava/security/cert/Certificate;
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 351
    const-string v2, "MD5"

    invoke-virtual {v0}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v3

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->getFingerprint(Ljava/lang/String;[B)[B

    move-result-object v2

    invoke-static {v2}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->toHexString([B)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getStringArray(Lorg/json/JSONObject;Ljava/lang/String;)[Ljava/lang/String;
    .locals 7
    .param p0, "payload"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 419
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 426
    .local v2, "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    new-array v3, v4, [Ljava/lang/String;

    .line 429
    .local v3, "to_return":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 430
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    .line 429
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 421
    .end local v1    # "i":I
    .end local v2    # "jsonArray":Lorg/json/JSONArray;
    .end local v3    # "to_return":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 422
    .local v0, "e":Lorg/json/JSONException;
    sget-object v4, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " has no mapping in json, returning null array"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    const/4 v3, 0x0

    .line 433
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    return-object v3
.end method

.method private static verifyPayload(Ljava/lang/String;Lorg/json/JSONObject;Landroid/content/Context;)V
    .locals 13
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "payload"    # Lorg/json/JSONObject;
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Lorg/json/JSONException;,
            Landroid/content/pm/PackageManager$NameNotFoundException;,
            Ljava/security/cert/CertificateException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 281
    const-string v9, "iss"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "Amazon"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 282
    new-instance v9, Ljava/lang/SecurityException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Decoding fails: issuer ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "iss"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ") is not = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Amazon"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 286
    :cond_0
    const-string v9, "pkg"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 287
    new-instance v9, Ljava/lang/SecurityException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Decoding fails: package names don\'t match! - "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " != "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "pkg"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 292
    :cond_1
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 293
    .local v6, "pkgManager":Landroid/content/pm/PackageManager;
    const/4 v5, 0x0

    .line 294
    .local v5, "pkgInfo":Landroid/content/pm/PackageInfo;
    if-eqz v6, :cond_2

    .line 296
    const/16 v9, 0x40

    invoke-virtual {v6, p0, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 302
    :goto_0
    if-eqz v5, :cond_5

    .line 304
    iget-object v8, v5, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 305
    .local v8, "signatures":[Landroid/content/pm/Signature;
    if-eqz v8, :cond_6

    .line 307
    sget-object v9, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, " num sigs = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    array-length v11, v8

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    const-string v9, "appsig"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 309
    .local v0, "appSignature":Ljava/lang/String;
    if-eqz v0, :cond_4

    .line 310
    const-string v9, ":"

    const-string v10, ""

    invoke-virtual {v0, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 311
    sget-object v9, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    const-string v10, "Signature checking."

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "appSignature = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    move-object v1, v8

    .local v1, "arr$":[Landroid/content/pm/Signature;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_5

    aget-object v7, v1, v3

    .line 313
    .local v7, "sig":Landroid/content/pm/Signature;
    const-string v9, "X.509"

    invoke-static {v9, v7}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->getSignatureFingerprint(Ljava/lang/String;Landroid/content/pm/Signature;)Ljava/lang/String;

    move-result-object v2

    .line 314
    .local v2, "fingerprint":Ljava/lang/String;
    sget-object v9, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    const-string v10, "Fingerpirint checking"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "fingerprint = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 316
    return-void

    .line 300
    .end local v0    # "appSignature":Ljava/lang/String;
    .end local v1    # "arr$":[Landroid/content/pm/Signature;
    .end local v2    # "fingerprint":Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v7    # "sig":Landroid/content/pm/Signature;
    .end local v8    # "signatures":[Landroid/content/pm/Signature;
    :cond_2
    sget-object v9, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    const-string v10, " pkgMgr is null "

    invoke-static {v9, v10}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 312
    .restart local v0    # "appSignature":Ljava/lang/String;
    .restart local v1    # "arr$":[Landroid/content/pm/Signature;
    .restart local v2    # "fingerprint":Ljava/lang/String;
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    .restart local v7    # "sig":Landroid/content/pm/Signature;
    .restart local v8    # "signatures":[Landroid/content/pm/Signature;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 322
    .end local v1    # "arr$":[Landroid/content/pm/Signature;
    .end local v2    # "fingerprint":Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v7    # "sig":Landroid/content/pm/Signature;
    :cond_4
    sget-object v9, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    const-string v10, " appSignature is null"

    invoke-static {v9, v10}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    .end local v0    # "appSignature":Ljava/lang/String;
    .end local v8    # "signatures":[Landroid/content/pm/Signature;
    :cond_5
    :goto_2
    new-instance v9, Ljava/lang/SecurityException;

    const-string v10, "Decoding fails: certificate fingerprint can\'t be verified!"

    invoke-direct {v9, v10}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 327
    .restart local v8    # "signatures":[Landroid/content/pm/Signature;
    :cond_6
    sget-object v9, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->LOG_TAG:Ljava/lang/String;

    const-string v10, " signatures is null"

    invoke-static {v9, v10}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method private static verifySignature([Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 5
    .param p0, "keyParts"    # [Ljava/lang/String;
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/SignatureException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/cert/CertificateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 216
    const-string v2, "RSA-SHA256"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 217
    new-instance v2, Ljava/security/NoSuchAlgorithmException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unsupported algorithm : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 220
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    aget-object v3, p0, v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v3, p0, v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 221
    .local v0, "data":[B
    const/4 v2, 0x2

    aget-object v2, p0, v2

    invoke-static {v2}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->decodeBase64ToBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 223
    .local v1, "signature":[B
    invoke-static {p2}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->getCertificate(Landroid/content/Context;)Ljava/security/cert/Certificate;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->verifySignatureWithRsaSha256([B[BLjava/security/cert/Certificate;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 224
    new-instance v2, Ljava/lang/SecurityException;

    const-string v3, "Decoding fails: signature mismatch!"

    invoke-direct {v2, v3}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 226
    :cond_1
    return-void
.end method

.method private static verifySignatureWithRsaSha256([B[BLjava/security/cert/Certificate;)Z
    .locals 3
    .param p0, "signature"    # [B
    .param p1, "data"    # [B
    .param p2, "cert"    # Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    .line 239
    const-string v1, "SHA256withRSA"

    const-string v2, "BC"

    invoke-static {v1, v2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    .line 240
    .local v0, "signer":Ljava/security/Signature;
    invoke-virtual {v0, p2}, Ljava/security/Signature;->initVerify(Ljava/security/cert/Certificate;)V

    .line 241
    invoke-virtual {v0, p1}, Ljava/security/Signature;->update([B)V

    .line 243
    invoke-virtual {v0, p0}, Ljava/security/Signature;->verify([B)Z

    move-result v1

    return v1
.end method
