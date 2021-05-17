.class public interface abstract Lcom/amazon/ags/api/whispersync/WhispersyncClient;
.super Ljava/lang/Object;
.source "WhispersyncClient.java"


# virtual methods
.method public abstract flush()V
.end method

.method public abstract getGameData()Lcom/amazon/ags/api/whispersync/GameDataMap;
.end method

.method public abstract migrateVersion1GameData(Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;)V
.end method

.method public abstract setWhispersyncEventListener(Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;)V
.end method

.method public abstract synchronize()V
.end method

.method public abstract unpackVersion1MultiFileGameData([BLjava/io/File;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
