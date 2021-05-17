.class public interface abstract Lcom/amazon/ags/client/whispersync/storage/LocalStorage;
.super Ljava/lang/Object;
.source "LocalStorage.java"


# virtual methods
.method public abstract getVersionId()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract hasSuccessfullySynchronized()Z
.end method

.method public abstract putVersionId(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract retrieve()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation
.end method

.method public abstract save(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation
.end method
