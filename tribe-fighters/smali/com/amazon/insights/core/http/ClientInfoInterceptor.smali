.class public final Lcom/amazon/insights/core/http/ClientInfoInterceptor;
.super Ljava/lang/Object;
.source "ClientInfoInterceptor.java"

# interfaces
.implements Lcom/amazon/insights/core/http/HttpClient$Interceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;
    }
.end annotation


# static fields
.field static final CLIENT_INFO_HEADER_NAME:Ljava/lang/String; = "x-amzn-ClientInfo"


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-virtual {p0, p1}, Lcom/amazon/insights/core/http/ClientInfoInterceptor;->setContext(Landroid/content/Context;)V

    .line 28
    return-void
.end method

.method private getClientInfo()Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;
    .locals 7

    .prologue
    .line 51
    new-instance v0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;

    invoke-direct {v0}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;-><init>()V

    .line 53
    .local v0, "clientInfo":Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;
    const-string v5, "Android"

    invoke-virtual {v0, v5}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setOS(Ljava/lang/String;)V

    .line 54
    sget-object v5, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setOSVersion(Ljava/lang/String;)V

    .line 55
    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setModel(Ljava/lang/String;)V

    .line 56
    sget-object v5, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setManufacturer(Ljava/lang/String;)V

    .line 59
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/insights/core/http/ClientInfoInterceptor;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "phone"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    .line 60
    .local v4, "telephony":Landroid/telephony/TelephonyManager;
    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 61
    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setCarrier(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .end local v4    # "telephony":Landroid/telephony/TelephonyManager;
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Lcom/amazon/insights/core/http/ClientInfoInterceptor;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "connectivity"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 71
    .local v1, "connectivity":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    .line 72
    .local v3, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 73
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setNetworkType(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 80
    .end local v1    # "connectivity":Landroid/net/ConnectivityManager;
    .end local v3    # "networkInfo":Landroid/net/NetworkInfo;
    :goto_1
    return-object v0

    .line 63
    .restart local v4    # "telephony":Landroid/telephony/TelephonyManager;
    :cond_0
    :try_start_2
    const-string v5, "Unknown"

    invoke-virtual {v0, v5}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setCarrier(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 65
    .end local v4    # "telephony":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v2

    .line 66
    .local v2, "ex":Ljava/lang/Exception;
    const-string v5, "Unknown"

    invoke-virtual {v0, v5}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setCarrier(Ljava/lang/String;)V

    goto :goto_0

    .line 75
    .end local v2    # "ex":Ljava/lang/Exception;
    .restart local v1    # "connectivity":Landroid/net/ConnectivityManager;
    .restart local v3    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_1
    :try_start_3
    const-string v5, "Unknown"

    invoke-virtual {v0, v5}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setNetworkType(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 77
    .end local v1    # "connectivity":Landroid/net/ConnectivityManager;
    .end local v3    # "networkInfo":Landroid/net/NetworkInfo;
    :catch_1
    move-exception v2

    .line 78
    .restart local v2    # "ex":Ljava/lang/Exception;
    const-string v5, "Unknown"

    invoke-virtual {v0, v5}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setNetworkType(Ljava/lang/String;)V

    goto :goto_1
.end method


# virtual methods
.method public after(Lcom/amazon/insights/core/http/HttpClient$Response;)V
    .locals 0
    .param p1, "response"    # Lcom/amazon/insights/core/http/HttpClient$Response;

    .prologue
    .line 48
    return-void
.end method

.method public before(Lcom/amazon/insights/core/http/HttpClient$Request;)V
    .locals 2
    .param p1, "request"    # Lcom/amazon/insights/core/http/HttpClient$Request;

    .prologue
    .line 40
    if-eqz p1, :cond_0

    .line 41
    const-string v0, "x-amzn-ClientInfo"

    invoke-direct {p0}, Lcom/amazon/insights/core/http/ClientInfoInterceptor;->getClientInfo()Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/amazon/insights/core/http/HttpClient$Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;

    .line 43
    :cond_0
    return-void
.end method

.method getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor;->context:Landroid/content/Context;

    return-object v0
.end method

.method setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor;->context:Landroid/content/Context;

    .line 36
    return-void
.end method
