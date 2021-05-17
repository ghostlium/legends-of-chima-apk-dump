.class public interface abstract Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
.super Ljava/lang/Object;
.source "InternalGameDataMap.java"

# interfaces
.implements Lcom/amazon/ags/api/whispersync/GameDataMap;
.implements Lcom/amazon/ags/client/whispersync/model/Mergeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazon/ags/api/whispersync/GameDataMap;",
        "Lcom/amazon/ags/client/whispersync/model/Mergeable",
        "<",
        "Lcom/amazon/ags/client/whispersync/InternalGameDataMap;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract getAllElements()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;>;"
        }
    .end annotation
.end method

.method public abstract lockAndCopy()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
.end method

.method public abstract putElement(Lcom/amazon/ags/client/whispersync/model/Key;Lcom/amazon/ags/client/whispersync/model/Mergeable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;)V"
        }
    .end annotation
.end method

.method public abstract size()I
.end method
