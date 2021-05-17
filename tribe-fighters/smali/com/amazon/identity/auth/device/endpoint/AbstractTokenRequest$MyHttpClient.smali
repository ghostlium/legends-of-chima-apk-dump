.class public Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;
.super Lorg/apache/http/impl/client/DefaultHttpClient;
.source "AbstractTokenRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyHttpClient"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient$MySSLSocketFactory;
    }
.end annotation


# static fields
.field private static final BKS:Ljava/lang/String; = "BKS"

.field private static final HTTPS:Ljava/lang/String; = "https"


# instance fields
.field final synthetic this$0:Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;


# direct methods
.method public constructor <init>(Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;)V
    .locals 1

    .prologue
    .line 383
    iput-object p1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;->this$0:Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;

    invoke-direct {p0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 384
    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->getDefaultHttpResponseInterceptor()Lorg/apache/http/HttpResponseInterceptor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;->addResponseInterceptor(Lorg/apache/http/HttpResponseInterceptor;)V

    .line 385
    return-void
.end method

.method private newSslSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .locals 4

    .prologue
    .line 393
    :try_start_0
    const-string v3, "BKS"

    invoke-static {v3}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v2

    .line 394
    .local v2, "trusted":Ljava/security/KeyStore;
    new-instance v1, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient$MySSLSocketFactory;

    invoke-direct {v1, p0, v2}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient$MySSLSocketFactory;-><init>(Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;Ljava/security/KeyStore;)V

    .line 395
    .local v1, "factory":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    sget-object v3, Lorg/apache/http/conn/ssl/SSLSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-virtual {v1, v3}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 396
    return-object v1

    .line 397
    .end local v1    # "factory":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .end local v2    # "trusted":Ljava/security/KeyStore;
    :catch_0
    move-exception v0

    .line 398
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method


# virtual methods
.method protected createClientConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
    .locals 5

    .prologue
    .line 405
    invoke-static {}, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->isProd()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 406
    invoke-super {p0}, Lorg/apache/http/impl/client/DefaultHttpClient;->createClientConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    .line 411
    :goto_0
    return-object v1

    .line 409
    :cond_0
    new-instance v0, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v0}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 410
    .local v0, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v1, Lorg/apache/http/conn/scheme/Scheme;

    const-string v2, "https"

    invoke-direct {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;->newSslSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v3

    const/16 v4, 0x1bb

    invoke-direct {v1, v2, v3, v4}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v0, v1}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 411
    new-instance v1, Lorg/apache/http/impl/conn/SingleClientConnManager;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/http/impl/conn/SingleClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    goto :goto_0
.end method
