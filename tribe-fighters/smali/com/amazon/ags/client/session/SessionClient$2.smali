.class Lcom/amazon/ags/client/session/SessionClient$2;
.super Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
.source "SessionClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/session/SessionClient;->isWhispersyncEnabled()Lcom/amazon/ags/api/AGResponseHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper",
        "<",
        "Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/session/SessionClient;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/session/SessionClient;Ljava/lang/String;)V
    .locals 0
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/amazon/ags/client/session/SessionClient$2;->this$0:Lcom/amazon/ags/client/session/SessionClient;

    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;-><init>(Lcom/amazon/ags/client/ClientBase;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public buildRequest()Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 83
    const-string v0, "IS_WHISPERSYNC_ENABLED"

    invoke-super {p0, v0}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->buildRequestForServiceAction(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .locals 1
    .param p1, "x0"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 80
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/session/SessionClient$2;->convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;

    move-result-object v0

    return-object v0
.end method

.method public convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;
    .locals 3
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 88
    const-string v2, "RESPONSE_CODE"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 89
    .local v1, "responseCode":I
    const-string v2, "WHISPERSYNC_ENABLED"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 90
    .local v0, "enabled":Z
    new-instance v2, Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;

    invoke-direct {v2, v1, v0}, Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;-><init>(IZ)V

    return-object v2
.end method

.method public bridge synthetic getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .locals 1
    .param p1, "x0"    # I
    .param p2, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 80
    invoke-virtual {p0, p1, p2}, Lcom/amazon/ags/client/session/SessionClient$2;->getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;

    move-result-object v0

    return-object v0
.end method

.method public getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;
    .locals 3
    .param p1, "responseCode"    # I
    .param p2, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 95
    new-instance v0, Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;

    const/16 v1, 0x18

    sget-object v2, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    return-object v0
.end method
