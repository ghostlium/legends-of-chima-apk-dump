.class public Lcom/amazon/insights/core/DefaultInsightsContext;
.super Ljava/lang/Object;
.source "DefaultInsightsContext.java"

# interfaces
.implements Lcom/amazon/insights/core/InsightsContext;


# instance fields
.field private final configuration:Lcom/amazon/insights/core/configuration/Configuration;

.field private final credentials:Lcom/amazon/insights/InsightsCredentials;

.field private final deliveryClient:Lcom/amazon/insights/delivery/DeliveryClient;

.field private final httpClient:Lcom/amazon/insights/core/http/HttpClient;

.field private final sdkInfo:Lcom/amazon/insights/core/util/SDKInfo;

.field private final system:Lcom/amazon/insights/core/system/System;

.field private uniqueId:Lcom/amazon/insights/core/idresolver/Id;

.field private final uniqueIdService:Lcom/amazon/insights/core/idresolver/UniqueIdService;

.field private final userProfile:Lcom/amazon/insights/UserProfile;


# direct methods
.method public constructor <init>(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/UserProfile;Lcom/amazon/insights/core/util/SDKInfo;ZLjava/util/Map;)V
    .locals 3
    .param p1, "credentials"    # Lcom/amazon/insights/InsightsCredentials;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "userProfile"    # Lcom/amazon/insights/UserProfile;
    .param p4, "sdkInfo"    # Lcom/amazon/insights/core/util/SDKInfo;
    .param p5, "allowWanDelivery"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/InsightsCredentials;",
            "Landroid/content/Context;",
            "Lcom/amazon/insights/UserProfile;",
            "Lcom/amazon/insights/core/util/SDKInfo;",
            "Z",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p6, "configurationSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->credentials:Lcom/amazon/insights/InsightsCredentials;

    .line 49
    iput-object p3, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->userProfile:Lcom/amazon/insights/UserProfile;

    .line 50
    iput-object p4, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->sdkInfo:Lcom/amazon/insights/core/util/SDKInfo;

    .line 52
    new-instance v0, Lcom/amazon/insights/core/system/AndroidSystem;

    invoke-direct {v0, p2, p1}, Lcom/amazon/insights/core/system/AndroidSystem;-><init>(Landroid/content/Context;Lcom/amazon/insights/InsightsCredentials;)V

    iput-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->system:Lcom/amazon/insights/core/system/System;

    .line 54
    invoke-static {}, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;->newInstance()Lcom/amazon/insights/core/idresolver/UniqueIdService;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->uniqueIdService:Lcom/amazon/insights/core/idresolver/UniqueIdService;

    .line 55
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->uniqueIdService:Lcom/amazon/insights/core/idresolver/UniqueIdService;

    invoke-interface {v0, p0}, Lcom/amazon/insights/core/idresolver/UniqueIdService;->getUniqueId(Lcom/amazon/insights/core/InsightsContext;)Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->uniqueId:Lcom/amazon/insights/core/idresolver/Id;

    .line 57
    new-instance v0, Lcom/amazon/insights/core/http/DefaultHttpClient;

    invoke-direct {v0}, Lcom/amazon/insights/core/http/DefaultHttpClient;-><init>()V

    iput-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->httpClient:Lcom/amazon/insights/core/http/HttpClient;

    .line 58
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->httpClient:Lcom/amazon/insights/core/http/HttpClient;

    new-instance v1, Lcom/amazon/insights/core/http/SDKInfoInterceptor;

    invoke-direct {v1, p4}, Lcom/amazon/insights/core/http/SDKInfoInterceptor;-><init>(Lcom/amazon/insights/core/util/SDKInfo;)V

    invoke-interface {v0, v1}, Lcom/amazon/insights/core/http/HttpClient;->addInterceptor(Lcom/amazon/insights/core/http/HttpClient$Interceptor;)V

    .line 59
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->httpClient:Lcom/amazon/insights/core/http/HttpClient;

    new-instance v1, Lcom/amazon/insights/core/http/ClientInfoInterceptor;

    invoke-direct {v1, p2}, Lcom/amazon/insights/core/http/ClientInfoInterceptor;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Lcom/amazon/insights/core/http/HttpClient;->addInterceptor(Lcom/amazon/insights/core/http/HttpClient$Interceptor;)V

    .line 60
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->httpClient:Lcom/amazon/insights/core/http/HttpClient;

    new-instance v1, Lcom/amazon/insights/core/http/SignatureInterceptor;

    invoke-interface {p1}, Lcom/amazon/insights/InsightsCredentials;->getPrivateKey()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/amazon/insights/core/http/SignatureInterceptor;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/amazon/insights/core/http/HttpClient;->addInterceptor(Lcom/amazon/insights/core/http/HttpClient$Interceptor;)V

    .line 61
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->httpClient:Lcom/amazon/insights/core/http/HttpClient;

    new-instance v1, Lcom/amazon/insights/core/http/LogInterceptor;

    invoke-direct {v1}, Lcom/amazon/insights/core/http/LogInterceptor;-><init>()V

    invoke-interface {v0, v1}, Lcom/amazon/insights/core/http/HttpClient;->addInterceptor(Lcom/amazon/insights/core/http/HttpClient$Interceptor;)V

    .line 63
    invoke-static {p0, p6}, Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;->newInstance(Lcom/amazon/insights/core/InsightsContext;Ljava/util/Map;)Lcom/amazon/insights/core/configuration/HttpCachingConfiguration;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->configuration:Lcom/amazon/insights/core/configuration/Configuration;

    .line 65
    invoke-static {p0, p5}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->newInstance(Lcom/amazon/insights/core/InsightsContext;Z)Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->deliveryClient:Lcom/amazon/insights/delivery/DeliveryClient;

    .line 68
    const-string v0, "SubmitMeasurements"

    invoke-static {p2, v0}, Lcom/amazon/insights/InsightsProcessingService;->cancelPendingIntent(Landroid/content/Context;Ljava/lang/String;)V

    .line 69
    const-string v0, "SyncConfiguration"

    invoke-static {p2, v0}, Lcom/amazon/insights/InsightsProcessingService;->cancelPendingIntent(Landroid/content/Context;Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public static newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/core/util/SDKInfo;ZLjava/util/Map;)Lcom/amazon/insights/core/InsightsContext;
    .locals 7
    .param p0, "credentials"    # Lcom/amazon/insights/InsightsCredentials;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sdkInfo"    # Lcom/amazon/insights/core/util/SDKInfo;
    .param p3, "allowWanDelivery"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/InsightsCredentials;",
            "Landroid/content/Context;",
            "Lcom/amazon/insights/core/util/SDKInfo;",
            "Z",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/amazon/insights/core/InsightsContext;"
        }
    .end annotation

    .prologue
    .line 44
    .local p4, "configurationSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/amazon/insights/core/DefaultInsightsContext;

    new-instance v3, Lcom/amazon/insights/profile/DefaultUserProfile;

    invoke-direct {v3}, Lcom/amazon/insights/profile/DefaultUserProfile;-><init>()V

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/amazon/insights/core/DefaultInsightsContext;-><init>(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;Lcom/amazon/insights/UserProfile;Lcom/amazon/insights/core/util/SDKInfo;ZLjava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->configuration:Lcom/amazon/insights/core/configuration/Configuration;

    return-object v0
.end method

.method public getCredentials()Lcom/amazon/insights/InsightsCredentials;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->credentials:Lcom/amazon/insights/InsightsCredentials;

    return-object v0
.end method

.method public getDeliveryClient()Lcom/amazon/insights/delivery/DeliveryClient;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->deliveryClient:Lcom/amazon/insights/delivery/DeliveryClient;

    return-object v0
.end method

.method public getHttpClient()Lcom/amazon/insights/core/http/HttpClient;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->httpClient:Lcom/amazon/insights/core/http/HttpClient;

    return-object v0
.end method

.method public getSDKInfo()Lcom/amazon/insights/core/util/SDKInfo;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->sdkInfo:Lcom/amazon/insights/core/util/SDKInfo;

    return-object v0
.end method

.method public getSystem()Lcom/amazon/insights/core/system/System;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->system:Lcom/amazon/insights/core/system/System;

    return-object v0
.end method

.method public getUniqueId()Lcom/amazon/insights/core/idresolver/Id;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->uniqueId:Lcom/amazon/insights/core/idresolver/Id;

    return-object v0
.end method

.method public getUserProfile()Lcom/amazon/insights/UserProfile;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->userProfile:Lcom/amazon/insights/UserProfile;

    return-object v0
.end method

.method public synchronize()V
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->uniqueIdService:Lcom/amazon/insights/core/idresolver/UniqueIdService;

    invoke-interface {v0, p0}, Lcom/amazon/insights/core/idresolver/UniqueIdService;->getUniqueId(Lcom/amazon/insights/core/InsightsContext;)Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->uniqueId:Lcom/amazon/insights/core/idresolver/Id;

    .line 110
    iget-object v0, p0, Lcom/amazon/insights/core/DefaultInsightsContext;->configuration:Lcom/amazon/insights/core/configuration/Configuration;

    invoke-interface {v0}, Lcom/amazon/insights/core/configuration/Configuration;->refresh()V

    .line 111
    return-void
.end method
