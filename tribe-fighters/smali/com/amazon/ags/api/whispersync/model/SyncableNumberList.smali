.class public interface abstract Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
.super Ljava/lang/Object;
.source "SyncableNumberList.java"


# static fields
.field public static final DEFAULT_MAX_SIZE:I = 0x5

.field public static final MAX_SIZE_LIMIT:I = 0x3e8


# virtual methods
.method public abstract add(D)V
.end method

.method public abstract add(DLjava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(D",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract add(I)V
.end method

.method public abstract add(ILjava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract add(J)V
.end method

.method public abstract add(JLjava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

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

.method public abstract getMaxSize()I
.end method

.method public abstract getValues()[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
.end method

.method public abstract isSet()Z
.end method

.method public abstract setMaxSize(I)V
.end method
