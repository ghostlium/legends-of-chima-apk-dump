.class public interface abstract Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;
.super Ljava/lang/Object;
.source "GameDataMarshaller.java"


# virtual methods
.method public abstract composeForDisk(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation
.end method

.method public abstract composeForService(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation
.end method

.method public abstract parse(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation
.end method
