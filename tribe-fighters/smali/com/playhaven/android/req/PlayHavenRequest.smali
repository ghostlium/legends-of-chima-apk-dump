.class public abstract Lcom/playhaven/android/req/PlayHavenRequest;
.super Ljava/lang/Object;
.source "PlayHavenRequest.java"


# static fields
.field protected static final HMAC:Ljava/lang/String; = "HmacSHA1"

.field protected static final UTF8:Ljava/lang/String; = "UTF-8"


# instance fields
.field private handler:Lcom/playhaven/android/req/RequestListener;

.field private lastUrl:Ljava/lang/String;

.field protected rest:Lorg/springframework/web/client/RestTemplate;

.field private sigMac:Ljavax/crypto/Mac;


# direct methods
.method protected constructor <init>()V
    .locals 5

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    new-instance v1, Lorg/springframework/http/HttpHeaders;

    invoke-direct {v1}, Lorg/springframework/http/HttpHeaders;-><init>()V

    .line 85
    .local v1, "requestHeaders":Lorg/springframework/http/HttpHeaders;
    sget-object v2, Lorg/springframework/http/ContentCodingType;->GZIP:Lorg/springframework/http/ContentCodingType;

    invoke-virtual {v1, v2}, Lorg/springframework/http/HttpHeaders;->setAcceptEncoding(Lorg/springframework/http/ContentCodingType;)V

    .line 86
    new-instance v2, Lorg/springframework/http/MediaType;

    const-string v3, "application"

    const-string v4, "json"

    invoke-direct {v2, v3, v4}, Lorg/springframework/http/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/springframework/http/HttpHeaders;->setAccept(Ljava/util/List;)V

    .line 87
    new-instance v0, Lorg/springframework/http/HttpEntity;

    invoke-direct {v0, v1}, Lorg/springframework/http/HttpEntity;-><init>(Lorg/springframework/util/MultiValueMap;)V

    .line 90
    .local v0, "requestEntity":Lorg/springframework/http/HttpEntity;, "Lorg/springframework/http/HttpEntity<*>;"
    new-instance v2, Lorg/springframework/web/client/RestTemplate;

    invoke-direct {v2}, Lorg/springframework/web/client/RestTemplate;-><init>()V

    iput-object v2, p0, Lcom/playhaven/android/req/PlayHavenRequest;->rest:Lorg/springframework/web/client/RestTemplate;

    .line 91
    iget-object v2, p0, Lcom/playhaven/android/req/PlayHavenRequest;->rest:Lorg/springframework/web/client/RestTemplate;

    new-instance v3, Lcom/playhaven/android/req/ServerErrorHandler;

    invoke-direct {v3}, Lcom/playhaven/android/req/ServerErrorHandler;-><init>()V

    invoke-virtual {v2, v3}, Lorg/springframework/web/client/RestTemplate;->setErrorHandler(Lorg/springframework/web/client/ResponseErrorHandler;)V

    .line 94
    iget-object v2, p0, Lcom/playhaven/android/req/PlayHavenRequest;->rest:Lorg/springframework/web/client/RestTemplate;

    invoke-virtual {v2}, Lorg/springframework/web/client/RestTemplate;->getMessageConverters()Ljava/util/List;

    move-result-object v2

    new-instance v3, Lorg/springframework/http/converter/StringHttpMessageConverter;

    const-string v4, "UTF-8"

    invoke-static {v4}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/springframework/http/converter/StringHttpMessageConverter;-><init>(Ljava/nio/charset/Charset;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    return-void
.end method

.method protected static base64Digest(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "input"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 320
    invoke-static {p0}, Lcom/playhaven/android/req/PlayHavenRequest;->dataDigest(Ljava/lang/String;)[B

    move-result-object v1

    invoke-static {v1}, Lcom/playhaven/android/req/PlayHavenRequest;->convertToBase64([B)Ljava/lang/String;

    move-result-object v0

    .line 323
    .local v0, "b64digest":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected static convertToBase64([B)Ljava/lang/String;
    .locals 3
    .param p0, "in"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 327
    if-nez p0, :cond_0

    const/4 v0, 0x0

    .line 329
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/String;

    const/16 v1, 0x9

    invoke-static {p0, v1}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v1

    const-string v2, "UTF8"

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    goto :goto_0
.end method

.method protected static convertToHex([B)Ljava/lang/String;
    .locals 9
    .param p0, "in"    # [B

    .prologue
    const/4 v4, 0x0

    .line 302
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v3, p0

    mul-int/lit8 v3, v3, 0x2

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 304
    .local v0, "builder":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/util/Formatter;

    invoke-direct {v1, v0}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;)V

    .line 305
    .local v1, "formatter":Ljava/util/Formatter;
    array-length v5, p0

    move v3, v4

    :goto_0
    if-lt v3, v5, :cond_0

    .line 309
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 305
    :cond_0
    aget-byte v2, p0, v3

    .line 306
    .local v2, "inByte":B
    const-string v6, "%02x"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    aput-object v8, v7, v4

    invoke-virtual {v1, v6, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 305
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method protected static dataDigest(Ljava/lang/String;)[B
    .locals 2
    .param p0, "in"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 333
    if-nez p0, :cond_0

    const/4 v1, 0x0

    .line 336
    :goto_0
    return-object v1

    .line 335
    :cond_0
    const-string v1, "SHA-1"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 336
    .local v0, "md":Ljava/security/MessageDigest;
    const-string v1, "UTF8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    goto :goto_0
.end method

.method protected static getConnectionType(Landroid/content/Context;)Lcom/playhaven/android/PlayHaven$ConnectionType;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 273
    :try_start_0
    const-string v6, "connectivity"

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 275
    .local v1, "manager":Landroid/net/ConnectivityManager;
    if-nez v1, :cond_0

    .line 276
    sget-object v6, Lcom/playhaven/android/PlayHaven$ConnectionType;->NO_NETWORK:Lcom/playhaven/android/PlayHaven$ConnectionType;

    .line 298
    .end local v1    # "manager":Landroid/net/ConnectivityManager;
    :goto_0
    return-object v6

    .line 278
    .restart local v1    # "manager":Landroid/net/ConnectivityManager;
    :cond_0
    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v5

    .line 279
    .local v5, "wifiInfo":Landroid/net/NetworkInfo;
    if-eqz v5, :cond_2

    .line 281
    invoke-virtual {v5}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v4

    .line 282
    .local v4, "wifi":Landroid/net/NetworkInfo$State;
    sget-object v6, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-eq v4, v6, :cond_1

    sget-object v6, Landroid/net/NetworkInfo$State;->CONNECTING:Landroid/net/NetworkInfo$State;

    if-ne v4, v6, :cond_2

    .line 283
    :cond_1
    sget-object v6, Lcom/playhaven/android/PlayHaven$ConnectionType;->WIFI:Lcom/playhaven/android/PlayHaven$ConnectionType;

    goto :goto_0

    .line 286
    .end local v4    # "wifi":Landroid/net/NetworkInfo$State;
    :cond_2
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v3

    .line 287
    .local v3, "mobileInfo":Landroid/net/NetworkInfo;
    if-eqz v3, :cond_4

    .line 289
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v2

    .line 290
    .local v2, "mobile":Landroid/net/NetworkInfo$State;
    sget-object v6, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-eq v2, v6, :cond_3

    sget-object v6, Landroid/net/NetworkInfo$State;->CONNECTING:Landroid/net/NetworkInfo$State;

    if-ne v2, v6, :cond_4

    .line 291
    :cond_3
    sget-object v6, Lcom/playhaven/android/PlayHaven$ConnectionType;->MOBILE:Lcom/playhaven/android/PlayHaven$ConnectionType;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 293
    .end local v1    # "manager":Landroid/net/ConnectivityManager;
    .end local v2    # "mobile":Landroid/net/NetworkInfo$State;
    .end local v3    # "mobileInfo":Landroid/net/NetworkInfo;
    .end local v5    # "wifiInfo":Landroid/net/NetworkInfo;
    :catch_0
    move-exception v0

    .line 295
    .local v0, "e":Ljava/lang/SecurityException;
    sget-object v6, Lcom/playhaven/android/PlayHaven$ConnectionType;->NO_PERMISSION:Lcom/playhaven/android/PlayHaven$ConnectionType;

    goto :goto_0

    .line 298
    .end local v0    # "e":Ljava/lang/SecurityException;
    .restart local v1    # "manager":Landroid/net/ConnectivityManager;
    .restart local v3    # "mobileInfo":Landroid/net/NetworkInfo;
    .restart local v5    # "wifiInfo":Landroid/net/NetworkInfo;
    :cond_4
    sget-object v6, Lcom/playhaven/android/PlayHaven$ConnectionType;->NO_NETWORK:Lcom/playhaven/android/PlayHaven$ConnectionType;

    goto :goto_0
.end method

.method protected static hexDigest(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "input"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 314
    invoke-static {p0}, Lcom/playhaven/android/req/PlayHavenRequest;->dataDigest(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/playhaven/android/req/PlayHavenRequest;->convertToHex([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected addSignature(Lorg/springframework/web/util/UriComponentsBuilder;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0
    .param p1, "builder"    # Lorg/springframework/web/util/UriComponentsBuilder;
    .param p2, "pref"    # Landroid/content/SharedPreferences;
    .param p3, "nonce"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 218
    invoke-virtual {p0, p1, p2, p3}, Lcom/playhaven/android/req/PlayHavenRequest;->addV4Signature(Lorg/springframework/web/util/UriComponentsBuilder;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 219
    return-void
.end method

.method protected addV3Signature(Lorg/springframework/web/util/UriComponentsBuilder;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 7
    .param p1, "builder"    # Lorg/springframework/web/util/UriComponentsBuilder;
    .param p2, "pref"    # Landroid/content/SharedPreferences;
    .param p3, "nonce"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 222
    const-string v0, "signature"

    new-array v1, v5, [Ljava/lang/Object;

    .line 223
    const-string v2, ":"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/String;

    .line 224
    sget-object v4, Lcom/playhaven/android/PlayHaven$Config;->Token:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {p0, p2, v4}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    .line 225
    sget-object v4, Lcom/playhaven/android/PlayHaven$Config;->DeviceId:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {p0, p2, v4}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    const/4 v4, 0x2

    .line 226
    aput-object p3, v3, v4

    const/4 v4, 0x3

    .line 227
    sget-object v5, Lcom/playhaven/android/PlayHaven$Config;->Secret:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {p0, p2, v5}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 223
    invoke-virtual {p0, v2, v3}, Lcom/playhaven/android/req/PlayHavenRequest;->concat(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 222
    invoke-static {v2}, Lcom/playhaven/android/req/PlayHavenRequest;->hexDigest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    invoke-virtual {p1, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 230
    return-void
.end method

.method protected addV4Signature(Lorg/springframework/web/util/UriComponentsBuilder;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 6
    .param p1, "builder"    # Lorg/springframework/web/util/UriComponentsBuilder;
    .param p2, "pref"    # Landroid/content/SharedPreferences;
    .param p3, "nonce"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 233
    const-string v1, ":"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    .line 234
    sget-object v3, Lcom/playhaven/android/PlayHaven$Config;->DeviceId:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {p0, p2, v3}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    .line 235
    sget-object v3, Lcom/playhaven/android/PlayHaven$Config;->Token:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {p0, p2, v3}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    const/4 v3, 0x2

    .line 236
    aput-object p3, v2, v3

    .line 233
    invoke-virtual {p0, v1, v2}, Lcom/playhaven/android/req/PlayHavenRequest;->concat(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 238
    .local v0, "ids":Ljava/lang/String;
    const-string v1, "sig4"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-virtual {p0, p2, v0, v4}, Lcom/playhaven/android/req/PlayHavenRequest;->createHmac(Landroid/content/SharedPreferences;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {p1, v1, v2}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 239
    return-void
.end method

.method protected varargs concat(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "delim"    # Ljava/lang/String;
    .param p2, "data"    # [Ljava/lang/String;

    .prologue
    .line 257
    const/4 v1, 0x1

    .line 258
    .local v1, "first":Z
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 259
    .local v2, "sb":Ljava/lang/StringBuilder;
    array-length v4, p2

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v4, :cond_0

    .line 268
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 259
    :cond_0
    aget-object v0, p2, v3

    .line 261
    .local v0, "d":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 259
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 263
    :cond_1
    if-nez v1, :cond_2

    const-string v5, ":"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    :goto_2
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 264
    :cond_2
    const/4 v1, 0x0

    goto :goto_2
.end method

.method protected createHmac(Landroid/content/SharedPreferences;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 8
    .param p1, "pref"    # Landroid/content/SharedPreferences;
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "stripEquals"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/io/UnsupportedEncodingException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 242
    sget-object v5, Lcom/playhaven/android/PlayHaven$Config;->Secret:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {p0, p1, v5}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v4

    .line 243
    .local v4, "secret":Ljava/lang/String;
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    const-string v6, "HmacSHA1"

    invoke-direct {v3, v5, v6}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 244
    .local v3, "key":Ljavax/crypto/spec/SecretKeySpec;
    const-string v5, "HmacSHA1"

    invoke-static {v5}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v2

    .line 245
    .local v2, "hmac":Ljavax/crypto/Mac;
    invoke-virtual {v2, v3}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 246
    const-string v5, "UTF-8"

    invoke-virtual {p2, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {v2, v5}, Ljavax/crypto/Mac;->update([B)V

    .line 247
    invoke-virtual {v2}, Ljavax/crypto/Mac;->doFinal()[B

    move-result-object v0

    .line 248
    .local v0, "bytes":[B
    new-instance v5, Ljava/lang/String;

    const/16 v6, 0x8

    invoke-static {v0, v6}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v6

    const-string v7, "UTF-8"

    invoke-direct {v5, v6, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 249
    .local v1, "derived":Ljava/lang/String;
    if-eqz p3, :cond_0

    .line 250
    const-string v5, "="

    const-string v6, ""

    invoke-virtual {v1, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 252
    :cond_0
    return-object v1
.end method

.method protected createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;
    .locals 22
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 143
    :try_start_0
    invoke-static/range {p1 .. p1}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v11

    .line 145
    .local v11, "pref":Landroid/content/SharedPreferences;
    sget-object v17, Lcom/playhaven/android/PlayHaven$Config;->APIServer:Lcom/playhaven/android/PlayHaven$Config;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v11, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/springframework/web/util/UriComponentsBuilder;->fromHttpUrl(Ljava/lang/String;)Lorg/springframework/web/util/UriComponentsBuilder;

    move-result-object v3

    .line 146
    .local v3, "builder":Lorg/springframework/web/util/UriComponentsBuilder;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    invoke-virtual/range {p0 .. p1}, Lcom/playhaven/android/req/PlayHavenRequest;->getApiPath(Landroid/content/Context;)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lorg/springframework/web/util/UriComponentsBuilder;->path(Ljava/lang/String;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 147
    const-string v17, "app"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    sget-object v20, Lcom/playhaven/android/PlayHaven$Config;->AppPkg:Lcom/playhaven/android/PlayHaven$Config;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v11, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 148
    const-string v17, "opt_out"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    sget-object v20, Lcom/playhaven/android/PlayHaven$Config;->OptOut:Lcom/playhaven/android/PlayHaven$Config;

    const-string v21, "0"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v11, v1, v2}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 149
    const-string v17, "app_version"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    sget-object v20, Lcom/playhaven/android/PlayHaven$Config;->AppVersion:Lcom/playhaven/android/PlayHaven$Config;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v11, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 150
    const-string v17, "os"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    sget-object v20, Lcom/playhaven/android/PlayHaven$Config;->OSVersion:Lcom/playhaven/android/PlayHaven$Config;

    const/16 v21, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v11, v1, v2}, Lcom/playhaven/android/req/PlayHavenRequest;->getInt(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 151
    const-string v17, "window"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/view/WindowManager;

    .line 152
    .local v16, "wm":Landroid/view/WindowManager;
    invoke-interface/range {v16 .. v16}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v6

    .line 153
    .local v6, "display":Landroid/view/Display;
    const-string v17, "orientation"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual {v6}, Landroid/view/Display;->getRotation()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 154
    const-string v17, "hardware"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    sget-object v20, Lcom/playhaven/android/PlayHaven$Config;->DeviceModel:Lcom/playhaven/android/PlayHaven$Config;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v11, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 155
    invoke-static/range {p1 .. p1}, Lcom/playhaven/android/req/PlayHavenRequest;->getConnectionType(Landroid/content/Context;)Lcom/playhaven/android/PlayHaven$ConnectionType;

    move-result-object v4

    .line 156
    .local v4, "connectionType":Lcom/playhaven/android/PlayHaven$ConnectionType;
    const-string v17, "connection"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual {v4}, Lcom/playhaven/android/PlayHaven$ConnectionType;->ordinal()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 157
    const-string v17, "idiom"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v20

    move-object/from16 v0, v20

    iget v0, v0, Landroid/content/res/Configuration;->screenLayout:I

    move/from16 v20, v0

    and-int/lit8 v20, v20, 0xf

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 165
    new-instance v14, Landroid/graphics/Point;

    invoke-direct {v14}, Landroid/graphics/Point;-><init>()V

    .line 166
    .local v14, "size":Landroid/graphics/Point;
    sget v17, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v18, 0xd

    move/from16 v0, v17

    move/from16 v1, v18

    if-lt v0, v1, :cond_0

    .line 168
    invoke-virtual {v6, v14}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 173
    :goto_0
    const-string v17, "width"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    iget v0, v14, Landroid/graphics/Point;->x:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 174
    const-string v17, "height"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    iget v0, v14, Landroid/graphics/Point;->y:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 183
    sget-object v17, Lcom/playhaven/android/PlayHaven$Config;->SDKVersion:Lcom/playhaven/android/PlayHaven$Config;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v11, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v12

    .line 184
    .local v12, "sdkVersion":Ljava/lang/String;
    sget-object v17, Lcom/playhaven/android/Version;->PLUGIN_BUILD_TIME:Ljava/lang/String;

    const-string v18, "[\\s]"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 185
    .local v5, "date":[Ljava/lang/String;
    const-string v17, "-SNAPSHOT"

    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "."

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v19, 0x0

    aget-object v19, v5, v19

    const-string v20, "-"

    const-string v21, ""

    invoke-virtual/range {v19 .. v21}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v12

    .line 186
    const-string v17, "sdk_version"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v12, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 189
    const-string v17, "plugin"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    sget-object v20, Lcom/playhaven/android/PlayHaven$Config;->PluginIdentifer:Lcom/playhaven/android/PlayHaven$Config;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v11, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 190
    const-string v17, "languages"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 191
    const-string v17, "token"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    sget-object v20, Lcom/playhaven/android/PlayHaven$Config;->Token:Lcom/playhaven/android/PlayHaven$Config;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v11, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 193
    const-string v17, "device"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    sget-object v20, Lcom/playhaven/android/PlayHaven$Config;->DeviceId:Lcom/playhaven/android/PlayHaven$Config;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v11, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 194
    new-instance v9, Landroid/util/DisplayMetrics;

    invoke-direct {v9}, Landroid/util/DisplayMetrics;-><init>()V

    .line 195
    .local v9, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v6, v9}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 196
    const-string v17, "dpi"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    iget v0, v9, Landroid/util/DisplayMetrics;->densityDpi:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 198
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v15

    .line 199
    .local v15, "uuid":Ljava/lang/String;
    invoke-static {v15}, Lcom/playhaven/android/req/PlayHavenRequest;->base64Digest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 200
    .local v10, "nonce":Ljava/lang/String;
    const-string v17, "nonce"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v10, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 202
    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v11, v10}, Lcom/playhaven/android/req/PlayHavenRequest;->addSignature(Lorg/springframework/web/util/UriComponentsBuilder;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 205
    sget-object v17, Lcom/playhaven/android/PlayHaven$Config;->Secret:Lcom/playhaven/android/PlayHaven$Config;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v11, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v13

    .line 206
    .local v13, "secret":Ljava/lang/String;
    new-instance v8, Ljavax/crypto/spec/SecretKeySpec;

    const-string v17, "UTF-8"

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v17

    const-string v18, "HmacSHA1"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v8, v0, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 207
    .local v8, "key":Ljavax/crypto/spec/SecretKeySpec;
    const-string v17, "HmacSHA1"

    invoke-static/range {v17 .. v17}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/playhaven/android/req/PlayHavenRequest;->sigMac:Ljavax/crypto/Mac;

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/playhaven/android/req/PlayHavenRequest;->sigMac:Ljavax/crypto/Mac;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 209
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/playhaven/android/req/PlayHavenRequest;->sigMac:Ljavax/crypto/Mac;

    move-object/from16 v17, v0

    const-string v18, "UTF-8"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljavax/crypto/Mac;->update([B)V

    .line 211
    return-object v3

    .line 170
    .end local v5    # "date":[Ljava/lang/String;
    .end local v8    # "key":Ljavax/crypto/spec/SecretKeySpec;
    .end local v9    # "metrics":Landroid/util/DisplayMetrics;
    .end local v10    # "nonce":Ljava/lang/String;
    .end local v12    # "sdkVersion":Ljava/lang/String;
    .end local v13    # "secret":Ljava/lang/String;
    .end local v15    # "uuid":Ljava/lang/String;
    :cond_0
    invoke-virtual {v6}, Landroid/view/Display;->getWidth()I

    move-result v17

    move/from16 v0, v17

    iput v0, v14, Landroid/graphics/Point;->x:I

    .line 171
    invoke-virtual {v6}, Landroid/view/Display;->getHeight()I

    move-result v17

    move/from16 v0, v17

    iput v0, v14, Landroid/graphics/Point;->y:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 212
    .end local v3    # "builder":Lorg/springframework/web/util/UriComponentsBuilder;
    .end local v4    # "connectionType":Lcom/playhaven/android/PlayHaven$ConnectionType;
    .end local v6    # "display":Landroid/view/Display;
    .end local v11    # "pref":Landroid/content/SharedPreferences;
    .end local v14    # "size":Landroid/graphics/Point;
    .end local v16    # "wm":Landroid/view/WindowManager;
    :catch_0
    move-exception v7

    .line 213
    .local v7, "e":Ljava/lang/Exception;
    new-instance v17, Lcom/playhaven/android/PlayHavenException;

    move-object/from16 v0, v17

    invoke-direct {v0, v7}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/Throwable;)V

    throw v17
.end method

.method protected getApiPath(Landroid/content/Context;)I
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 122
    const/4 v0, -0x1

    return v0
.end method

.method protected getCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 536
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->getVendorCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v0

    return-object v0
.end method

.method protected getEntity()Lorg/springframework/http/HttpEntity;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/springframework/http/HttpEntity",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 117
    new-instance v0, Lorg/springframework/http/HttpEntity;

    invoke-virtual {p0}, Lcom/playhaven/android/req/PlayHavenRequest;->getHeaders()Lorg/springframework/http/HttpHeaders;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/springframework/http/HttpEntity;-><init>(Lorg/springframework/util/MultiValueMap;)V

    return-object v0
.end method

.method protected getHeaders()Lorg/springframework/http/HttpHeaders;
    .locals 4

    .prologue
    .line 109
    new-instance v0, Lorg/springframework/http/HttpHeaders;

    invoke-direct {v0}, Lorg/springframework/http/HttpHeaders;-><init>()V

    .line 110
    .local v0, "headers":Lorg/springframework/http/HttpHeaders;
    new-instance v1, Lorg/springframework/http/MediaType;

    const-string v2, "application"

    const-string v3, "json"

    invoke-direct {v1, v2, v3}, Lorg/springframework/http/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/springframework/http/HttpHeaders;->setAccept(Ljava/util/List;)V

    .line 111
    sget-object v1, Lcom/playhaven/android/req/UserAgent;->USER_AGENT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/springframework/http/HttpHeaders;->setUserAgent(Ljava/lang/String;)V

    .line 112
    return-object v0
.end method

.method protected getInt(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;I)Ljava/lang/Integer;
    .locals 1
    .param p1, "pref"    # Landroid/content/SharedPreferences;
    .param p2, "param"    # Lcom/playhaven/android/PlayHaven$Config;
    .param p3, "defaultValue"    # I

    .prologue
    .line 137
    invoke-virtual {p2}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, p3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getLastUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 522
    iget-object v0, p0, Lcom/playhaven/android/req/PlayHavenRequest;->lastUrl:Ljava/lang/String;

    return-object v0
.end method

.method protected getMethod()Lorg/springframework/http/HttpMethod;
    .locals 1

    .prologue
    .line 104
    sget-object v0, Lorg/springframework/http/HttpMethod;->GET:Lorg/springframework/http/HttpMethod;

    return-object v0
.end method

.method protected getMockJsonResponse()Ljava/lang/String;
    .locals 1

    .prologue
    .line 533
    const/4 v0, 0x0

    return-object v0
.end method

.method public getResponseHandler()Lcom/playhaven/android/req/RequestListener;
    .locals 1

    .prologue
    .line 489
    iget-object v0, p0, Lcom/playhaven/android/req/PlayHavenRequest;->handler:Lcom/playhaven/android/req/RequestListener;

    return-object v0
.end method

.method protected getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;
    .locals 1
    .param p1, "pref"    # Landroid/content/SharedPreferences;
    .param p2, "param"    # Lcom/playhaven/android/PlayHaven$Config;

    .prologue
    .line 127
    const-string v0, "unknown"

    invoke-virtual {p0, p1, p2, v0}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "pref"    # Landroid/content/SharedPreferences;
    .param p2, "param"    # Lcom/playhaven/android/PlayHaven$Config;
    .param p3, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 132
    invoke-virtual {p2}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, p3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 513
    invoke-virtual {p0, p1}, Lcom/playhaven/android/req/PlayHavenRequest;->createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/springframework/web/util/UriComponentsBuilder;->build()Lorg/springframework/web/util/UriComponents;

    move-result-object v0

    invoke-virtual {v0}, Lorg/springframework/web/util/UriComponents;->encode()Lorg/springframework/web/util/UriComponents;

    move-result-object v0

    invoke-virtual {v0}, Lorg/springframework/web/util/UriComponents;->toUriString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/req/PlayHavenRequest;->lastUrl:Ljava/lang/String;

    .line 514
    iget-object v0, p0, Lcom/playhaven/android/req/PlayHavenRequest;->lastUrl:Ljava/lang/String;

    return-object v0
.end method

.method protected handleResponse(Lcom/playhaven/android/PlayHavenException;)V
    .locals 4
    .param p1, "e"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 500
    const-string v0, "Error calling server: %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/playhaven/android/PlayHavenException;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 501
    iget-object v0, p0, Lcom/playhaven/android/req/PlayHavenRequest;->handler:Lcom/playhaven/android/req/RequestListener;

    if-eqz v0, :cond_0

    .line 502
    iget-object v0, p0, Lcom/playhaven/android/req/PlayHavenRequest;->handler:Lcom/playhaven/android/req/RequestListener;

    invoke-interface {v0, p1}, Lcom/playhaven/android/req/RequestListener;->handleResponse(Lcom/playhaven/android/PlayHavenException;)V

    .line 503
    :cond_0
    return-void
.end method

.method protected handleResponse(Ljava/lang/String;)V
    .locals 1
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 494
    iget-object v0, p0, Lcom/playhaven/android/req/PlayHavenRequest;->handler:Lcom/playhaven/android/req/RequestListener;

    if-eqz v0, :cond_0

    .line 495
    iget-object v0, p0, Lcom/playhaven/android/req/PlayHavenRequest;->handler:Lcom/playhaven/android/req/RequestListener;

    invoke-interface {v0, p1}, Lcom/playhaven/android/req/RequestListener;->handleResponse(Ljava/lang/String;)V

    .line 496
    :cond_0
    return-void
.end method

.method public send(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 426
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/playhaven/android/req/PlayHavenRequest$1;

    invoke-direct {v1, p0, p1}, Lcom/playhaven/android/req/PlayHavenRequest$1;-><init>(Lcom/playhaven/android/req/PlayHavenRequest;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 474
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 475
    return-void
.end method

.method protected serverSuccess(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 480
    return-void
.end method

.method public setResponseHandler(Lcom/playhaven/android/req/RequestListener;)V
    .locals 0
    .param p1, "handler"    # Lcom/playhaven/android/req/RequestListener;

    .prologue
    .line 484
    iput-object p1, p0, Lcom/playhaven/android/req/PlayHavenRequest;->handler:Lcom/playhaven/android/req/RequestListener;

    .line 485
    return-void
.end method

.method protected validateSignatures(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 19
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "xPhDigest"    # Ljava/lang/String;
    .param p3, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/req/SignatureException;
        }
    .end annotation

    .prologue
    .line 341
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/playhaven/android/req/PlayHavenRequest;->sigMac:Ljavax/crypto/Mac;

    if-nez v15, :cond_1

    .line 422
    :cond_0
    return-void

    .line 348
    :cond_1
    if-nez p2, :cond_2

    .line 349
    new-instance v15, Lcom/playhaven/android/req/SignatureException;

    sget-object v16, Lcom/playhaven/android/req/SignatureException$Type;->Digest:Lcom/playhaven/android/req/SignatureException$Type;

    const-string v17, "No digest found"

    invoke-direct/range {v15 .. v17}, Lcom/playhaven/android/req/SignatureException;-><init>(Lcom/playhaven/android/req/SignatureException$Type;Ljava/lang/String;)V

    throw v15

    .line 353
    :cond_2
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/playhaven/android/req/PlayHavenRequest;->sigMac:Ljavax/crypto/Mac;

    const-string v16, "UTF-8"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljavax/crypto/Mac;->update([B)V

    .line 354
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/playhaven/android/req/PlayHavenRequest;->sigMac:Ljavax/crypto/Mac;

    invoke-virtual {v15}, Ljavax/crypto/Mac;->doFinal()[B

    move-result-object v3

    .line 355
    .local v3, "bytes":[B
    new-instance v15, Ljava/lang/String;

    const/16 v16, 0x8

    move/from16 v0, v16

    invoke-static {v3, v0}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v16

    const-string v17, "UTF-8"

    invoke-direct/range {v15 .. v17}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 356
    .local v4, "derived":Ljava/lang/String;
    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_3

    .line 357
    const-string v15, "Signature error. Received: %s != Derived: %s"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object p2, v16, v17

    const/16 v17, 0x1

    aput-object v4, v16, v17

    invoke-static/range {v15 .. v16}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 358
    new-instance v15, Lcom/playhaven/android/req/SignatureException;

    sget-object v16, Lcom/playhaven/android/req/SignatureException$Type;->Digest:Lcom/playhaven/android/req/SignatureException$Type;

    const-string v17, "Signature mismatch"

    invoke-direct/range {v15 .. v17}, Lcom/playhaven/android/req/SignatureException;-><init>(Lcom/playhaven/android/req/SignatureException$Type;Ljava/lang/String;)V

    throw v15
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 360
    .end local v3    # "bytes":[B
    .end local v4    # "derived":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 361
    .local v5, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v15, Lcom/playhaven/android/req/SignatureException;

    sget-object v16, Lcom/playhaven/android/req/SignatureException$Type;->Digest:Lcom/playhaven/android/req/SignatureException$Type;

    const-string v17, "Error decoding signature"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v15, v5, v0, v1}, Lcom/playhaven/android/req/SignatureException;-><init>(Ljava/lang/Throwable;Lcom/playhaven/android/req/SignatureException$Type;Ljava/lang/String;)V

    throw v15

    .line 364
    .end local v5    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v3    # "bytes":[B
    .restart local v4    # "derived":Ljava/lang/String;
    :cond_3
    invoke-static/range {p1 .. p1}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v8

    .line 370
    .local v8, "pref":Landroid/content/SharedPreferences;
    :try_start_1
    const-string v15, "$.response.context.content.*.parameters.rewards"

    move-object/from16 v0, p3

    invoke-static {v0, v15}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lnet/minidev/json/JSONArray;

    .line 371
    .local v12, "rewards":Lnet/minidev/json/JSONArray;
    if-eqz v12, :cond_4

    .line 373
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {v12}, Lnet/minidev/json/JSONArray;->size()I
    :try_end_1
    .catch Lcom/playhaven/android/req/SignatureException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    move-result v15

    if-lt v6, v15, :cond_5

    .line 398
    .end local v6    # "i":I
    :cond_4
    :try_start_2
    const-string v15, "$.response.context.content.*.parameters.purchases"

    move-object/from16 v0, p3

    invoke-static {v0, v15}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lnet/minidev/json/JSONArray;

    .line 399
    .local v10, "purchases":Lnet/minidev/json/JSONArray;
    if-eqz v10, :cond_0

    .line 401
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_1
    invoke-virtual {v10}, Lnet/minidev/json/JSONArray;->size()I

    move-result v15

    if-ge v6, v15, :cond_0

    .line 403
    invoke-virtual {v10, v6}, Lnet/minidev/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lnet/minidev/json/JSONObject;

    .line 404
    .local v9, "purchase":Lnet/minidev/json/JSONObject;
    const-string v15, ":"

    const/16 v16, 0x5

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    .line 405
    sget-object v18, Lcom/playhaven/android/PlayHaven$Config;->DeviceId:Lcom/playhaven/android/PlayHaven$Config;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v8, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    .line 406
    const-string v18, "$.product"

    move-object/from16 v0, v18

    invoke-static {v9, v0}, Lcom/playhaven/android/util/JsonUtil;->asString(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x2

    .line 407
    const-string v18, "$.name"

    move-object/from16 v0, v18

    invoke-static {v9, v0}, Lcom/playhaven/android/util/JsonUtil;->asString(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x3

    .line 408
    const-string v18, "$.quantity"

    move-object/from16 v0, v18

    invoke-static {v9, v0}, Lcom/playhaven/android/util/JsonUtil;->asString(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x4

    .line 409
    const-string v18, "$.receipt"

    move-object/from16 v0, v18

    invoke-static {v9, v0}, Lcom/playhaven/android/util/JsonUtil;->asString(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    .line 404
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->concat(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 411
    .local v2, "body":Ljava/lang/String;
    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v2, v15}, Lcom/playhaven/android/req/PlayHavenRequest;->createHmac(Landroid/content/SharedPreferences;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    .line 412
    .local v7, "mac":Ljava/lang/String;
    const-string v15, "$.sig4"

    const/16 v16, 0x0

    move/from16 v0, v16

    new-array v0, v0, [Lcom/jayway/jsonpath/Filter;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-static {v9, v15, v0}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/Object;Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 413
    .local v14, "sig":Ljava/lang/String;
    invoke-virtual {v7, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_7

    .line 414
    new-instance v15, Lcom/playhaven/android/req/SignatureException;

    sget-object v16, Lcom/playhaven/android/req/SignatureException$Type;->Purchase:Lcom/playhaven/android/req/SignatureException$Type;

    const-string v17, "Signature does not match."

    invoke-direct/range {v15 .. v17}, Lcom/playhaven/android/req/SignatureException;-><init>(Lcom/playhaven/android/req/SignatureException$Type;Ljava/lang/String;)V

    throw v15
    :try_end_2
    .catch Lcom/playhaven/android/req/SignatureException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    .line 417
    .end local v2    # "body":Ljava/lang/String;
    .end local v6    # "i":I
    .end local v7    # "mac":Ljava/lang/String;
    .end local v9    # "purchase":Lnet/minidev/json/JSONObject;
    .end local v10    # "purchases":Lnet/minidev/json/JSONArray;
    .end local v14    # "sig":Ljava/lang/String;
    :catch_1
    move-exception v13

    .line 418
    .local v13, "se":Lcom/playhaven/android/req/SignatureException;
    throw v13

    .line 375
    .end local v13    # "se":Lcom/playhaven/android/req/SignatureException;
    .restart local v6    # "i":I
    :cond_5
    :try_start_3
    invoke-virtual {v12, v6}, Lnet/minidev/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lnet/minidev/json/JSONObject;

    .line 376
    .local v11, "reward":Lnet/minidev/json/JSONObject;
    const-string v15, ":"

    const/16 v16, 0x4

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    .line 377
    sget-object v18, Lcom/playhaven/android/PlayHaven$Config;->DeviceId:Lcom/playhaven/android/PlayHaven$Config;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v8, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    .line 378
    const-string v18, "$.reward"

    move-object/from16 v0, v18

    invoke-static {v11, v0}, Lcom/playhaven/android/util/JsonUtil;->asString(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x2

    .line 379
    const-string v18, "$.quantity"

    move-object/from16 v0, v18

    invoke-static {v11, v0}, Lcom/playhaven/android/util/JsonUtil;->asString(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x3

    .line 380
    const-string v18, "$.receipt"

    move-object/from16 v0, v18

    invoke-static {v11, v0}, Lcom/playhaven/android/util/JsonUtil;->asString(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    .line 376
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lcom/playhaven/android/req/PlayHavenRequest;->concat(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 382
    .restart local v2    # "body":Ljava/lang/String;
    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v2, v15}, Lcom/playhaven/android/req/PlayHavenRequest;->createHmac(Landroid/content/SharedPreferences;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    .line 383
    .restart local v7    # "mac":Ljava/lang/String;
    const-string v15, "$.sig4"

    invoke-static {v11, v15}, Lcom/playhaven/android/util/JsonUtil;->getPath(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 384
    .restart local v14    # "sig":Ljava/lang/String;
    invoke-virtual {v7, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_6

    .line 385
    new-instance v15, Lcom/playhaven/android/req/SignatureException;

    sget-object v16, Lcom/playhaven/android/req/SignatureException$Type;->Reward:Lcom/playhaven/android/req/SignatureException$Type;

    const-string v17, "Signature does not match."

    invoke-direct/range {v15 .. v17}, Lcom/playhaven/android/req/SignatureException;-><init>(Lcom/playhaven/android/req/SignatureException$Type;Ljava/lang/String;)V

    throw v15
    :try_end_3
    .catch Lcom/playhaven/android/req/SignatureException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 388
    .end local v2    # "body":Ljava/lang/String;
    .end local v6    # "i":I
    .end local v7    # "mac":Ljava/lang/String;
    .end local v11    # "reward":Lnet/minidev/json/JSONObject;
    .end local v12    # "rewards":Lnet/minidev/json/JSONArray;
    .end local v14    # "sig":Ljava/lang/String;
    :catch_2
    move-exception v13

    .line 389
    .restart local v13    # "se":Lcom/playhaven/android/req/SignatureException;
    throw v13

    .line 373
    .end local v13    # "se":Lcom/playhaven/android/req/SignatureException;
    .restart local v2    # "body":Ljava/lang/String;
    .restart local v6    # "i":I
    .restart local v7    # "mac":Ljava/lang/String;
    .restart local v11    # "reward":Lnet/minidev/json/JSONObject;
    .restart local v12    # "rewards":Lnet/minidev/json/JSONArray;
    .restart local v14    # "sig":Ljava/lang/String;
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 390
    .end local v2    # "body":Ljava/lang/String;
    .end local v6    # "i":I
    .end local v7    # "mac":Ljava/lang/String;
    .end local v11    # "reward":Lnet/minidev/json/JSONObject;
    .end local v12    # "rewards":Lnet/minidev/json/JSONArray;
    .end local v14    # "sig":Ljava/lang/String;
    :catch_3
    move-exception v5

    .line 391
    .local v5, "e":Ljava/lang/Exception;
    new-instance v15, Lcom/playhaven/android/req/SignatureException;

    sget-object v16, Lcom/playhaven/android/req/SignatureException$Type;->Reward:Lcom/playhaven/android/req/SignatureException$Type;

    move-object/from16 v0, v16

    invoke-direct {v15, v5, v0}, Lcom/playhaven/android/req/SignatureException;-><init>(Ljava/lang/Throwable;Lcom/playhaven/android/req/SignatureException$Type;)V

    throw v15

    .line 401
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v2    # "body":Ljava/lang/String;
    .restart local v6    # "i":I
    .restart local v7    # "mac":Ljava/lang/String;
    .restart local v9    # "purchase":Lnet/minidev/json/JSONObject;
    .restart local v10    # "purchases":Lnet/minidev/json/JSONArray;
    .restart local v12    # "rewards":Lnet/minidev/json/JSONArray;
    .restart local v14    # "sig":Ljava/lang/String;
    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_1

    .line 419
    .end local v2    # "body":Ljava/lang/String;
    .end local v6    # "i":I
    .end local v7    # "mac":Ljava/lang/String;
    .end local v9    # "purchase":Lnet/minidev/json/JSONObject;
    .end local v10    # "purchases":Lnet/minidev/json/JSONArray;
    .end local v14    # "sig":Ljava/lang/String;
    :catch_4
    move-exception v5

    .line 420
    .restart local v5    # "e":Ljava/lang/Exception;
    new-instance v15, Lcom/playhaven/android/req/SignatureException;

    sget-object v16, Lcom/playhaven/android/req/SignatureException$Type;->Purchase:Lcom/playhaven/android/req/SignatureException$Type;

    move-object/from16 v0, v16

    invoke-direct {v15, v5, v0}, Lcom/playhaven/android/req/SignatureException;-><init>(Ljava/lang/Throwable;Lcom/playhaven/android/req/SignatureException$Type;)V

    throw v15
.end method
