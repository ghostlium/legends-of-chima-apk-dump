.class public final Lcom/amazon/insights/core/http/SDKInfoInterceptor;
.super Ljava/lang/Object;
.source "SDKInfoInterceptor.java"

# interfaces
.implements Lcom/amazon/insights/core/http/HttpClient$Interceptor;


# static fields
.field static final CLIENT_SDK_VERSION_HEADER_NAME:Ljava/lang/String; = "x-amzn-ClientSDKVersion"


# instance fields
.field private final sdkInfo:Lcom/amazon/insights/core/util/SDKInfo;


# direct methods
.method public constructor <init>(Lcom/amazon/insights/core/util/SDKInfo;)V
    .locals 0
    .param p1, "sdkInfo"    # Lcom/amazon/insights/core/util/SDKInfo;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/amazon/insights/core/http/SDKInfoInterceptor;->sdkInfo:Lcom/amazon/insights/core/util/SDKInfo;

    .line 19
    return-void
.end method


# virtual methods
.method public after(Lcom/amazon/insights/core/http/HttpClient$Response;)V
    .locals 0
    .param p1, "response"    # Lcom/amazon/insights/core/http/HttpClient$Response;

    .prologue
    .line 30
    return-void
.end method

.method public before(Lcom/amazon/insights/core/http/HttpClient$Request;)V
    .locals 5
    .param p1, "request"    # Lcom/amazon/insights/core/http/HttpClient$Request;

    .prologue
    .line 23
    if-eqz p1, :cond_0

    .line 24
    const-string v0, "x-amzn-ClientSDKVersion"

    const-string v1, "%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/amazon/insights/core/http/SDKInfoInterceptor;->sdkInfo:Lcom/amazon/insights/core/util/SDKInfo;

    invoke-virtual {v4}, Lcom/amazon/insights/core/util/SDKInfo;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/amazon/insights/core/http/HttpClient$Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    .line 26
    :cond_0
    return-void
.end method
