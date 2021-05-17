.class Lcom/amazon/ags/client/player/PlayerClientImpl$1;
.super Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
.source "PlayerClientImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/player/PlayerClientImpl;->getLocalPlayer([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper",
        "<",
        "Lcom/amazon/ags/api/player/RequestPlayerResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/player/PlayerClientImpl;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/player/PlayerClientImpl;Ljava/lang/String;)V
    .locals 0
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/amazon/ags/client/player/PlayerClientImpl$1;->this$0:Lcom/amazon/ags/client/player/PlayerClientImpl;

    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;-><init>(Lcom/amazon/ags/client/ClientBase;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public buildRequest()Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 61
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 62
    .local v0, "request":Lorg/json/JSONObject;
    const-string v1, "ACTION_CODE"

    const/16 v2, 0x12

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 63
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
    .line 58
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/player/PlayerClientImpl$1;->convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/player/RequestPlayerResponse;

    move-result-object v0

    return-object v0
.end method

.method public convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/player/RequestPlayerResponse;
    .locals 7
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 68
    const-string v5, "RESPONSE_CODE"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 69
    .local v4, "responseCode":I
    const-string v5, "ALIAS"

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "alias":Ljava/lang/String;
    const-string v5, "playerId"

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 71
    .local v3, "playerId":Ljava/lang/String;
    const-string v5, "avatarUrl"

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 72
    .local v1, "avatarUrl":Ljava/lang/String;
    new-instance v2, Lcom/amazon/ags/client/player/PlayerImpl;

    invoke-direct {v2, v3, v0, v1}, Lcom/amazon/ags/client/player/PlayerImpl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .local v2, "player":Lcom/amazon/ags/api/player/Player;
    new-instance v5, Lcom/amazon/ags/client/player/RequestPlayerResponseImpl;

    invoke-direct {v5, v2, v4}, Lcom/amazon/ags/client/player/RequestPlayerResponseImpl;-><init>(Lcom/amazon/ags/api/player/Player;I)V

    return-object v5
.end method

.method public bridge synthetic getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .locals 1
    .param p1, "x0"    # I
    .param p2, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 58
    invoke-virtual {p0, p1, p2}, Lcom/amazon/ags/client/player/PlayerClientImpl$1;->getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/player/RequestPlayerResponse;

    move-result-object v0

    return-object v0
.end method

.method public getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/player/RequestPlayerResponse;
    .locals 3
    .param p1, "responseCode"    # I
    .param p2, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 78
    invoke-static {}, Lcom/amazon/ags/client/player/PlayerClientImpl;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Request player failure response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    new-instance v0, Lcom/amazon/ags/client/player/RequestPlayerResponseImpl;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/player/RequestPlayerResponseImpl;-><init>(Lcom/amazon/ags/api/player/Player;I)V

    return-object v0
.end method
