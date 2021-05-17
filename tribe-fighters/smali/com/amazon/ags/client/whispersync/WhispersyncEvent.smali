.class public final enum Lcom/amazon/ags/client/whispersync/WhispersyncEvent;
.super Ljava/lang/Enum;
.source "WhispersyncEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/client/whispersync/WhispersyncEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

.field public static final enum ALREADY_SYNCED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

.field public static final enum DATA_UPLOADED_TO_CLOUD:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

.field public static final enum DISABLED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

.field public static final enum DISK_WRITE_COMPLETE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

.field public static final enum ERROR_CLIENT:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

.field public static final enum ERROR_SERVICE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

.field public static final enum FIRST_SYNC:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

.field public static final enum NEW_DATA_FROM_CLOUD:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

.field public static final enum OFFLINE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

.field public static final enum THROTTLED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 9
    new-instance v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    const-string v1, "NEW_DATA_FROM_CLOUD"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->NEW_DATA_FROM_CLOUD:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    .line 10
    new-instance v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    const-string v1, "DATA_UPLOADED_TO_CLOUD"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->DATA_UPLOADED_TO_CLOUD:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    .line 11
    new-instance v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    const-string v1, "THROTTLED"

    invoke-direct {v0, v1, v5}, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->THROTTLED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    .line 12
    new-instance v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    const-string v1, "DISK_WRITE_COMPLETE"

    invoke-direct {v0, v1, v6}, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->DISK_WRITE_COMPLETE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    .line 13
    new-instance v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    const-string v1, "FIRST_SYNC"

    invoke-direct {v0, v1, v7}, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->FIRST_SYNC:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    .line 14
    new-instance v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    const-string v1, "ALREADY_SYNCED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ALREADY_SYNCED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    .line 15
    new-instance v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    const-string v1, "OFFLINE"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->OFFLINE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    .line 16
    new-instance v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    const-string v1, "DISABLED"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->DISABLED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    .line 17
    new-instance v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    const-string v1, "ERROR_SERVICE"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ERROR_SERVICE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    .line 18
    new-instance v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    const-string v1, "ERROR_CLIENT"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ERROR_CLIENT:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    .line 8
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    sget-object v1, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->NEW_DATA_FROM_CLOUD:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->DATA_UPLOADED_TO_CLOUD:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->THROTTLED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->DISK_WRITE_COMPLETE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->FIRST_SYNC:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ALREADY_SYNCED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->OFFLINE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->DISABLED:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ERROR_SERVICE:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ERROR_CLIENT:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->$VALUES:[Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/WhispersyncEvent;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/client/whispersync/WhispersyncEvent;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->$VALUES:[Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v0}, [Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    return-object v0
.end method
