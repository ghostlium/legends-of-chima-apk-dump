.class public Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClientImpl;
.super Ljava/lang/Object;
.source "WhispersyncHttpClientImpl.java"

# interfaces
.implements Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClient;


# static fields
.field private static final DATE_KEY:Ljava/lang/String; = "Date"

.field private static final GET_ENDPOINT:Ljava/lang/String; = "https://ags-ext.amazon.com/service/gamedata/WhisperData"

.field private static final POST_ENDPOINT:Ljava/lang/String; = "https://ags-ext.amazon.com/service/gamedata/WhisperData"

.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"

.field private static final VERSION_ID_HEADER_KEY:Ljava/lang/String; = "x-amzn-gc-version-id"


# instance fields
.field private final gameId:Ljava/lang/String;

.field private final networkClient:Lcom/amazon/ags/html5/comm/NetworkClient;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/html5/comm/NetworkClient;Ljava/lang/String;)V
    .locals 0
    .param p1, "networkClient"    # Lcom/amazon/ags/html5/comm/NetworkClient;
    .param p2, "gameId"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClientImpl;->networkClient:Lcom/amazon/ags/html5/comm/NetworkClient;

    .line 37
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClientImpl;->gameId:Ljava/lang/String;

    .line 38
    return-void
.end method


# virtual methods
.method public getWhisperData(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;
    .locals 10
    .param p1, "priorVersionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;,
            Lcom/amazon/ags/AGSServiceException;,
            Lcom/amazon/ags/html5/comm/ConnectionException;
        }
    .end annotation

    .prologue
    .line 84
    new-instance v0, Lcom/amazon/ags/html5/comm/AGSHttpGet;

    const-string v7, "https://ags-ext.amazon.com/service/gamedata/WhisperData"

    const/4 v8, 0x1

    invoke-direct {v0, v7, v8}, Lcom/amazon/ags/html5/comm/AGSHttpGet;-><init>(Ljava/lang/String;Z)V

    .line 87
    .local v0, "agsHttpGet":Lcom/amazon/ags/html5/comm/AGSHttpGet;
    if-eqz p1, :cond_0

    .line 88
    const-string v7, "x-amzn-gc-version-id"

    invoke-virtual {v0, v7, p1}, Lcom/amazon/ags/html5/comm/AGSHttpGet;->putHeaderParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    :cond_0
    const-string v7, "gameId"

    iget-object v8, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClientImpl;->gameId:Ljava/lang/String;

    invoke-virtual {v0, v7, v8}, Lcom/amazon/ags/html5/comm/AGSHttpGet;->putUrlParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    iget-object v7, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClientImpl;->networkClient:Lcom/amazon/ags/html5/comm/NetworkClient;

    invoke-interface {v7, v0}, Lcom/amazon/ags/html5/comm/NetworkClient;->execute(Lcom/amazon/ags/html5/comm/ServiceRequestBase;)Lcom/amazon/ags/html5/comm/ServiceResponse;

    move-result-object v5

    .line 97
    .local v5, "serviceResponse":Lcom/amazon/ags/html5/comm/ServiceResponse;
    :try_start_0
    invoke-virtual {v5}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getContent()Ljava/lang/String;

    move-result-object v2

    .line 98
    .local v2, "document":Ljava/lang/String;
    const-string v7, "Date"

    invoke-virtual {v5, v7}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getHeader(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 102
    .local v1, "date":Ljava/lang/String;
    const-string v7, "GC_Whispersync"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Received HTTP Status Code ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getStatusCode()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] and content ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] when saving data to the cloud"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    invoke-virtual {v5}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getStatusCode()I

    move-result v4

    .line 106
    .local v4, "responseCode":I
    const/16 v7, 0xc8

    if-ne v4, v7, :cond_1

    .line 107
    const-string v7, "x-amzn-gc-version-id"

    invoke-virtual {v5, v7}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 119
    .local v6, "versionId":Ljava/lang/String;
    :goto_0
    new-instance v7, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;

    invoke-direct {v7, v2, v6, v1}, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v7

    .line 99
    .end local v1    # "date":Ljava/lang/String;
    .end local v2    # "document":Ljava/lang/String;
    .end local v4    # "responseCode":I
    .end local v6    # "versionId":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 100
    .local v3, "e":Ljava/io/IOException;
    new-instance v7, Lcom/amazon/ags/html5/comm/ConnectionException;

    const-string v8, "error reading content"

    invoke-direct {v7, v8, v3}, Lcom/amazon/ags/html5/comm/ConnectionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 108
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v1    # "date":Ljava/lang/String;
    .restart local v2    # "document":Ljava/lang/String;
    .restart local v4    # "responseCode":I
    :cond_1
    const/16 v7, 0xcc

    if-ne v4, v7, :cond_2

    .line 109
    const-string v6, ""

    .line 110
    .restart local v6    # "versionId":Ljava/lang/String;
    const-string v7, "GC_Whispersync"

    const-string v8, "No content found while getting Whispersync data from the service"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 111
    .end local v6    # "versionId":Ljava/lang/String;
    :cond_2
    const/16 v7, 0x194

    if-ne v4, v7, :cond_3

    .line 112
    const-string v6, ""

    .line 113
    .restart local v6    # "versionId":Ljava/lang/String;
    const-string v7, "GC_Whispersync"

    const-string v8, "Resource not found"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 116
    .end local v6    # "versionId":Ljava/lang/String;
    :cond_3
    const-string v7, "GC_Whispersync"

    const-string v8, "Unexpected Http Status Code received when making call to get Whispersync data from the service"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    new-instance v7, Lcom/amazon/ags/html5/comm/ConnectionException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unexpected Status Response: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/amazon/ags/html5/comm/ConnectionException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method public postWhisperData(Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;)Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;
    .locals 12
    .param p1, "whispersyncRequest"    # Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;,
            Lcom/amazon/ags/AGSServiceException;,
            Lcom/amazon/ags/html5/comm/ConnectionException;
        }
    .end annotation

    .prologue
    .line 43
    new-instance v0, Lcom/amazon/ags/html5/comm/AGSHttpPost;

    const-string v9, "https://ags-ext.amazon.com/service/gamedata/WhisperData"

    const/4 v10, 0x1

    invoke-direct {v0, v9, v10}, Lcom/amazon/ags/html5/comm/AGSHttpPost;-><init>(Ljava/lang/String;Z)V

    .line 44
    .local v0, "agsHttpPost":Lcom/amazon/ags/html5/comm/AGSHttpPost;
    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;->getDocument()Ljava/lang/String;

    move-result-object v2

    .line 45
    .local v2, "document":Ljava/lang/String;
    invoke-virtual {v0, v2}, Lcom/amazon/ags/html5/comm/AGSHttpPost;->setRequestBody(Ljava/lang/String;)V

    .line 47
    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;->getPriorVersionId()Ljava/lang/String;

    move-result-object v5

    .line 48
    .local v5, "priorVersionId":Ljava/lang/String;
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_0

    .line 49
    const-string v9, "x-amzn-gc-version-id"

    invoke-virtual {v0, v9, v5}, Lcom/amazon/ags/html5/comm/AGSHttpPost;->putHeaderParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    :cond_0
    const-string v9, "gameId"

    iget-object v10, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClientImpl;->gameId:Ljava/lang/String;

    invoke-virtual {v0, v9, v10}, Lcom/amazon/ags/html5/comm/AGSHttpPost;->putUrlParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    iget-object v9, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClientImpl;->networkClient:Lcom/amazon/ags/html5/comm/NetworkClient;

    invoke-interface {v9, v0}, Lcom/amazon/ags/html5/comm/NetworkClient;->execute(Lcom/amazon/ags/html5/comm/ServiceRequestBase;)Lcom/amazon/ags/html5/comm/ServiceResponse;

    move-result-object v7

    .line 58
    .local v7, "serviceResponse":Lcom/amazon/ags/html5/comm/ServiceResponse;
    :try_start_0
    invoke-virtual {v7}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getContent()Ljava/lang/String;

    move-result-object v4

    .line 59
    .local v4, "mergedDocument":Ljava/lang/String;
    const-string v9, "Date"

    invoke-virtual {v7, v9}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getHeader(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 63
    .local v1, "date":Ljava/lang/String;
    const-string v9, "GC_Whispersync"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Received HTTP Status Code ["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v7}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getStatusCode()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "] and content ["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "] when saving data to the cloud"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    invoke-virtual {v7}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getStatusCode()I

    move-result v6

    .line 67
    .local v6, "responseCode":I
    const/16 v9, 0xc8

    if-ne v6, v9, :cond_1

    .line 68
    const-string v9, "x-amzn-gc-version-id"

    invoke-virtual {v7, v9}, Lcom/amazon/ags/html5/comm/ServiceResponse;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 77
    .local v8, "versionId":Ljava/lang/String;
    :goto_0
    new-instance v9, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;

    invoke-direct {v9, v4, v8, v1}, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v9

    .line 60
    .end local v1    # "date":Ljava/lang/String;
    .end local v4    # "mergedDocument":Ljava/lang/String;
    .end local v6    # "responseCode":I
    .end local v8    # "versionId":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 61
    .local v3, "e":Ljava/io/IOException;
    new-instance v9, Lcom/amazon/ags/html5/comm/ConnectionException;

    const-string v10, "error reading content"

    invoke-direct {v9, v10, v3}, Lcom/amazon/ags/html5/comm/ConnectionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 69
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v1    # "date":Ljava/lang/String;
    .restart local v4    # "mergedDocument":Ljava/lang/String;
    .restart local v6    # "responseCode":I
    :cond_1
    const/16 v9, 0xcc

    if-ne v6, v9, :cond_2

    .line 70
    const-string v8, ""

    .line 71
    .restart local v8    # "versionId":Ljava/lang/String;
    const-string v9, "GC_Whispersync"

    const-string v10, "No content found while getting whispersync data from the service"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 73
    .end local v8    # "versionId":Ljava/lang/String;
    :cond_2
    const-string v9, "GC_Whispersync"

    const-string v10, "Unexpected Http Status Code received when making call to get whispersync data from the service"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    new-instance v9, Lcom/amazon/ags/AGSServiceException;

    const-string v10, "Unexpected Service Response"

    invoke-direct {v9, v10}, Lcom/amazon/ags/AGSServiceException;-><init>(Ljava/lang/String;)V

    throw v9
.end method
