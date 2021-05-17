.class public Lcom/amazon/ags/html5/comm/HttpNetworkClient;
.super Ljava/lang/Object;
.source "HttpNetworkClient.java"

# interfaces
.implements Lcom/amazon/ags/html5/comm/NetworkClient;


# static fields
.field private static final AUTH_TOKEN_HEADER:Ljava/lang/String; = "authorization-token"

.field private static final DEVICE_MAKE_HEADER:Ljava/lang/String; = "device-make"

.field private static final DEVICE_MODEL_HEADER:Ljava/lang/String; = "device-model"

.field public static final DEVICE_SERIAL_NUMBER_HEADER:Ljava/lang/String; = "device-serial-number"

.field private static final DEVICE_TYPE_HEADER:Ljava/lang/String; = "device-type"

.field private static final TAG:Ljava/lang/String; = "GC_HttpNetworkClient"


# instance fields
.field private final authManager:Lcom/amazon/ags/auth/AuthManager;

.field private final deviceInfo:Lcom/amazon/ags/html5/util/DeviceInfo;

.field private final eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

.field private final httpClient:Lorg/apache/http/client/HttpClient;

.field private final kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

.field private final localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;


# direct methods
.method public constructor <init>(Lorg/apache/http/client/HttpClient;Lcom/amazon/ags/client/KindleFireProxy;Lcom/amazon/ags/auth/AuthManager;Lcom/amazon/ags/html5/util/DeviceInfo;Lcom/amazon/ags/client/metrics/EventCollectorClient;Lcom/amazon/ags/html5/util/LocalizationUtil;)V
    .locals 0
    .param p1, "httpClient"    # Lorg/apache/http/client/HttpClient;
    .param p2, "kindleFireProxy"    # Lcom/amazon/ags/client/KindleFireProxy;
    .param p3, "authManager"    # Lcom/amazon/ags/auth/AuthManager;
    .param p4, "deviceInfo"    # Lcom/amazon/ags/html5/util/DeviceInfo;
    .param p5, "eventCollectorClient"    # Lcom/amazon/ags/client/metrics/EventCollectorClient;
    .param p6, "localizationUtil"    # Lcom/amazon/ags/html5/util/LocalizationUtil;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 64
    iput-object p2, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    .line 65
    iput-object p3, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->authManager:Lcom/amazon/ags/auth/AuthManager;

    .line 66
    iput-object p4, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->deviceInfo:Lcom/amazon/ags/html5/util/DeviceInfo;

    .line 67
    iput-object p5, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 68
    iput-object p6, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;

    .line 69
    return-void
.end method

.method private abortRequest(Lorg/apache/http/client/methods/HttpRequestBase;)V
    .locals 0
    .param p1, "base"    # Lorg/apache/http/client/methods/HttpRequestBase;

    .prologue
    .line 186
    if-eqz p1, :cond_0

    .line 187
    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestBase;->abort()V

    .line 189
    :cond_0
    return-void
.end method

.method private addADPTokenHeaders(Lorg/apache/http/client/methods/HttpRequestBase;Ljava/lang/String;)V
    .locals 4
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestBase;
    .param p2, "body"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation

    .prologue
    .line 175
    iget-object v1, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3, p2}, Lcom/amazon/ags/client/KindleFireProxy;->signMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 176
    .local v0, "signedResult":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 177
    new-instance v1, Lcom/amazon/ags/AGSClientException;

    const-string v2, "Network request requires authentication"

    invoke-direct {v1, v2}, Lcom/amazon/ags/AGSClientException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 179
    :cond_0
    const-string v2, "x-adp-token"

    const-string v1, "token"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v2, v1}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    const-string v1, "x-adp-alg"

    const-string v2, "SHA256withRSA:1.0"

    invoke-virtual {p1, v1, v2}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    const-string v2, "x-adp-signature"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "signature"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ":"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v1, "nonce"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v2, v1}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    return-void
.end method

.method private addAuthenticationHeaders(Lorg/apache/http/client/methods/HttpRequestBase;Ljava/lang/String;)V
    .locals 1
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestBase;
    .param p2, "body"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v0}, Lcom/amazon/ags/client/KindleFireProxy;->isKindle()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->addADPTokenHeaders(Lorg/apache/http/client/methods/HttpRequestBase;Ljava/lang/String;)V

    .line 157
    :goto_0
    return-void

    .line 155
    :cond_0
    invoke-direct {p0, p1}, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->addLWATokenHeader(Lorg/apache/http/client/methods/HttpRequestBase;)V

    goto :goto_0
.end method

.method private addLWATokenHeader(Lorg/apache/http/client/methods/HttpRequestBase;)V
    .locals 3
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestBase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation

    .prologue
    .line 163
    iget-object v1, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->authManager:Lcom/amazon/ags/auth/AuthManager;

    invoke-virtual {v1}, Lcom/amazon/ags/auth/AuthManager;->tryGetToken()Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "authToken":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 165
    new-instance v1, Lcom/amazon/ags/AGSClientException;

    const-string v2, "Network request requires authentication"

    invoke-direct {v1, v2}, Lcom/amazon/ags/AGSClientException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 167
    :cond_0
    const-string v1, "authorization-token"

    invoke-virtual {p1, v1, v0}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    return-void
.end method

.method private addRequestParameters(Lorg/apache/http/client/methods/HttpRequestBase;Lcom/amazon/ags/html5/comm/ServiceRequestBase;)V
    .locals 4
    .param p1, "req"    # Lorg/apache/http/client/methods/HttpRequestBase;
    .param p2, "serviceRequestBase"    # Lcom/amazon/ags/html5/comm/ServiceRequestBase;

    .prologue
    .line 141
    invoke-virtual {p2}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;->getHeaderParams()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 142
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 143
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p1, v2, v3}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 146
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return-void
.end method


# virtual methods
.method public final execute(Lcom/amazon/ags/html5/comm/ServiceRequestBase;)Lcom/amazon/ags/html5/comm/ServiceResponse;
    .locals 14
    .param p1, "request"    # Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/html5/comm/ConnectionException;,
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 77
    invoke-virtual {p0, p1}, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->prepare(Lcom/amazon/ags/html5/comm/ServiceRequestBase;)Lorg/apache/http/client/methods/HttpRequestBase;

    move-result-object v7

    .line 80
    .local v7, "base":Lorg/apache/http/client/methods/HttpRequestBase;
    const-string v0, "device-type"

    iget-object v1, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->deviceInfo:Lcom/amazon/ags/html5/util/DeviceInfo;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/util/DeviceInfo;->getDeviceType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    const-string v0, "device-make"

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getManufacturer()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const-string v0, "device-model"

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getModel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    const-string v0, "device-serial-number"

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    const-string v0, "locale"

    iget-object v1, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/util/LocalizationUtil;->getCurrentLocale()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    invoke-virtual {p1}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;->isAuthenticationRequired()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    invoke-virtual {p1}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;->getBody()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v7, v0}, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->addAuthenticationHeaders(Lorg/apache/http/client/methods/HttpRequestBase;Ljava/lang/String;)V

    .line 93
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 95
    .local v12, "startTime":J
    :try_start_0
    const-string v0, "GC_HttpNetworkClient"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Lorg/apache/http/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v0, v7}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v11

    .line 107
    .local v11, "response":Lorg/apache/http/HttpResponse;
    if-eqz v11, :cond_1

    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    if-nez v0, :cond_2

    .line 108
    :cond_1
    const-string v9, "HttpResponse must not be null"

    .line 109
    .local v9, "errorMsg":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long v1, v0, v12

    invoke-virtual {p1}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;->getEndpoint()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7}, Lorg/apache/http/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v4

    const-string v6, "HttpResponse must not be null"

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->reportServiceCall(JLjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 110
    new-instance v0, Lcom/amazon/ags/AGSClientException;

    const-string v1, "HttpResponse must not be null"

    invoke-direct {v0, v1}, Lcom/amazon/ags/AGSClientException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    .end local v9    # "errorMsg":Ljava/lang/String;
    .end local v11    # "response":Lorg/apache/http/HttpResponse;
    :catch_0
    move-exception v10

    .line 98
    .local v10, "ioe":Ljava/io/IOException;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long v1, v0, v12

    invoke-virtual {p1}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;->getEndpoint()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7}, Lorg/apache/http/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->reportServiceCall(JLjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 99
    invoke-direct {p0, v7}, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->abortRequest(Lorg/apache/http/client/methods/HttpRequestBase;)V

    .line 100
    new-instance v0, Lcom/amazon/ags/html5/comm/ConnectionException;

    invoke-direct {v0, v10}, Lcom/amazon/ags/html5/comm/ConnectionException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 101
    .end local v10    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v8

    .line 102
    .local v8, "e":Ljava/lang/Exception;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long v1, v0, v12

    invoke-virtual {p1}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;->getEndpoint()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7}, Lorg/apache/http/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->reportServiceCall(JLjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 104
    invoke-direct {p0, v7}, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->abortRequest(Lorg/apache/http/client/methods/HttpRequestBase;)V

    .line 105
    new-instance v0, Lcom/amazon/ags/AGSClientException;

    const-string v1, "Unexpected exception"

    invoke-direct {v0, v1, v8}, Lcom/amazon/ags/AGSClientException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 113
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v11    # "response":Lorg/apache/http/HttpResponse;
    :cond_2
    const-string v0, "GC_HttpNetworkClient"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long v1, v0, v12

    invoke-virtual {p1}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;->getEndpoint()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7}, Lorg/apache/http/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5

    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v6

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->reportServiceCall(JLjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 115
    new-instance v0, Lcom/amazon/ags/html5/comm/ServiceResponse;

    invoke-direct {v0, v11}, Lcom/amazon/ags/html5/comm/ServiceResponse;-><init>(Lorg/apache/http/HttpResponse;)V

    return-object v0
.end method

.method final prepare(Lcom/amazon/ags/html5/comm/ServiceRequestBase;)Lorg/apache/http/client/methods/HttpRequestBase;
    .locals 4
    .param p1, "request"    # Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation

    .prologue
    .line 125
    :try_start_0
    invoke-virtual {p1}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;->prepareHttpRequestBase()Lorg/apache/http/client/methods/HttpRequestBase;

    move-result-object v0

    .line 126
    .local v0, "base":Lorg/apache/http/client/methods/HttpRequestBase;
    invoke-direct {p0, v0, p1}, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->addRequestParameters(Lorg/apache/http/client/methods/HttpRequestBase;Lcom/amazon/ags/html5/comm/ServiceRequestBase;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_1

    .line 132
    return-object v0

    .line 127
    .end local v0    # "base":Lorg/apache/http/client/methods/HttpRequestBase;
    :catch_0
    move-exception v1

    .line 128
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Lcom/amazon/ags/AGSClientException;

    const-string v3, "Unable to prepare HTTP request"

    invoke-direct {v2, v3, v1}, Lcom/amazon/ags/AGSClientException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 129
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v1

    .line 130
    .local v1, "e":Ljava/net/URISyntaxException;
    new-instance v2, Lcom/amazon/ags/AGSClientException;

    const-string v3, "Invalid request URI"

    invoke-direct {v2, v3, v1}, Lcom/amazon/ags/AGSClientException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected reportServiceCall(JLjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 8
    .param p1, "duration"    # J
    .param p3, "endpoint"    # Ljava/lang/String;
    .param p4, "method"    # Ljava/lang/String;
    .param p5, "statusCode"    # I
    .param p6, "reason"    # Ljava/lang/String;

    .prologue
    .line 192
    iget-object v6, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    if-nez v6, :cond_0

    .line 193
    const-string v6, "GC_HttpNetworkClient"

    const-string v7, "Null collector. Cannot report service latency event."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    :goto_0
    return-void

    .line 197
    :cond_0
    iget-object v6, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v6}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->isReportingEnabled()Z

    move-result v6

    if-nez v6, :cond_1

    .line 198
    const-string v6, "GC_HttpNetworkClient"

    const-string v7, "Reporting is disabled. Cannot report service latency event."

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 202
    :cond_1
    sget-object v6, Lcom/amazon/ags/constants/metrics/EventNames;->GameCircleServiceCall:Lcom/amazon/ags/constants/metrics/EventNames;

    invoke-virtual {v6}, Lcom/amazon/ags/constants/metrics/EventNames;->name()Ljava/lang/String;

    move-result-object v3

    .line 204
    .local v3, "eventName":Ljava/lang/String;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 205
    .local v0, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "endpoint"

    invoke-interface {v0, v6, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const-string v6, "method"

    invoke-interface {v0, v6, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    const-string v6, "reason"

    invoke-interface {v0, v6, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 210
    .local v1, "countMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string v6, "statusCode"

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 213
    .local v5, "timeMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    const-string v6, "latency"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    :try_start_0
    new-instance v4, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    invoke-direct {v4, v3, v0, v1, v5}, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    .line 217
    .local v4, "genericEvent":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    iget-object v6, p0, Lcom/amazon/ags/html5/comm/HttpNetworkClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v6, v4}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V
    :try_end_0
    .catch Lcom/amazon/ags/client/metrics/IllegalConstructionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 218
    .end local v4    # "genericEvent":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :catch_0
    move-exception v2

    .line 219
    .local v2, "e":Lcom/amazon/ags/client/metrics/IllegalConstructionException;
    const-string v6, "GC_HttpNetworkClient"

    const-string v7, "Could not construct service latency event. It will not be reported."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
