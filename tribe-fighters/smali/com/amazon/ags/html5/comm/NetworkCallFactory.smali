.class public Lcom/amazon/ags/html5/comm/NetworkCallFactory;
.super Lcom/amazon/ags/html5/javascript/CallHandlerBase;
.source "NetworkCallFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
    }
.end annotation


# static fields
.field private static final MAX_RESPONSE_LENGTH_BYTES:I = 0xf4240

.field private static final TAG:Ljava/lang/String;

.field private static final supportedCalls:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final authManager:Lcom/amazon/ags/auth/AuthManager;

.field private final globalState:Lcom/amazon/ags/html5/util/GlobalState;

.field private final localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;

.field private final networkClient:Lcom/amazon/ags/html5/comm/NetworkClient;

.field private final supportedMethodTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/comm/NetworkCallFactory;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->TAG:Ljava/lang/String;

    .line 37
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "makeServiceCall"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->supportedCalls:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/auth/AuthManager;Landroid/os/Handler;Lcom/amazon/ags/html5/util/GlobalState;Lcom/amazon/ags/html5/util/LocalizationUtil;Lcom/amazon/ags/html5/comm/NetworkClient;)V
    .locals 2
    .param p1, "authManager"    # Lcom/amazon/ags/auth/AuthManager;
    .param p2, "uiThreadHandler"    # Landroid/os/Handler;
    .param p3, "globalState"    # Lcom/amazon/ags/html5/util/GlobalState;
    .param p4, "localizationUtil"    # Lcom/amazon/ags/html5/util/LocalizationUtil;
    .param p5, "networkClient"    # Lcom/amazon/ags/html5/comm/NetworkClient;

    .prologue
    .line 48
    sget-object v0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->supportedCalls:Ljava/util/Set;

    invoke-direct {p0, p2, v0}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;-><init>(Landroid/os/Handler;Ljava/util/Set;)V

    .line 50
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->supportedMethodTypes:Ljava/util/Set;

    .line 51
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->supportedMethodTypes:Ljava/util/Set;

    const-string v1, "get"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 52
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->supportedMethodTypes:Ljava/util/Set;

    const-string v1, "put"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 53
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->supportedMethodTypes:Ljava/util/Set;

    const-string v1, "post"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 54
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->supportedMethodTypes:Ljava/util/Set;

    const-string v1, "patch"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 56
    iput-object p1, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->authManager:Lcom/amazon/ags/auth/AuthManager;

    .line 57
    iput-object p3, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    .line 58
    iput-object p4, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;

    .line 59
    iput-object p5, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->networkClient:Lcom/amazon/ags/html5/comm/NetworkClient;

    .line 60
    return-void
.end method

.method private createRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Z)Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    .locals 13
    .param p1, "endpoint"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "method"    # Ljava/lang/String;
    .param p4, "headers"    # Lorg/json/JSONObject;
    .param p5, "parameters"    # Lorg/json/JSONObject;
    .param p6, "payload"    # Ljava/lang/String;
    .param p7, "authenticate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 164
    const-string v10, "put"

    invoke-virtual {v10, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 165
    new-instance v4, Lcom/amazon/ags/html5/comm/AGSHttpPut;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    move/from16 v0, p7

    invoke-direct {v4, v10, v0}, Lcom/amazon/ags/html5/comm/AGSHttpPut;-><init>(Ljava/lang/String;Z)V

    .line 166
    .local v4, "httpPut":Lcom/amazon/ags/html5/comm/AGSHttpPut;
    invoke-virtual/range {p5 .. p5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/amazon/ags/html5/comm/AGSHttpPut;->setRequestBody(Ljava/lang/String;)V

    .line 167
    move-object v8, v4

    .line 199
    .end local v4    # "httpPut":Lcom/amazon/ags/html5/comm/AGSHttpPut;
    .local v8, "result":Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    :goto_0
    if-eqz p4, :cond_7

    .line 200
    invoke-virtual/range {p4 .. p4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v7

    .line 201
    .local v7, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_7

    .line 202
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 203
    .local v6, "key":Ljava/lang/String;
    move-object/from16 v0, p4

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 204
    .local v9, "value":Ljava/lang/String;
    invoke-virtual {v8, v6, v9}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;->putHeaderParameter(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 168
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v8    # "result":Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    .end local v9    # "value":Ljava/lang/String;
    :cond_0
    const-string v10, "post"

    invoke-virtual {v10, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 169
    new-instance v3, Lcom/amazon/ags/html5/comm/AGSHttpPost;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    move/from16 v0, p7

    invoke-direct {v3, v10, v0}, Lcom/amazon/ags/html5/comm/AGSHttpPost;-><init>(Ljava/lang/String;Z)V

    .line 171
    .local v3, "httpPost":Lcom/amazon/ags/html5/comm/AGSHttpPost;
    invoke-virtual/range {p5 .. p5}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 172
    .local v5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 173
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 174
    .restart local v6    # "key":Ljava/lang/String;
    move-object/from16 v0, p5

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v6, v10}, Lcom/amazon/ags/html5/comm/AGSHttpPost;->putUrlParameter(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 176
    .end local v6    # "key":Ljava/lang/String;
    :cond_1
    move-object v8, v3

    .line 177
    .restart local v8    # "result":Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    goto :goto_0

    .end local v3    # "httpPost":Lcom/amazon/ags/html5/comm/AGSHttpPost;
    .end local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v8    # "result":Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    :cond_2
    const-string v10, "get"

    invoke-virtual {v10, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 178
    new-instance v1, Lcom/amazon/ags/html5/comm/AGSHttpGet;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    move/from16 v0, p7

    invoke-direct {v1, v10, v0}, Lcom/amazon/ags/html5/comm/AGSHttpGet;-><init>(Ljava/lang/String;Z)V

    .line 180
    .local v1, "httpGet":Lcom/amazon/ags/html5/comm/AGSHttpGet;
    invoke-virtual/range {p5 .. p5}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 181
    .restart local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 182
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 183
    .restart local v6    # "key":Ljava/lang/String;
    move-object/from16 v0, p5

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v6, v10}, Lcom/amazon/ags/html5/comm/AGSHttpGet;->putUrlParameter(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 185
    .end local v6    # "key":Ljava/lang/String;
    :cond_3
    move-object v8, v1

    .line 186
    .restart local v8    # "result":Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    goto/16 :goto_0

    .end local v1    # "httpGet":Lcom/amazon/ags/html5/comm/AGSHttpGet;
    .end local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v8    # "result":Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    :cond_4
    const-string v10, "patch"

    invoke-virtual {v10, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 187
    new-instance v2, Lcom/amazon/ags/html5/comm/AGSHttpPatch;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    move/from16 v0, p7

    invoke-direct {v2, v10, v0}, Lcom/amazon/ags/html5/comm/AGSHttpPatch;-><init>(Ljava/lang/String;Z)V

    .line 189
    .local v2, "httpPatch":Lcom/amazon/ags/html5/comm/AGSHttpPatch;
    invoke-virtual/range {p5 .. p5}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 190
    .restart local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 191
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 192
    .restart local v6    # "key":Ljava/lang/String;
    move-object/from16 v0, p5

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v6, v10}, Lcom/amazon/ags/html5/comm/AGSHttpPatch;->putUrlParameter(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 194
    .end local v6    # "key":Ljava/lang/String;
    :cond_5
    move-object v8, v2

    .line 195
    .restart local v8    # "result":Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    goto/16 :goto_0

    .line 196
    .end local v2    # "httpPatch":Lcom/amazon/ags/html5/comm/AGSHttpPatch;
    .end local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v8    # "result":Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    :cond_6
    new-instance v10, Ljava/lang/IllegalArgumentException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unsupported http method: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 208
    .restart local v8    # "result":Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    :cond_7
    if-eqz p6, :cond_8

    .line 210
    move-object/from16 v0, p6

    invoke-virtual {v8, v0}, Lcom/amazon/ags/html5/comm/ServiceRequestBase;->setRequestBody(Ljava/lang/String;)V

    .line 212
    :cond_8
    return-object v8
.end method

.method private createRequestResult(Lcom/amazon/ags/html5/comm/ServiceResponse;)Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
    .locals 10
    .param p1, "serviceResponse"    # Lcom/amazon/ags/html5/comm/ServiceResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;,
            Lcom/amazon/ags/AGSServiceException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 216
    invoke-static {}, Lcom/amazon/ags/html5/factory/ServiceFactory;->isDebugLoggingEnabled()Z

    move-result v0

    .line 217
    .local v0, "debugLoggingEnabled":Z
    invoke-virtual {p1}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getResponse()Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 218
    .local v3, "response":Lorg/apache/http/HttpResponse;
    invoke-virtual {p1}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getStatusCode()I

    move-result v5

    .line 219
    .local v5, "statusCode":I
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 222
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    const-string v6, "X-Amzn-RequestId"

    invoke-interface {v3, v6}, Lorg/apache/http/HttpResponse;->getLastHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    .line 225
    .local v2, "requestId":Lorg/apache/http/Header;
    if-eqz v0, :cond_0

    .line 226
    const-string v6, "DEBUG"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Network response: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    :cond_0
    const/16 v6, 0x190

    if-lt v5, v6, :cond_2

    .line 231
    if-eqz v2, :cond_1

    sget-object v6, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Network request ID for failed request: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    :cond_1
    new-instance v6, Lcom/amazon/ags/AGSServiceException;

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/amazon/ags/AGSServiceException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 235
    :cond_2
    if-nez v1, :cond_4

    .line 236
    if-eqz v2, :cond_3

    sget-object v6, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Network request ID for failed request: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    :cond_3
    new-instance v6, Lcom/amazon/ags/AGSClientException;

    const-string v7, "Received null entity from http response"

    invoke-direct {v6, v7}, Lcom/amazon/ags/AGSClientException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 242
    :cond_4
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v6

    const-wide/32 v8, 0xf4240

    cmp-long v6, v6, v8

    if-lez v6, :cond_6

    .line 243
    if-eqz v2, :cond_5

    sget-object v6, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Network request ID for failed request: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    :cond_5
    new-instance v6, Lcom/amazon/ags/AGSServiceException;

    const-string v7, "Response content is longer than expected"

    invoke-direct {v6, v7}, Lcom/amazon/ags/AGSServiceException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 247
    :cond_6
    if-eqz v0, :cond_8

    .line 249
    if-eqz v2, :cond_7

    :try_start_0
    const-string v6, "DEBUG"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Network request ID: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :cond_7
    const-string v6, "DEBUG"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Network response: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " --> "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getContent()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    :cond_8
    :goto_0
    invoke-virtual {p1}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getContent()Ljava/lang/String;

    move-result-object v4

    .line 257
    .local v4, "responseBody":Ljava/lang/String;
    new-instance v6, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;

    const-string v7, "SUCCESS"

    invoke-direct {v6, p0, v4, v7}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;-><init>(Lcom/amazon/ags/html5/comm/NetworkCallFactory;Ljava/lang/String;Ljava/lang/String;)V

    return-object v6

    .line 251
    .end local v4    # "responseBody":Ljava/lang/String;
    :catch_0
    move-exception v6

    goto :goto_0
.end method

.method private decorateRequestParametersWithPreIBAData(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "requestParameters"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 120
    const-string v2, "locale"

    iget-object v3, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;

    invoke-virtual {v3}, Lcom/amazon/ags/html5/util/LocalizationUtil;->getCurrentLocale()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 122
    iget-object v2, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->authManager:Lcom/amazon/ags/auth/AuthManager;

    invoke-virtual {v2}, Lcom/amazon/ags/auth/AuthManager;->getGameId()Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, "gameId":Ljava/lang/String;
    const-string v2, "gameId"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    const-string v2, "GameId"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    iget-object v2, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/GlobalState;->getPlayerId()Ljava/lang/String;

    move-result-object v1

    .line 126
    .local v1, "playerId":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 127
    const-string v2, "playerId"

    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 128
    const-string v2, "PlayerId"

    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 130
    :cond_0
    return-void
.end method

.method private handleServiceRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Z)V
    .locals 13
    .param p1, "requestRID"    # Ljava/lang/String;
    .param p2, "endpoint"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "method"    # Ljava/lang/String;
    .param p5, "headers"    # Lorg/json/JSONObject;
    .param p6, "parameters"    # Lorg/json/JSONObject;
    .param p7, "payload"    # Ljava/lang/String;
    .param p8, "authenticate"    # Z

    .prologue
    .line 142
    const/4 v11, 0x0

    .local v11, "response":Lcom/amazon/ags/html5/comm/ServiceResponse;
    move-object v0, p0

    move-object v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    move/from16 v7, p8

    .line 147
    :try_start_0
    invoke-direct/range {v0 .. v7}, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->createRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Z)Lcom/amazon/ags/html5/comm/ServiceRequestBase;

    move-result-object v9

    .line 148
    .local v9, "request":Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->networkClient:Lcom/amazon/ags/html5/comm/NetworkClient;

    invoke-interface {v0, v9}, Lcom/amazon/ags/html5/comm/NetworkClient;->execute(Lcom/amazon/ags/html5/comm/ServiceRequestBase;)Lcom/amazon/ags/html5/comm/ServiceResponse;

    move-result-object v11

    .line 149
    invoke-direct {p0, v11}, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->createRequestResult(Lcom/amazon/ags/html5/comm/ServiceResponse;)Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;

    move-result-object v10

    .line 150
    .local v10, "requestResult":Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
    invoke-virtual {v11}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getStatusCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v10, v0}, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->sendReply(Ljava/lang/String;Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/amazon/ags/html5/comm/ConnectionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 160
    .end local v9    # "request":Lcom/amazon/ags/html5/comm/ServiceRequestBase;
    .end local v10    # "requestResult":Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
    :goto_0
    return-void

    .line 151
    :catch_0
    move-exception v8

    .line 152
    .local v8, "e":Lcom/amazon/ags/html5/comm/ConnectionException;
    sget-object v0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Connection exception encountered while executing request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v8}, Lcom/amazon/ags/html5/comm/ConnectionException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 153
    if-eqz v11, :cond_0

    invoke-virtual {v11}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getStatusCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    .line 154
    .local v12, "statusCode":Ljava/lang/String;
    :goto_1
    new-instance v0, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;

    const-string v1, "{}"

    const-string v2, "NETWORK_ERROR"

    invoke-direct {v0, p0, v1, v2}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;-><init>(Lcom/amazon/ags/html5/comm/NetworkCallFactory;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1, v0, v12}, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->sendReply(Ljava/lang/String;Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;Ljava/lang/String;)V

    goto :goto_0

    .line 153
    .end local v12    # "statusCode":Ljava/lang/String;
    :cond_0
    const/4 v12, 0x0

    goto :goto_1

    .line 155
    .end local v8    # "e":Lcom/amazon/ags/html5/comm/ConnectionException;
    :catch_1
    move-exception v8

    .line 156
    .local v8, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception encountered while executing request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v8}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 157
    if-eqz v11, :cond_1

    invoke-virtual {v11}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getStatusCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    .line 158
    .restart local v12    # "statusCode":Ljava/lang/String;
    :goto_2
    new-instance v0, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;

    const-string v1, "{}"

    const-string v2, "ERROR"

    invoke-direct {v0, p0, v1, v2}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;-><init>(Lcom/amazon/ags/html5/comm/NetworkCallFactory;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1, v0, v12}, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->sendReply(Ljava/lang/String;Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;Ljava/lang/String;)V

    goto :goto_0

    .line 157
    .end local v12    # "statusCode":Ljava/lang/String;
    :cond_1
    const/4 v12, 0x0

    goto :goto_2
.end method

.method private sendReply(Ljava/lang/String;Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;Ljava/lang/String;)V
    .locals 2
    .param p1, "requestRID"    # Ljava/lang/String;
    .param p2, "result"    # Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
    .param p3, "statusCode"    # Ljava/lang/String;

    .prologue
    .line 133
    if-nez p2, :cond_0

    .line 134
    new-instance p2, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;

    .end local p2    # "result":Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
    const-string v0, "{}"

    const-string v1, "ERROR"

    invoke-direct {p2, p0, v0, v1}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;-><init>(Lcom/amazon/ags/html5/comm/NetworkCallFactory;Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .restart local p2    # "result":Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
    :cond_0
    invoke-virtual {p2}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;->getResponseJSON()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;->getResponseCode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1, p3}, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    return-void
.end method


# virtual methods
.method public handleMessage(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 12
    .param p1, "requestRID"    # Ljava/lang/String;
    .param p2, "nativeCallType"    # Ljava/lang/String;
    .param p3, "request"    # Lorg/json/JSONObject;

    .prologue
    .line 65
    const-string v0, "makeServiceCall"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 66
    const/4 v0, 0x0

    .line 115
    :goto_0
    return v0

    .line 69
    :cond_0
    invoke-static {}, Lcom/amazon/ags/html5/factory/ServiceFactory;->isDebugLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 70
    sget-object v0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Service call: "

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    :cond_1
    :try_start_0
    const-string v0, "method"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 84
    .local v4, "requestMethod":Ljava/lang/String;
    const-string v0, "httpHeaders"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 85
    .local v5, "requestHeaders":Lorg/json/JSONObject;
    const-string v0, "parameters"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 86
    .local v6, "requestParameters":Lorg/json/JSONObject;
    const-string v0, "httpPayload"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 87
    .local v7, "requestPayload":Ljava/lang/String;
    const-string v0, "authenticate"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v8

    .line 88
    .local v8, "authenticate":Z
    const-string v0, "endPoint"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, "requestEndpoint":Ljava/lang/String;
    const-string v0, "httpMethod"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 91
    .local v3, "requestType":Ljava/lang/String;
    if-eqz v4, :cond_2

    if-eqz v6, :cond_2

    if-eqz p1, :cond_2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 92
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Insufficient arguments for request handling"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 100
    .end local v2    # "requestEndpoint":Ljava/lang/String;
    .end local v3    # "requestType":Ljava/lang/String;
    .end local v4    # "requestMethod":Ljava/lang/String;
    .end local v5    # "requestHeaders":Lorg/json/JSONObject;
    .end local v6    # "requestParameters":Lorg/json/JSONObject;
    .end local v7    # "requestPayload":Ljava/lang/String;
    .end local v8    # "authenticate":Z
    :catch_0
    move-exception v9

    .line 101
    .local v9, "e":Lorg/json/JSONException;
    sget-object v0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unable to service request for request: "

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v11, " due to JSONException: "

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v9}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 103
    new-instance v10, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;

    const-string v0, "{}"

    const-string v1, "REQUEST_ERROR"

    invoke-direct {v10, p0, v0, v1}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;-><init>(Lcom/amazon/ags/html5/comm/NetworkCallFactory;Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .local v10, "result":Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
    invoke-virtual {v10}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;->getResponseJSON()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;->getResponseCode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 95
    .end local v9    # "e":Lorg/json/JSONException;
    .end local v10    # "result":Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
    .restart local v2    # "requestEndpoint":Ljava/lang/String;
    .restart local v3    # "requestType":Ljava/lang/String;
    .restart local v4    # "requestMethod":Ljava/lang/String;
    .restart local v5    # "requestHeaders":Lorg/json/JSONObject;
    .restart local v6    # "requestParameters":Lorg/json/JSONObject;
    .restart local v7    # "requestPayload":Ljava/lang/String;
    .restart local v8    # "authenticate":Z
    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->supportedMethodTypes:Ljava/util/Set;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 96
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unsupported http method: "

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 106
    .end local v2    # "requestEndpoint":Ljava/lang/String;
    .end local v3    # "requestType":Ljava/lang/String;
    .end local v4    # "requestMethod":Ljava/lang/String;
    .end local v5    # "requestHeaders":Lorg/json/JSONObject;
    .end local v6    # "requestParameters":Lorg/json/JSONObject;
    .end local v7    # "requestPayload":Ljava/lang/String;
    .end local v8    # "authenticate":Z
    :catch_1
    move-exception v9

    .line 107
    .local v9, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unable to service request for request: "

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v11, " due to exception: "

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 109
    new-instance v10, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;

    const-string v0, "{}"

    const-string v1, "REQUEST_ERROR"

    invoke-direct {v10, p0, v0, v1}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;-><init>(Lcom/amazon/ags/html5/comm/NetworkCallFactory;Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .restart local v10    # "result":Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
    invoke-virtual {v10}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;->getResponseJSON()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10}, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;->getResponseCode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 99
    .end local v9    # "e":Ljava/lang/Exception;
    .end local v10    # "result":Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
    .restart local v2    # "requestEndpoint":Ljava/lang/String;
    .restart local v3    # "requestType":Ljava/lang/String;
    .restart local v4    # "requestMethod":Ljava/lang/String;
    .restart local v5    # "requestHeaders":Lorg/json/JSONObject;
    .restart local v6    # "requestParameters":Lorg/json/JSONObject;
    .restart local v7    # "requestPayload":Ljava/lang/String;
    .restart local v8    # "authenticate":Z
    :cond_4
    :try_start_2
    invoke-direct {p0, v6}, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->decorateRequestParametersWithPreIBAData(Lorg/json/JSONObject;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object v0, p0

    move-object v1, p1

    .line 114
    invoke-direct/range {v0 .. v8}, Lcom/amazon/ags/html5/comm/NetworkCallFactory;->handleServiceRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Z)V

    .line 115
    const/4 v0, 0x1

    goto/16 :goto_0
.end method
