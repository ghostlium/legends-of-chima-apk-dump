.class public abstract Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
.super Ljava/lang/Object;
.source "ClientBase.java"

# interfaces
.implements Lcom/amazon/ags/client/JSONRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/client/ClientBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "AsyncTaskWrapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/amazon/ags/api/RequestResponse;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/amazon/ags/client/JSONRequest;"
    }
.end annotation


# instance fields
.field private request:Lorg/json/JSONObject;

.field private final requestDescription:Ljava/lang/String;

.field private responseHandle:Lcom/amazon/ags/client/AGResponseHandleImpl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/amazon/ags/client/AGResponseHandleImpl",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/amazon/ags/client/ClientBase;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/ClientBase;Ljava/lang/String;)V
    .locals 1
    .param p2, "requestDescription"    # Ljava/lang/String;

    .prologue
    .line 93
    .local p0, "this":Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;, "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper<TT;>;"
    iput-object p1, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->this$0:Lcom/amazon/ags/client/ClientBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->request:Lorg/json/JSONObject;

    .line 94
    iput-object p2, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->requestDescription:Ljava/lang/String;

    .line 95
    return-void
.end method


# virtual methods
.method protected abstract buildRequest()Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation
.end method

.method public buildRequestForServiceAction(I)Lorg/json/JSONObject;
    .locals 2
    .param p1, "serviceActionCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 160
    .local p0, "this":Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;, "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper<TT;>;"
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 161
    .local v0, "request":Lorg/json/JSONObject;
    const-string v1, "ACTION_CODE"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 162
    return-object v0
.end method

.method public buildRequestForServiceAction(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "serviceActionCode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "this":Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;, "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper<TT;>;"
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 167
    .local v0, "request":Lorg/json/JSONObject;
    const-string v1, "ACTION_CODE"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 168
    return-object v0
.end method

.method protected abstract convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation
.end method

.method public execute([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 4
    .param p1, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 118
    .local p0, "this":Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;, "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper<TT;>;"
    new-instance v1, Lcom/amazon/ags/client/AGResponseHandleImpl;

    invoke-direct {v1, p1}, Lcom/amazon/ags/client/AGResponseHandleImpl;-><init>([Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->responseHandle:Lcom/amazon/ags/client/AGResponseHandleImpl;

    .line 122
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->buildRequest()Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->request:Lorg/json/JSONObject;

    .line 123
    iget-object v1, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->request:Lorg/json/JSONObject;

    const-string v2, "REQUEST_ID"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 124
    iget-object v1, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->request:Lorg/json/JSONObject;

    const-string v2, "REQUEST_ID"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 126
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->this$0:Lcom/amazon/ags/client/ClientBase;

    iget-object v1, v1, Lcom/amazon/ags/client/ClientBase;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    invoke-interface {v1, p0}, Lcom/amazon/ags/html5/service/ServiceHelper;->handleRequestAsync(Lcom/amazon/ags/client/JSONRequest;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    :goto_0
    iget-object v1, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->responseHandle:Lcom/amazon/ags/client/AGResponseHandleImpl;

    return-object v1

    .line 127
    :catch_0
    move-exception v0

    .line 128
    .local v0, "e":Lorg/json/JSONException;
    iget-object v1, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->responseHandle:Lcom/amazon/ags/client/AGResponseHandleImpl;

    const/16 v2, 0x18

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazon/ags/client/AGResponseHandleImpl;->setResponse(Lcom/amazon/ags/api/RequestResponse;)V

    goto :goto_0
.end method

.method protected abstract getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/json/JSONObject;",
            ")TT;"
        }
    .end annotation
.end method

.method public getRequest()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 140
    .local p0, "this":Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;, "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper<TT;>;"
    iget-object v0, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->request:Lorg/json/JSONObject;

    return-object v0
.end method

.method public setResponse(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 147
    .local p0, "this":Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;, "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper<TT;>;"
    :try_start_0
    const-string v2, "RESPONSE_CODE"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 148
    .local v1, "responseCode":I
    const/16 v2, 0x11

    if-ne v1, v2, :cond_0

    .line 149
    iget-object v2, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->responseHandle:Lcom/amazon/ags/client/AGResponseHandleImpl;

    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->convertResponse(Lorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/amazon/ags/client/AGResponseHandleImpl;->setResponse(Lcom/amazon/ags/api/RequestResponse;)V

    .line 157
    .end local v1    # "responseCode":I
    :goto_0
    return-void

    .line 151
    .restart local v1    # "responseCode":I
    :cond_0
    iget-object v2, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->responseHandle:Lcom/amazon/ags/client/AGResponseHandleImpl;

    invoke-virtual {p0, v1, p1}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/amazon/ags/client/AGResponseHandleImpl;->setResponse(Lcom/amazon/ags/api/RequestResponse;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 153
    .end local v1    # "responseCode":I
    :catch_0
    move-exception v0

    .line 154
    .local v0, "e":Lorg/json/JSONException;
    iget-object v2, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->this$0:Lcom/amazon/ags/client/ClientBase;

    iget-object v2, v2, Lcom/amazon/ags/client/ClientBase;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to read response for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->requestDescription:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 155
    iget-object v2, p0, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->responseHandle:Lcom/amazon/ags/client/AGResponseHandleImpl;

    const/16 v3, 0x18

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->getFailureResponse(ILorg/json/JSONObject;)Lcom/amazon/ags/api/RequestResponse;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/amazon/ags/client/AGResponseHandleImpl;->setResponse(Lcom/amazon/ags/api/RequestResponse;)V

    goto :goto_0
.end method
