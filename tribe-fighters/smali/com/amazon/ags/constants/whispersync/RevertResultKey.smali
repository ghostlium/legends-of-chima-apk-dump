.class public final enum Lcom/amazon/ags/constants/whispersync/RevertResultKey;
.super Ljava/lang/Enum;
.source "RevertResultKey.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/constants/whispersync/RevertResultKey;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/constants/whispersync/RevertResultKey;

.field public static final enum DOWNLOAD_SUCCESS:Lcom/amazon/ags/constants/whispersync/RevertResultKey;

.field public static final enum FAILURE:Lcom/amazon/ags/constants/whispersync/RevertResultKey;

.field public static final enum PLAYER_CANCELLED:Lcom/amazon/ags/constants/whispersync/RevertResultKey;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 9
    new-instance v0, Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    const-string v1, "PLAYER_CANCELLED"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/whispersync/RevertResultKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/whispersync/RevertResultKey;->PLAYER_CANCELLED:Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    .line 10
    new-instance v0, Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    const-string v1, "DOWNLOAD_SUCCESS"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/constants/whispersync/RevertResultKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/whispersync/RevertResultKey;->DOWNLOAD_SUCCESS:Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    .line 11
    new-instance v0, Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    const-string v1, "FAILURE"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/constants/whispersync/RevertResultKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/whispersync/RevertResultKey;->FAILURE:Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    .line 8
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    sget-object v1, Lcom/amazon/ags/constants/whispersync/RevertResultKey;->PLAYER_CANCELLED:Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/constants/whispersync/RevertResultKey;->DOWNLOAD_SUCCESS:Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/constants/whispersync/RevertResultKey;->FAILURE:Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    aput-object v1, v0, v4

    sput-object v0, Lcom/amazon/ags/constants/whispersync/RevertResultKey;->$VALUES:[Lcom/amazon/ags/constants/whispersync/RevertResultKey;

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

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/whispersync/RevertResultKey;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/constants/whispersync/RevertResultKey;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/amazon/ags/constants/whispersync/RevertResultKey;->$VALUES:[Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    invoke-virtual {v0}, [Lcom/amazon/ags/constants/whispersync/RevertResultKey;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/constants/whispersync/RevertResultKey;

    return-object v0
.end method
