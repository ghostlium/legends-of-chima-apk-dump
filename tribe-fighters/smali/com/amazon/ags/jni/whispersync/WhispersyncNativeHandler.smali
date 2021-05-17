.class public Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;
.super Ljava/lang/Object;
.source "WhispersyncNativeHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync_JNI"

.field private static whispersyncClient:Lcom/amazon/ags/api/whispersync/WhispersyncClient;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    return-void
.end method

.method public static containsNumber(Ljava/lang/String;I)Z
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "mergePolicyNo"    # I

    .prologue
    .line 251
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "containsNumber("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 254
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 256
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 267
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 258
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 270
    .local v2, "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :goto_0
    invoke-interface {v2}, Lcom/amazon/ags/api/whispersync/model/SyncableNumber;->isSet()Z

    move-result v3

    return v3

    .line 261
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 262
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 264
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 265
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 256
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static containsString(Ljava/lang/String;)Z
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 497
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "containsString("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 499
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestString(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableString;

    move-result-object v1

    .line 500
    .local v1, "syncableString":Lcom/amazon/ags/api/whispersync/model/SyncableString;
    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableString;->isSet()Z

    move-result v2

    return v2
.end method

.method public static decrementAccumulatingNumber(Ljava/lang/String;D)V
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # D

    .prologue
    .line 83
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "decrementAccumulatingNumber("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 85
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getAccumulatingNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;

    move-result-object v1

    .line 86
    .local v1, "syncableAccumulatingNumber":Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;
    invoke-interface {v1, p1, p2}, Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;->decrement(D)V

    .line 87
    return-void
.end method

.method public static decrementAccumulatingNumber(Ljava/lang/String;J)V
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # J

    .prologue
    .line 62
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "decrementAccumulatingNumber("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 64
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getAccumulatingNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;

    move-result-object v1

    .line 65
    .local v1, "syncableAccumulatingNumber":Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;
    invoke-interface {v1, p1, p2}, Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;->decrement(J)V

    .line 66
    return-void
.end method

.method public static decrementAccumulatingNumber(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "bigDecimalValue"    # Ljava/lang/String;

    .prologue
    .line 104
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "decrementAccumulatingNumber("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 106
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getAccumulatingNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;

    move-result-object v1

    .line 107
    .local v1, "syncableAccumulatingNumber":Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;
    invoke-interface {v1, p1}, Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;->decrement(Ljava/lang/String;)V

    .line 108
    return-void
.end method

.method public static flush()V
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->whispersyncClient:Lcom/amazon/ags/api/whispersync/WhispersyncClient;

    invoke-interface {v0}, Lcom/amazon/ags/api/whispersync/WhispersyncClient;->flush()V

    .line 42
    return-void
.end method

.method public static getAccumulatingNumberAsBigDecimal(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 90
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getAccumulatingNumberAsBigDecimal("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 92
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getAccumulatingNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;

    move-result-object v1

    .line 93
    .local v1, "syncableAccumulatingNumber":Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;
    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;->asDecimal()Ljava/math/BigDecimal;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getAccumulatingNumberAsDouble(Ljava/lang/String;)D
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 69
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getAccumulatingNumberAsDouble("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 71
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getAccumulatingNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;

    move-result-object v1

    .line 72
    .local v1, "syncableAccumulatingNumber":Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;
    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;->asDouble()D

    move-result-wide v2

    return-wide v2
.end method

.method public static getAccumulatingNumberAsLong(Ljava/lang/String;)J
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 48
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getAccumulatingNumberAsLong("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 50
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getAccumulatingNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;

    move-result-object v1

    .line 51
    .local v1, "syncableAccumulatingNumber":Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;
    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;->asLong()J

    move-result-wide v2

    return-wide v2
.end method

.method protected static final getLowestLevelElementAsMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;
    .locals 4
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 600
    const-string v3, "/"

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 601
    .local v2, "keys":[Ljava/lang/String;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->whispersyncClient:Lcom/amazon/ags/api/whispersync/WhispersyncClient;

    invoke-interface {v3}, Lcom/amazon/ags/api/whispersync/WhispersyncClient;->getGameData()Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 602
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 603
    aget-object v3, v2, v1

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 602
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 605
    :cond_0
    return-object v0
.end method

.method protected static getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 618
    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 619
    .local v0, "keys":[Ljava/lang/String;
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v0, v1

    return-object v1
.end method

.method protected static getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;
    .locals 4
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 609
    const-string v3, "/"

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 610
    .local v2, "keys":[Ljava/lang/String;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->whispersyncClient:Lcom/amazon/ags/api/whispersync/WhispersyncClient;

    invoke-interface {v3}, Lcom/amazon/ags/api/whispersync/WhispersyncClient;->getGameData()Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 611
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v1, v3, :cond_0

    .line 612
    aget-object v3, v2, v1

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 611
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 614
    :cond_0
    return-object v0
.end method

.method public static final getMapKeys(Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 593
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelElementAsMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 594
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-interface {v0}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getMapKeys()Ljava/util/Set;

    move-result-object v1

    .line 595
    .local v1, "mapKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getMapKeys("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") --> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 596
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method

.method public static getMaxSizeNumberList(Ljava/lang/String;I)I
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "mergePolicyNo"    # I

    .prologue
    .line 431
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getMaxSizeNumberList("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 434
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 436
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 447
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 438
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 449
    .local v2, "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :goto_0
    invoke-interface {v2}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;->getMaxSize()I

    move-result v3

    return v3

    .line 441
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 442
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 444
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 445
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 436
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static getMaxSizeStringList(Ljava/lang/String;)I
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 528
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getMaxSizeStringList("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 529
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 530
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestStringList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringList;

    move-result-object v1

    .line 531
    .local v1, "syncableStringList":Lcom/amazon/ags/api/whispersync/model/SyncableStringList;
    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringList;->getMaxSize()I

    move-result v2

    return v2
.end method

.method public static getNumberAsBigDecimal(Ljava/lang/String;I)Ljava/lang/String;
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "mergePolicyNo"    # I

    .prologue
    .line 205
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getNumberAsBigDecimal("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 208
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 210
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 221
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 212
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 224
    .local v2, "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :goto_0
    invoke-interface {v2}, Lcom/amazon/ags/api/whispersync/model/SyncableNumber;->asDecimal()Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 215
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 216
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 218
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 219
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 210
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static getNumberAsDouble(Ljava/lang/String;I)D
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "mergePolicyNo"    # I

    .prologue
    .line 160
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getNumberAsDouble("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 163
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 165
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 176
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 167
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 179
    .local v2, "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :goto_0
    invoke-interface {v2}, Lcom/amazon/ags/api/whispersync/model/SyncableNumber;->asDouble()D

    move-result-wide v3

    return-wide v3

    .line 170
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 171
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 173
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 174
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 165
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static getNumberAsLong(Ljava/lang/String;I)J
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "mergePolicyNo"    # I

    .prologue
    .line 114
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getNumberAsLong("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 117
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 119
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 130
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 121
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 133
    .local v2, "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :goto_0
    invoke-interface {v2}, Lcom/amazon/ags/api/whispersync/model/SyncableNumber;->asLong()J

    move-result-wide v3

    return-wide v3

    .line 124
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 125
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 127
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 128
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 119
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static getNumberListAsBigDecimal(Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;)[Ljava/lang/String;
    .locals 4
    .param p0, "syncableNumberList"    # Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    .prologue
    .line 471
    invoke-interface {p0}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;->getValues()[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;

    move-result-object v2

    .line 472
    .local v2, "syncableNumberElements":[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
    array-length v3, v2

    new-array v1, v3, [Ljava/lang/String;

    .line 473
    .local v1, "numberListAsBigDecimal":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_0

    .line 474
    aget-object v3, v2, v0

    invoke-interface {v3}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;->asDecimal()Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    .line 473
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 476
    :cond_0
    return-object v1
.end method

.method public static getNumberListAsBigDecimals(Ljava/lang/String;I)[Ljava/lang/String;
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "mergePolicyNo"    # I

    .prologue
    .line 365
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getNumberListAsBigDecimals("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 368
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 370
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 381
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 372
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 383
    .local v2, "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :goto_0
    invoke-static {v2}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getNumberListAsBigDecimal(Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;)[Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 375
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 376
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 378
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 379
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 370
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static getNumberListAsDouble(Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;)[D
    .locals 5
    .param p0, "syncableNumberList"    # Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    .prologue
    .line 462
    invoke-interface {p0}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;->getValues()[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;

    move-result-object v2

    .line 463
    .local v2, "syncableNumberElements":[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
    array-length v3, v2

    new-array v1, v3, [D

    .line 464
    .local v1, "numberListAsDouble":[D
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_0

    .line 465
    aget-object v3, v2, v0

    invoke-interface {v3}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;->asDouble()D

    move-result-wide v3

    aput-wide v3, v1, v0

    .line 464
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 467
    :cond_0
    return-object v1
.end method

.method public static getNumberListAsDoubles(Ljava/lang/String;I)[D
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "mergePolicyNo"    # I

    .prologue
    .line 321
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getNumberListAsDoubles("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 324
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 326
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 337
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 328
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 339
    .local v2, "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :goto_0
    invoke-static {v2}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getNumberListAsDouble(Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;)[D

    move-result-object v3

    return-object v3

    .line 331
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 332
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 334
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 335
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 326
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static getNumberListAsLong(Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;)[J
    .locals 5
    .param p0, "syncableNumberList"    # Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    .prologue
    .line 453
    invoke-interface {p0}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;->getValues()[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;

    move-result-object v2

    .line 454
    .local v2, "syncableNumberElements":[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
    array-length v3, v2

    new-array v1, v3, [J

    .line 455
    .local v1, "numberListAsLong":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_0

    .line 456
    aget-object v3, v2, v0

    invoke-interface {v3}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;->asLong()J

    move-result-wide v3

    aput-wide v3, v1, v0

    .line 455
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 458
    :cond_0
    return-object v1
.end method

.method public static getNumberListAsLongs(Ljava/lang/String;I)[J
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "mergePolicyNo"    # I

    .prologue
    .line 277
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getNumberListAsLongs("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 280
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 282
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 293
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 284
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 295
    .local v2, "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :goto_0
    invoke-static {v2}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getNumberListAsLong(Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;)[J

    move-result-object v3

    return-object v3

    .line 287
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 288
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 290
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 291
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 282
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 483
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getString("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 485
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestString(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableString;

    move-result-object v1

    .line 486
    .local v1, "syncableString":Lcom/amazon/ags/api/whispersync/model/SyncableString;
    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableString;->getValue()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getStringList(Lcom/amazon/ags/api/whispersync/model/SyncableStringList;)[Ljava/lang/String;
    .locals 4
    .param p0, "syncableStringList"    # Lcom/amazon/ags/api/whispersync/model/SyncableStringList;

    .prologue
    .line 542
    invoke-interface {p0}, Lcom/amazon/ags/api/whispersync/model/SyncableStringList;->getValues()[Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;

    move-result-object v2

    .line 543
    .local v2, "syncableStringElements":[Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    array-length v3, v2

    new-array v1, v3, [Ljava/lang/String;

    .line 544
    .local v1, "stringList":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_0

    .line 545
    aget-object v3, v2, v0

    invoke-interface {v3}, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;->getValue()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    .line 544
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 547
    :cond_0
    return-object v1
.end method

.method public static getStringList(Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 507
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getStringList("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 509
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestStringList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringList;

    move-result-object v1

    .line 510
    .local v1, "syncableStringList":Lcom/amazon/ags/api/whispersync/model/SyncableStringList;
    invoke-static {v1}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getStringList(Lcom/amazon/ags/api/whispersync/model/SyncableStringList;)[Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getStringListKeys(Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 535
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getStringListKeys("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelElementAsMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 537
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-interface {v0}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestStringListKeys()Ljava/util/Set;

    move-result-object v1

    .line 538
    .local v1, "stringListKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method

.method public static getStringSet(Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 555
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getStringSet("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 556
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 557
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getStringSet(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;

    move-result-object v1

    .line 558
    .local v1, "syncableStringSet":Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;
    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;->getValues()Ljava/util/Set;

    move-result-object v2

    invoke-static {v2}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getStringSet(Ljava/util/Set;)[Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getStringSet(Ljava/util/Set;)[Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 583
    .local p0, "syncableStringSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;>;"
    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v5

    new-array v3, v5, [Ljava/lang/String;

    .line 585
    .local v3, "stringSet":[Ljava/lang/String;
    const/4 v0, 0x0

    .line 586
    .local v0, "i":I
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;

    .line 587
    .local v4, "syncableStringElement":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    invoke-interface {v4}, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;->getValue()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v0

    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_0

    .line 589
    .end local v4    # "syncableStringElement":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    :cond_0
    return-object v3
.end method

.method public static getStringSetKeys(Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;

    .prologue
    .line 576
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getStringSetKeys("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 577
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelElementAsMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 578
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-interface {v0}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getStringSetKeys()Ljava/util/Set;

    move-result-object v1

    .line 579
    .local v1, "stringSetKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method

.method public static incrementAccumulatingNumber(Ljava/lang/String;D)V
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # D

    .prologue
    .line 76
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "incrementAccumulatingNumber("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 78
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getAccumulatingNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;

    move-result-object v1

    .line 79
    .local v1, "syncableAccumulatingNumber":Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;
    invoke-interface {v1, p1, p2}, Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;->increment(D)V

    .line 80
    return-void
.end method

.method public static incrementAccumulatingNumber(Ljava/lang/String;J)V
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # J

    .prologue
    .line 55
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "incrementAccumulatingNumber("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 57
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getAccumulatingNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;

    move-result-object v1

    .line 58
    .local v1, "syncableAccumulatingNumber":Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;
    invoke-interface {v1, p1, p2}, Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;->increment(J)V

    .line 59
    return-void
.end method

.method public static incrementAccumulatingNumber(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "bigDecimalValue"    # Ljava/lang/String;

    .prologue
    .line 97
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "incrementAccumulatingNumber("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 99
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getAccumulatingNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;

    move-result-object v1

    .line 100
    .local v1, "syncableAccumulatingNumber":Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;
    invoke-interface {v1, p1}, Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;->increment(Ljava/lang/String;)V

    .line 101
    return-void
.end method

.method public static initializeNativeHandler()V
    .locals 1

    .prologue
    .line 33
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getWhispersyncClient()Lcom/amazon/ags/api/whispersync/WhispersyncClient;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->whispersyncClient:Lcom/amazon/ags/api/whispersync/WhispersyncClient;

    .line 34
    return-void
.end method

.method public static insertToNumberList(Ljava/lang/String;DI)V
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # D
    .param p3, "mergePolicyNo"    # I

    .prologue
    .line 343
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "insertToNumberList("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p3}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 346
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p3}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 348
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 359
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 350
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 361
    .local v2, "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :goto_0
    invoke-interface {v2, p1, p2}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;->add(D)V

    .line 362
    return-void

    .line 353
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 354
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 356
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 357
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 348
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static insertToNumberList(Ljava/lang/String;JI)V
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # J
    .param p3, "mergePolicyNo"    # I

    .prologue
    .line 299
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "insertToNumberList("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p3}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 302
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p3}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 304
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 315
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 306
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 317
    .local v2, "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :goto_0
    invoke-interface {v2, p1, p2}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;->add(J)V

    .line 318
    return-void

    .line 309
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 310
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 312
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 313
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 304
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static insertToNumberList(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "mergePolicyNo"    # I

    .prologue
    .line 387
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "insertToNumberList("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p2}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 388
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 390
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p2}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 392
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 403
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 394
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 405
    .local v2, "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :goto_0
    invoke-interface {v2, p1}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;->add(Ljava/lang/String;)V

    .line 406
    return-void

    .line 397
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 398
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 400
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 401
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 392
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static insertToStringList(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 514
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "insertToStringList("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 515
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 516
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestStringList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringList;

    move-result-object v1

    .line 517
    .local v1, "syncableStringList":Lcom/amazon/ags/api/whispersync/model/SyncableStringList;
    invoke-interface {v1, p1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringList;->add(Ljava/lang/String;)V

    .line 518
    return-void
.end method

.method public static insertToStringSet(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 569
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "insertToStringSet("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 571
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getStringSet(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;

    move-result-object v1

    .line 572
    .local v1, "syncableStringSet":Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;
    invoke-interface {v1, p1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;->add(Ljava/lang/String;)V

    .line 573
    return-void
.end method

.method public static setMaxSizeNumberList(Ljava/lang/String;II)V
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "size"    # I
    .param p2, "mergePolicyNo"    # I

    .prologue
    .line 409
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setMaxSizeNumberList("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p2}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 410
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 412
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p2}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 414
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 425
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 416
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 427
    .local v2, "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :goto_0
    invoke-interface {v2, p1}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;->setMaxSize(I)V

    .line 428
    return-void

    .line 419
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 420
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 422
    .end local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    move-result-object v2

    .line 423
    .restart local v2    # "syncableNumberList":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    goto :goto_0

    .line 414
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static setMaxSizeStringList(Ljava/lang/String;I)V
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "size"    # I

    .prologue
    .line 521
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setMaxSizeStringList("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 522
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 523
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestStringList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringList;

    move-result-object v1

    .line 524
    .local v1, "syncableStringList":Lcom/amazon/ags/api/whispersync/model/SyncableStringList;
    invoke-interface {v1, p1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringList;->setMaxSize(I)V

    .line 525
    return-void
.end method

.method public static setNumber(Ljava/lang/String;DI)V
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # D
    .param p3, "mergePolicyNo"    # I

    .prologue
    .line 183
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setNumber("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p3}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 186
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p3}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 188
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 199
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 190
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 201
    .local v2, "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :goto_0
    invoke-interface {v2, p1, p2}, Lcom/amazon/ags/api/whispersync/model/SyncableNumber;->set(D)V

    .line 202
    return-void

    .line 193
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 194
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 196
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 197
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 188
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static setNumber(Ljava/lang/String;JI)V
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # J
    .param p3, "mergePolicyNo"    # I

    .prologue
    .line 137
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setNumber("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p3}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 140
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p3}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 142
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 153
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 144
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 156
    .local v2, "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :goto_0
    invoke-interface {v2, p1, p2}, Lcom/amazon/ags/api/whispersync/model/SyncableNumber;->set(J)V

    .line 157
    return-void

    .line 147
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 148
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 150
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 151
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 142
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static setNumber(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 6
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "bigDecimalValue"    # Ljava/lang/String;
    .param p2, "mergePolicyNo"    # I

    .prologue
    .line 228
    const-string v3, "GC_Whispersync_JNI"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setNumber("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p2}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 231
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p2}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->mergePolicyFromInt(I)Lcom/amazon/ags/jni/whispersync/MergePolicy;

    move-result-object v1

    .line 233
    .local v1, "mergePolicy":Lcom/amazon/ags/jni/whispersync/MergePolicy;
    sget-object v3, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler$1;->$SwitchMap$com$amazon$ags$jni$whispersync$MergePolicy:[I

    invoke-virtual {v1}, Lcom/amazon/ags/jni/whispersync/MergePolicy;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 244
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Merge policy ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 235
    :pswitch_0
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getHighestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 247
    .local v2, "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :goto_0
    invoke-interface {v2, p1}, Lcom/amazon/ags/api/whispersync/model/SyncableNumber;->set(Ljava/lang/String;)V

    .line 248
    return-void

    .line 238
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_1
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLowestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 239
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 241
    .end local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    :pswitch_2
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    move-result-object v2

    .line 242
    .restart local v2    # "syncableNumber":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    goto :goto_0

    .line 233
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static setString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 490
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setString("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 492
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getLatestString(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableString;

    move-result-object v1

    .line 493
    .local v1, "syncableString":Lcom/amazon/ags/api/whispersync/model/SyncableString;
    invoke-interface {v1, p1}, Lcom/amazon/ags/api/whispersync/model/SyncableString;->set(Ljava/lang/String;)V

    .line 494
    return-void
.end method

.method public static stringSetContains(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p0, "slashDelimitedKey"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 562
    const-string v2, "GC_Whispersync_JNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "stringSetContains("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;

    move-result-object v0

    .line 564
    .local v0, "gameDataMap":Lcom/amazon/ags/api/whispersync/GameDataMap;
    invoke-static {p0}, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->getLowestLevelKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/amazon/ags/api/whispersync/GameDataMap;->getStringSet(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;

    move-result-object v1

    .line 565
    .local v1, "syncableStringSet":Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;
    invoke-interface {v1, p1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;->contains(Ljava/lang/String;)Z

    move-result v2

    return v2
.end method

.method public static synchronize()V
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/amazon/ags/jni/whispersync/WhispersyncNativeHandler;->whispersyncClient:Lcom/amazon/ags/api/whispersync/WhispersyncClient;

    invoke-interface {v0}, Lcom/amazon/ags/api/whispersync/WhispersyncClient;->synchronize()V

    .line 38
    return-void
.end method
