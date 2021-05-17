.class public final enum Lcom/amazon/ags/client/whispersync/model/SyncState;
.super Ljava/lang/Enum;
.source "SyncState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/client/whispersync/model/SyncState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/client/whispersync/model/SyncState;

.field public static final enum DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

.field public static final enum IN_CONFLICT:Lcom/amazon/ags/client/whispersync/model/SyncState;

.field public static final enum NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

.field public static final enum SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

.field public static final enum SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 12
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncState;

    const-string v1, "NOT_SET"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/whispersync/model/SyncState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 16
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncState;

    const-string v1, "DIRTY"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/client/whispersync/model/SyncState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 20
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncState;

    const-string v1, "IN_CONFLICT"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/client/whispersync/model/SyncState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->IN_CONFLICT:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 24
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncState;

    const-string v1, "SYNCING"

    invoke-direct {v0, v1, v5}, Lcom/amazon/ags/client/whispersync/model/SyncState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 28
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncState;

    const-string v1, "SYNCED"

    invoke-direct {v0, v1, v6}, Lcom/amazon/ags/client/whispersync/model/SyncState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 8
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/amazon/ags/client/whispersync/model/SyncState;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->IN_CONFLICT:Lcom/amazon/ags/client/whispersync/model/SyncState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    aput-object v1, v0, v6

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->$VALUES:[Lcom/amazon/ags/client/whispersync/model/SyncState;

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

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/model/SyncState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/client/whispersync/model/SyncState;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/client/whispersync/model/SyncState;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncState;->$VALUES:[Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-virtual {v0}, [Lcom/amazon/ags/client/whispersync/model/SyncState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/client/whispersync/model/SyncState;

    return-object v0
.end method
