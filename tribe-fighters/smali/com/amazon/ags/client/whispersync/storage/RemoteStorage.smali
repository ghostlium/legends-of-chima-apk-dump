.class public interface abstract Lcom/amazon/ags/client/whispersync/storage/RemoteStorage;
.super Ljava/lang/Object;
.source "RemoteStorage.java"


# virtual methods
.method public abstract retrieve(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/storage/GameData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;,
            Lcom/amazon/ags/AGSServiceException;,
            Lcom/amazon/ags/html5/comm/ConnectionException;
        }
    .end annotation
.end method

.method public abstract save(Lcom/amazon/ags/client/whispersync/storage/GameData;)Lcom/amazon/ags/client/whispersync/storage/GameData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;,
            Lcom/amazon/ags/AGSServiceException;,
            Lcom/amazon/ags/html5/comm/ConnectionException;
        }
    .end annotation
.end method
