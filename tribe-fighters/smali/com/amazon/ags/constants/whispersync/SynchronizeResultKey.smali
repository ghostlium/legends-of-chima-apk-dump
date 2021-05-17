.class public final enum Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;
.super Ljava/lang/Enum;
.source "SynchronizeResultKey.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

.field public static final enum ALREADY_SYNCHRONIZED:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

.field public static final enum CONFLICT_DEFERRED:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

.field public static final enum DOWNLOAD_SUCCESS:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

.field public static final enum FAILURE:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

.field public static final enum UPLOAD_SUCCESS:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 9
    new-instance v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    const-string v1, "ALREADY_SYNCHRONIZED"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->ALREADY_SYNCHRONIZED:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    .line 10
    new-instance v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    const-string v1, "CONFLICT_DEFERRED"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->CONFLICT_DEFERRED:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    .line 11
    new-instance v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    const-string v1, "UPLOAD_SUCCESS"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->UPLOAD_SUCCESS:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    .line 12
    new-instance v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    const-string v1, "DOWNLOAD_SUCCESS"

    invoke-direct {v0, v1, v5}, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->DOWNLOAD_SUCCESS:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    .line 13
    new-instance v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    const-string v1, "FAILURE"

    invoke-direct {v0, v1, v6}, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->FAILURE:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    .line 8
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    sget-object v1, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->ALREADY_SYNCHRONIZED:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->CONFLICT_DEFERRED:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->UPLOAD_SUCCESS:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->DOWNLOAD_SUCCESS:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->FAILURE:Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    aput-object v1, v0, v6

    sput-object v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->$VALUES:[Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

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

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->$VALUES:[Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    invoke-virtual {v0}, [Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/constants/whispersync/SynchronizeResultKey;

    return-object v0
.end method
