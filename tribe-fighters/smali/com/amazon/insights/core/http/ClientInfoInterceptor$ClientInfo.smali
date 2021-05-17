.class final Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;
.super Ljava/lang/Object;
.source "ClientInfoInterceptor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/core/http/ClientInfoInterceptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ClientInfo"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ClientInfo"


# instance fields
.field private carrier:Ljava/lang/String;

.field private manufacturer:Ljava/lang/String;

.field private model:Ljava/lang/String;

.field private networkType:Ljava/lang/String;

.field private os:Ljava/lang/String;

.field private osVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 7

    .prologue
    .line 94
    const-string v1, "Unknown"

    const-string v2, "Unknown"

    const-string v3, "Unknown"

    const-string v4, "Unknown"

    const-string v5, "Unknown"

    const-string v6, "Unknown"

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "os"    # Ljava/lang/String;
    .param p2, "osVersion"    # Ljava/lang/String;
    .param p3, "model"    # Ljava/lang/String;
    .param p4, "manufacturer"    # Ljava/lang/String;
    .param p5, "networkType"    # Ljava/lang/String;
    .param p6, "carrier"    # Ljava/lang/String;

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    invoke-virtual {p0, p1}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setOS(Ljava/lang/String;)V

    .line 99
    invoke-virtual {p0, p2}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setOSVersion(Ljava/lang/String;)V

    .line 100
    invoke-virtual {p0, p3}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setModel(Ljava/lang/String;)V

    .line 101
    invoke-virtual {p0, p4}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setManufacturer(Ljava/lang/String;)V

    .line 102
    invoke-virtual {p0, p5}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setNetworkType(Ljava/lang/String;)V

    .line 103
    invoke-virtual {p0, p6}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->setCarrier(Ljava/lang/String;)V

    .line 104
    return-void
.end method


# virtual methods
.method public getCarrier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->carrier:Ljava/lang/String;

    return-object v0
.end method

.method public getManufacturer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->manufacturer:Ljava/lang/String;

    return-object v0
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->model:Ljava/lang/String;

    return-object v0
.end method

.method public getNetworkType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->networkType:Ljava/lang/String;

    return-object v0
.end method

.method public getOS()Ljava/lang/String;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->os:Ljava/lang/String;

    return-object v0
.end method

.method public getOSVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->osVersion:Ljava/lang/String;

    return-object v0
.end method

.method public setCarrier(Ljava/lang/String;)V
    .locals 0
    .param p1, "carrier"    # Ljava/lang/String;

    .prologue
    .line 151
    iput-object p1, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->carrier:Ljava/lang/String;

    .line 152
    return-void
.end method

.method public setManufacturer(Ljava/lang/String;)V
    .locals 0
    .param p1, "manufacturer"    # Ljava/lang/String;

    .prologue
    .line 135
    iput-object p1, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->manufacturer:Ljava/lang/String;

    .line 136
    return-void
.end method

.method public setModel(Ljava/lang/String;)V
    .locals 0
    .param p1, "model"    # Ljava/lang/String;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->model:Ljava/lang/String;

    .line 128
    return-void
.end method

.method public setNetworkType(Ljava/lang/String;)V
    .locals 0
    .param p1, "networkType"    # Ljava/lang/String;

    .prologue
    .line 143
    iput-object p1, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->networkType:Ljava/lang/String;

    .line 144
    return-void
.end method

.method public setOS(Ljava/lang/String;)V
    .locals 0
    .param p1, "os"    # Ljava/lang/String;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->os:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public setOSVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "osVersion"    # Ljava/lang/String;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->osVersion:Ljava/lang/String;

    .line 120
    return-void
.end method

.method protected toJsonObject()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 160
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 162
    .local v1, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "os"

    invoke-virtual {p0}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->getOS()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 163
    const-string v2, "osVersion"

    invoke-virtual {p0}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->getOSVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 164
    const-string v2, "model"

    invoke-virtual {p0}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->getModel()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 165
    const-string v2, "manufacturer"

    invoke-virtual {p0}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->getManufacturer()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 166
    const-string v2, "networkType"

    invoke-virtual {p0}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->getNetworkType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 167
    const-string v2, "carrier"

    invoke-virtual {p0}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->getCarrier()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    :goto_0
    return-object v1

    .line 168
    :catch_0
    move-exception v0

    .line 169
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "ClientInfo"

    const-string v3, "Couldn\'t serialize clientInfo to a JSONObject"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 156
    invoke-virtual {p0}, Lcom/amazon/insights/core/http/ClientInfoInterceptor$ClientInfo;->toJsonObject()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
