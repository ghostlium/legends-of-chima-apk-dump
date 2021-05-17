.class public interface abstract Lcom/amazon/ags/client/whispersync/network/WhispersyncHttpClient;
.super Ljava/lang/Object;
.source "WhispersyncHttpClient.java"


# virtual methods
.method public abstract getWhisperData(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;,
            Lcom/amazon/ags/AGSServiceException;,
            Lcom/amazon/ags/html5/comm/ConnectionException;
        }
    .end annotation
.end method

.method public abstract postWhisperData(Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;)Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;,
            Lcom/amazon/ags/AGSServiceException;,
            Lcom/amazon/ags/html5/comm/ConnectionException;
        }
    .end annotation
.end method
