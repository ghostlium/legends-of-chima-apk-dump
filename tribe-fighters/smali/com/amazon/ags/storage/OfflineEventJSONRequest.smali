.class public Lcom/amazon/ags/storage/OfflineEventJSONRequest;
.super Ljava/lang/Object;
.source "OfflineEventJSONRequest.java"

# interfaces
.implements Lcom/amazon/ags/client/JSONRequest;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final callback:Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;

.field private final request:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/storage/OfflineEventJSONRequest;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/storage/OfflineEventJSONRequest;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;)V
    .locals 0
    .param p1, "request"    # Lorg/json/JSONObject;
    .param p2, "callback"    # Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/amazon/ags/storage/OfflineEventJSONRequest;->request:Lorg/json/JSONObject;

    .line 23
    iput-object p2, p0, Lcom/amazon/ags/storage/OfflineEventJSONRequest;->callback:Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;

    .line 24
    return-void
.end method


# virtual methods
.method public getRequest()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/amazon/ags/storage/OfflineEventJSONRequest;->request:Lorg/json/JSONObject;

    return-object v0
.end method

.method public setResponse(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 34
    :try_start_0
    const-string v2, "RESPONSE_CODE"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 35
    .local v1, "responseCode":I
    const/16 v2, 0x11

    if-ne v1, v2, :cond_0

    .line 36
    iget-object v2, p0, Lcom/amazon/ags/storage/OfflineEventJSONRequest;->callback:Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;

    invoke-interface {v2}, Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;->onSuccess()V

    .line 46
    .end local v1    # "responseCode":I
    :goto_0
    return-void

    .line 37
    .restart local v1    # "responseCode":I
    :cond_0
    const/16 v2, 0x1e

    if-eq v1, v2, :cond_1

    const/16 v2, 0x1c

    if-ne v1, v2, :cond_2

    .line 38
    :cond_1
    iget-object v2, p0, Lcom/amazon/ags/storage/OfflineEventJSONRequest;->callback:Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;

    invoke-interface {v2}, Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;->onRecoverableError()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 42
    .end local v1    # "responseCode":I
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/amazon/ags/storage/OfflineEventJSONRequest;->TAG:Ljava/lang/String;

    const-string v3, "Unable to read response for request due to error"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 44
    iget-object v2, p0, Lcom/amazon/ags/storage/OfflineEventJSONRequest;->callback:Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;

    invoke-interface {v2}, Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;->onUnrecoverableError()V

    goto :goto_0

    .line 40
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "responseCode":I
    :cond_2
    :try_start_1
    iget-object v2, p0, Lcom/amazon/ags/storage/OfflineEventJSONRequest;->callback:Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;

    invoke-interface {v2}, Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;->onUnrecoverableError()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
