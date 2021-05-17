.class public interface abstract Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;
.super Ljava/lang/Object;
.source "SyncableStringSet.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract add(Ljava/lang/String;)V
.end method

.method public abstract add(Ljava/lang/String;Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract contains(Ljava/lang/String;)Z
.end method

.method public abstract get(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
.end method

.method public abstract getValues()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;",
            ">;"
        }
    .end annotation
.end method

.method public abstract isSet()Z
.end method
