.class public abstract Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;
.super Ljava/lang/Object;
.source "AbstractTokenRequest.java"

# interfaces
.implements Lcom/amazon/identity/auth/device/endpoint/APTokenRequest;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$2;,
        Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$GzipDecompressingEntity;,
        Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;
    }
.end annotation


# static fields
.field public static final ACCESS_TOKEN:Ljava/lang/String; = "access_token"

.field public static final ANDROID_OS_NAME:Ljava/lang/String; = "Android"

.field public static final APP_NAME:Ljava/lang/String; = "app_name"

.field public static final APP_VERSION:Ljava/lang/String; = "app_version"

.field public static final AUTH_COOKIES:Ljava/lang/String; = "auth_cookies"

.field public static final DEFAULT_DOMAIN:Ljava/lang/String; = ".amazon.com"

.field public static final DEFAULT_USER_AGENT:Ljava/lang/String;

.field public static final DEFAULT_WEBVIEW_USER_AGENT:Ljava/lang/String;

.field public static final DEVO_PREFIX:Ljava/lang/String; = "development"

.field public static final DEV_PORT:I = 0x1bb

.field public static final DI_HW_NAME:Ljava/lang/String; = "di.hw.name"

.field public static final DI_HW_VERSION:Ljava/lang/String; = "di.hw.version"

.field public static final DI_OS_NAME:Ljava/lang/String; = "di.os.name"

.field public static final DI_OS_VERSION:Ljava/lang/String; = "di.os.version"

.field public static final DI_SDK_VERSION:Ljava/lang/String; = "di.sdk.version"

.field public static final DMS_TOKEN:Ljava/lang/String; = "dms_token"

.field public static final DOMAIN:Ljava/lang/String; = "domain"

.field public static final EXCHANGE_END_POINT:Ljava/lang/String; = "/ap/exchangetoken"

.field public static final HTTPS:Ljava/lang/String; = "https"

.field private static final LOG_TAG:Ljava/lang/String;

.field protected static final MAX_NUM_POST_PARAMS:I = 0xa

.field protected static final NUM_RETRY_ATTEMPTS:I = 0x2

.field protected static final PORT_SEPERATOR:Ljava/lang/String; = ":"

.field protected static final POST:Ljava/lang/String; = "POST"

.field public static final PRE_PROD_PREFIX:Ljava/lang/String; = "pre-prod"

.field public static final PROD_PORT:I = 0x1bb

.field public static final PROD_PREFIX:Ljava/lang/String; = "www"

.field public static final REFRESH_TOKEN:Ljava/lang/String; = "refresh_token"

.field public static final REQUESTED_TOKEN_TYPE:Ljava/lang/String; = "requested_token_type"

.field public static final RESP_COOKIES:Ljava/lang/String; = "cookies"

.field public static final RESP_TOKENS:Ljava/lang/String; = "tokens"

.field public static final REVOKE_END_POINT:Ljava/lang/String; = "/auth/signout"

.field public static final SOURCE_TOKEN:Ljava/lang/String; = "source_token"

.field public static final SOURCE_TOKEN_TYPE:Ljava/lang/String; = "source_token_type"


# instance fields
.field private _domain:Ljava/lang/String;

.field protected final _headers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/Header;",
            ">;"
        }
    .end annotation
.end field

.field protected httpClient:Lorg/apache/http/client/HttpClient;

.field private mAppName:Ljava/lang/String;

.field private mAppVersion:Ljava/lang/String;

.field protected mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

.field private mLibVersion:Ljava/lang/String;

.field private mOptions:Landroid/os/Bundle;

.field protected final postParameters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private socketTimeout:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 88
    const-class v0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AmazonAuthenticationSDK/3.3.0/Android/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->DEFAULT_USER_AGENT:Ljava/lang/String;

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AmazonWebView/AmazonAuthenticationSDK/3.3.0/Android/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->DEFAULT_WEBVIEW_USER_AGENT:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "appName"    # Ljava/lang/String;
    .param p2, "appVersion"    # Ljava/lang/String;
    .param p3, "libVersion"    # Ljava/lang/String;
    .param p4, "options"    # Landroid/os/Bundle;

    .prologue
    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    const/4 v0, -0x1

    iput v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->socketTimeout:I

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->_domain:Ljava/lang/String;

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->_headers:Ljava/util/List;

    .line 149
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->postParameters:Ljava/util/List;

    .line 150
    iput-object p4, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mOptions:Landroid/os/Bundle;

    .line 151
    iput-object p1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mAppName:Ljava/lang/String;

    .line 152
    iput-object p2, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mAppVersion:Ljava/lang/String;

    .line 153
    iput-object p3, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mLibVersion:Ljava/lang/String;

    .line 154
    return-void
.end method

.method private static getCode(Lorg/apache/http/HttpResponse;)I
    .locals 1
    .param p0, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 371
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    return v0
.end method

.method public static getRequestHost(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/String;
    .locals 5
    .param p0, "domain"    # Ljava/lang/String;
    .param p1, "options"    # Landroid/os/Bundle;

    .prologue
    .line 575
    move-object v2, p0

    .line 576
    .local v2, "requestDomain":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 578
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    const-string v4, "No domain passed into Request, Attempting to get from options"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    if-eqz p1, :cond_0

    .line 581
    const-string v3, "com.amazon.identity.ap.domain"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 584
    :cond_0
    if-nez v2, :cond_1

    .line 586
    const-string v2, ".amazon.com"

    .line 587
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    const-string v4, "No domain in options"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 589
    :cond_1
    const/4 v1, 0x0

    .line 590
    .local v1, "prefix":Ljava/lang/String;
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$2;->$SwitchMap$com$amazon$identity$auth$device$AccountManagerConstants$OVERIDE_APP_STATE:[I

    invoke-static {}, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->getOverrideLibraryState()Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    move-result-object v4

    invoke-virtual {v4}, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 599
    const-string v1, "www"

    .line 602
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 603
    .local v0, "host":Ljava/lang/String;
    return-object v0

    .line 593
    .end local v0    # "host":Ljava/lang/String;
    :pswitch_0
    const-string v1, ""

    .line 594
    goto :goto_0

    .line 596
    :pswitch_1
    const-string v1, ""

    .line 597
    goto :goto_0

    .line 590
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static getRequestPort()I
    .locals 2

    .prologue
    const/16 v1, 0x1bb

    .line 507
    invoke-static {}, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->isProd()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 513
    :cond_0
    return v1
.end method

.method private static hasReceived500(Lorg/apache/http/HttpResponse;)Z
    .locals 2
    .param p0, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 365
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    .line 366
    .local v0, "code":I
    const/16 v1, 0x1f4

    if-lt v0, v1, :cond_0

    const/16 v1, 0x258

    if-ge v0, v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private logRequestInfo()V
    .locals 10

    .prologue
    .line 342
    iget-object v6, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v6}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v6

    const-string v7, "http.useragent"

    invoke-interface {v6, v7}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 343
    .local v5, "userAgent":Ljava/lang/String;
    sget-object v6, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    const-string v7, "Logging Request info."

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "UserAgent = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    iget-object v6, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    invoke-virtual {v6}, Lorg/apache/http/client/methods/HttpRequestBase;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v2

    .line 345
    .local v2, "headers":[Lorg/apache/http/Header;
    if-eqz v2, :cond_0

    .line 347
    sget-object v6, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Number of Headers : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    array-length v8, v2

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    move-object v0, v2

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v1, v0, v3

    .line 350
    .local v1, "header":Lorg/apache/http/Header;
    sget-object v6, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Header used for request: name="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v1}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "val="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 355
    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v1    # "header":Lorg/apache/http/Header;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_0
    sget-object v6, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    const-string v7, "No Headers"

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    :cond_1
    return-void
.end method


# virtual methods
.method protected addAppInfoParameters()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 484
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->postParameters:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "app_name"

    iget-object v3, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mAppName:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 486
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mAppVersion:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 487
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->postParameters:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "app_version"

    iget-object v3, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mAppVersion:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 489
    :cond_0
    return-void
.end method

.method protected addDeviceParams()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 470
    sget-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->manufacturer:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->manufacturer:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 471
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->postParameters:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "di.hw.name"

    sget-object v3, Lcom/amazon/identity/auth/device/DeviceInfo;->manufacturer:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 473
    :cond_0
    sget-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->model:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->model:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 474
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->postParameters:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "di.hw.version"

    sget-object v3, Lcom/amazon/identity/auth/device/DeviceInfo;->model:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 476
    :cond_1
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->postParameters:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "di.os.name"

    const-string v3, "Android"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 477
    sget-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->release:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->release:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 478
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->postParameters:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "di.os.version"

    sget-object v3, Lcom/amazon/identity/auth/device/DeviceInfo;->release:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 480
    :cond_2
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->postParameters:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "di.sdk.version"

    iget-object v3, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mLibVersion:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 481
    return-void
.end method

.method protected addHeader(Lorg/apache/http/Header;)V
    .locals 1
    .param p1, "header"    # Lorg/apache/http/Header;

    .prologue
    .line 524
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->_headers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 525
    return-void
.end method

.method protected abstract addRequestInfoParameters()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation
.end method

.method protected consumeRequestContent()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 303
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    check-cast v0, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpPost;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 304
    return-void
.end method

.method public executeRequest()Lorg/apache/http/HttpResponse;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 332
    iget v1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->socketTimeout:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 333
    iget-object v1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    invoke-virtual {v1}, Lorg/apache/http/client/methods/HttpRequestBase;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    .line 334
    .local v0, "params":Lorg/apache/http/params/HttpParams;
    iget v1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->socketTimeout:I

    invoke-static {v0, v1}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 335
    iget-object v1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    invoke-virtual {v1, v0}, Lorg/apache/http/client/methods/HttpRequestBase;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 337
    .end local v0    # "params":Lorg/apache/http/params/HttpParams;
    :cond_0
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->logRequestInfo()V

    .line 338
    iget-object v1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->httpClient:Lorg/apache/http/client/HttpClient;

    iget-object v2, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    invoke-interface {v1, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    return-object v1
.end method

.method protected abstract generateTokenResponse(Lorg/apache/http/HttpResponse;)Lcom/amazon/identity/auth/device/endpoint/TokenResponse;
.end method

.method protected getDefaultHeaders()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/Header;",
            ">;"
        }
    .end annotation

    .prologue
    .line 614
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 615
    .local v0, "opfHeaders":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    new-instance v1, Lorg/apache/http/message/BasicHeader;

    const-string v2, "Accept-Encoding"

    const-string v3, "gzip, deflate"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 616
    new-instance v1, Lorg/apache/http/message/BasicHeader;

    const-string v2, "Accept-Language"

    const-string v3, "en-us,en;q=0.5"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 617
    new-instance v1, Lorg/apache/http/message/BasicHeader;

    const-string v2, "Accept"

    const-string v3, "application/xml,application/xhtml+xml,text/html,application/json;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 618
    new-instance v1, Lorg/apache/http/message/BasicHeader;

    const-string v2, "Accept-Charset"

    const-string v3, "utf-8, iso-8859-1, utf-16, *;q=0.7"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 619
    return-object v0
.end method

.method protected getDefaultHttpResponseInterceptor()Lorg/apache/http/HttpResponseInterceptor;
    .locals 1

    .prologue
    .line 630
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$1;

    invoke-direct {v0, p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$1;-><init>(Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;)V

    return-object v0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 534
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->_domain:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getEndPoint()Ljava/lang/String;
.end method

.method public getEntity()Lorg/apache/http/entity/StringEntity;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 320
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getPostParameters()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V

    .line 321
    .local v0, "urlEncodedFormEntity":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    return-object v0
.end method

.method public getHeaders()[Lorg/apache/http/Header;
    .locals 2

    .prologue
    .line 456
    iget-object v1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->_headers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v0, v1, [Lorg/apache/http/Header;

    .line 457
    .local v0, "headerArray":[Lorg/apache/http/Header;
    iget-object v1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->_headers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 458
    return-object v0
.end method

.method public getHost(Landroid/os/Bundle;)Ljava/lang/String;
    .locals 1
    .param p1, "options"    # Landroid/os/Bundle;

    .prologue
    .line 571
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getDomain()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getRequestHost(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 503
    invoke-static {}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getRequestPort()I

    move-result v0

    return v0
.end method

.method public getPostParameters()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 192
    iget-object v2, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->postParameters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/NameValuePair;

    .line 194
    .local v1, "parameter":Lorg/apache/http/NameValuePair;
    if-eqz v1, :cond_0

    .line 196
    sget-object v2, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Parameter Added to request"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "name="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " val="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 200
    :cond_0
    sget-object v2, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Parameter Added to request was NULL"

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 203
    .end local v1    # "parameter":Lorg/apache/http/NameValuePair;
    :cond_1
    iget-object v2, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->postParameters:Ljava/util/List;

    return-object v2
.end method

.method public getRequest()Lorg/apache/http/client/methods/HttpRequestBase;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 299
    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getRequestUrl()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getRequestUrl()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 549
    const/4 v4, 0x0

    .line 552
    .local v4, "url":Ljava/net/URL;
    iget-object v5, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mOptions:Landroid/os/Bundle;

    invoke-virtual {p0, v5}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getHost(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v2

    .line 553
    .local v2, "host":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getPort()I

    move-result v3

    .line 554
    .local v3, "port":I
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getEndPoint()Ljava/lang/String;

    move-result-object v1

    .line 557
    .local v1, "endPoint":Ljava/lang/String;
    :try_start_0
    new-instance v4, Ljava/net/URL;

    .end local v4    # "url":Ljava/net/URL;
    const-string v5, "https"

    invoke-direct {v4, v5, v2, v3, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 562
    .restart local v4    # "url":Ljava/net/URL;
    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 558
    .end local v4    # "url":Ljava/net/URL;
    :catch_0
    move-exception v0

    .line 559
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v5, Lcom/amazon/identity/auth/device/AuthError;

    const-string v6, "MalformedURLException"

    sget-object v7, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_BAD_PARAM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v5, v6, v0, v7}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v5
.end method

.method public getVerbAsString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 498
    const-string v0, "POST"

    return-object v0
.end method

.method protected initializeCookies()V
    .locals 0

    .prologue
    .line 520
    return-void
.end method

.method public initializeHeaders()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 609
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->_headers:Ljava/util/List;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getDefaultHeaders()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 610
    return-void
.end method

.method public initializeHttp()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 158
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->httpClient:Lorg/apache/http/client/HttpClient;

    if-nez v0, :cond_0

    .line 160
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;

    invoke-direct {v0, p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;-><init>(Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;)V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 161
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getRequest()Lorg/apache/http/client/methods/HttpRequestBase;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    .line 163
    :cond_0
    return-void
.end method

.method public initializePostParams()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 463
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->addRequestInfoParameters()V

    .line 464
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->addAppInfoParameters()V

    .line 465
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->addDeviceParams()V

    .line 466
    return-void
.end method

.method public initializeUserAgent()V
    .locals 3

    .prologue
    .line 168
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    const-string v1, "http.useragent"

    sget-object v2, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->DEFAULT_USER_AGENT:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 169
    return-void
.end method

.method public postExecute(Lorg/apache/http/HttpResponse;)V
    .locals 0
    .param p1, "httpResponse"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 179
    return-void
.end method

.method public preExecute()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 174
    return-void
.end method

.method public setDomain(Ljava/lang/String;)V
    .locals 0
    .param p1, "domain"    # Ljava/lang/String;

    .prologue
    .line 541
    iput-object p1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->_domain:Ljava/lang/String;

    .line 542
    return-void
.end method

.method public setSocketTimeout(I)V
    .locals 0
    .param p1, "timeout"    # I

    .prologue
    .line 214
    iput p1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->socketTimeout:I

    .line 215
    return-void
.end method

.method public final submit()Lcom/amazon/identity/auth/device/endpoint/TokenResponse;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    const-wide/16 v11, 0x5

    const/4 v10, 0x2

    .line 224
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->initializeHttp()V

    .line 225
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->initializeUserAgent()V

    .line 226
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->initializePostParams()V

    .line 227
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->initializeHeaders()V

    .line 228
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->initializeCookies()V

    .line 230
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->updateEntity()V

    .line 231
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getHeaders()[Lorg/apache/http/Header;

    move-result-object v3

    .line 232
    .local v3, "headers":[Lorg/apache/http/Header;
    array-length v7, v3

    if-lez v7, :cond_0

    .line 233
    iget-object v7, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    invoke-virtual {v7, v3}, Lorg/apache/http/client/methods/HttpRequestBase;->setHeaders([Lorg/apache/http/Header;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 241
    :cond_0
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->preExecute()V

    .line 243
    const/4 v5, 0x0

    .line 246
    .local v5, "response":Lorg/apache/http/HttpResponse;
    :try_start_1
    sget-object v7, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Request url: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    invoke-virtual {v9}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    const/4 v0, 0x0

    .local v0, "attempt":I
    :goto_0
    if-gt v0, v10, :cond_2

    .line 250
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->executeRequest()Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 253
    invoke-static {v5}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->hasReceived500(Lorg/apache/http/HttpResponse;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 257
    if-eq v0, v10, :cond_1

    .line 259
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 261
    :cond_1
    sget-object v7, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Received "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v5}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getCode(Lorg/apache/http/HttpResponse;)I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " error on request attempt "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int/lit8 v9, v0, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " of "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 249
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 235
    .end local v0    # "attempt":I
    .end local v3    # "headers":[Lorg/apache/http/Header;
    .end local v5    # "response":Lorg/apache/http/HttpResponse;
    :catch_0
    move-exception v6

    .line 236
    .local v6, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v7, Lcom/amazon/identity/auth/device/AuthError;

    invoke-virtual {v6}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_BAD_PARAM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v7, v8, v6, v9}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v7

    .line 237
    .end local v6    # "uee":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v2

    .line 238
    .local v2, "e":Ljava/io/IOException;
    new-instance v7, Lcom/amazon/identity/auth/device/AuthError;

    const-string v8, "Received IO error when creating RequestUrlBuilder"

    sget-object v9, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_IO:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v7, v8, v2, v9}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v7

    .line 275
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "attempt":I
    .restart local v3    # "headers":[Lorg/apache/http/Header;
    .restart local v5    # "response":Lorg/apache/http/HttpResponse;
    :cond_2
    iget-object v7, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v7, :cond_3

    .line 279
    iget-object v7, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v7}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v7

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v7, v11, v12, v8}, Lorg/apache/http/conn/ClientConnectionManager;->closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V

    .line 281
    :cond_3
    iget-object v7, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    if-eqz v7, :cond_4

    .line 286
    :try_start_2
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->consumeRequestContent()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 292
    :cond_4
    :goto_1
    invoke-virtual {p0, v5}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->postExecute(Lorg/apache/http/HttpResponse;)V

    .line 294
    invoke-virtual {p0, v5}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->generateTokenResponse(Lorg/apache/http/HttpResponse;)Lcom/amazon/identity/auth/device/endpoint/TokenResponse;

    move-result-object v7

    return-object v7

    .line 287
    :catch_2
    move-exception v2

    .line 288
    .restart local v2    # "e":Ljava/io/IOException;
    sget-object v7, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "IOException consuming httppost entity content "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 266
    .end local v0    # "attempt":I
    .end local v2    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v1

    .line 267
    .local v1, "cpe":Lorg/apache/http/client/ClientProtocolException;
    :try_start_3
    sget-object v7, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Received communication error when executing token request:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Lorg/apache/http/client/ClientProtocolException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    new-instance v7, Lcom/amazon/identity/auth/device/AuthError;

    const-string v8, "Received communication error when executing token request"

    sget-object v9, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_COM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v7, v8, v1, v9}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 275
    .end local v1    # "cpe":Lorg/apache/http/client/ClientProtocolException;
    :catchall_0
    move-exception v7

    iget-object v8, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v8, :cond_5

    .line 279
    iget-object v8, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v8}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v8

    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v8, v11, v12, v9}, Lorg/apache/http/conn/ClientConnectionManager;->closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V

    .line 281
    :cond_5
    iget-object v8, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    if-eqz v8, :cond_6

    .line 286
    :try_start_4
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->consumeRequestContent()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5

    .line 289
    :cond_6
    :goto_2
    throw v7

    .line 269
    :catch_4
    move-exception v4

    .line 270
    .local v4, "ioe":Ljava/io/IOException;
    :try_start_5
    sget-object v7, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Received IO error when executing token request:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    new-instance v7, Lcom/amazon/identity/auth/device/AuthError;

    const-string v8, "Received communication error when executing token request"

    sget-object v9, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_IO:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v7, v8, v4, v9}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 287
    .end local v4    # "ioe":Ljava/io/IOException;
    :catch_5
    move-exception v2

    .line 288
    .restart local v2    # "e":Ljava/io/IOException;
    sget-object v8, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "IOException consuming httppost entity content "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method protected updateEntity()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getEntity()Lorg/apache/http/entity/StringEntity;

    move-result-object v0

    .line 309
    .local v0, "entity":Lorg/apache/http/entity/StringEntity;
    iget-object v1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    check-cast v1, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v1, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 310
    return-void
.end method
