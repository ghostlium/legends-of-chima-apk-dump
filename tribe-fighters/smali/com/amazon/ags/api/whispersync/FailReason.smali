.class public final enum Lcom/amazon/ags/api/whispersync/FailReason;
.super Ljava/lang/Enum;
.source "FailReason.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/api/whispersync/FailReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/api/whispersync/FailReason;

.field public static final enum CLIENT_ERROR:Lcom/amazon/ags/api/whispersync/FailReason;

.field public static final enum OFFLINE:Lcom/amazon/ags/api/whispersync/FailReason;

.field public static final enum SERVICE_ERROR:Lcom/amazon/ags/api/whispersync/FailReason;

.field public static final enum WHISPERSYNC_DISABLED:Lcom/amazon/ags/api/whispersync/FailReason;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 13
    new-instance v0, Lcom/amazon/ags/api/whispersync/FailReason;

    const-string v1, "OFFLINE"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/api/whispersync/FailReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/whispersync/FailReason;->OFFLINE:Lcom/amazon/ags/api/whispersync/FailReason;

    .line 18
    new-instance v0, Lcom/amazon/ags/api/whispersync/FailReason;

    const-string v1, "WHISPERSYNC_DISABLED"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/api/whispersync/FailReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/whispersync/FailReason;->WHISPERSYNC_DISABLED:Lcom/amazon/ags/api/whispersync/FailReason;

    .line 23
    new-instance v0, Lcom/amazon/ags/api/whispersync/FailReason;

    const-string v1, "SERVICE_ERROR"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/api/whispersync/FailReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/whispersync/FailReason;->SERVICE_ERROR:Lcom/amazon/ags/api/whispersync/FailReason;

    .line 28
    new-instance v0, Lcom/amazon/ags/api/whispersync/FailReason;

    const-string v1, "CLIENT_ERROR"

    invoke-direct {v0, v1, v5}, Lcom/amazon/ags/api/whispersync/FailReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/whispersync/FailReason;->CLIENT_ERROR:Lcom/amazon/ags/api/whispersync/FailReason;

    .line 8
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/amazon/ags/api/whispersync/FailReason;

    sget-object v1, Lcom/amazon/ags/api/whispersync/FailReason;->OFFLINE:Lcom/amazon/ags/api/whispersync/FailReason;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/api/whispersync/FailReason;->WHISPERSYNC_DISABLED:Lcom/amazon/ags/api/whispersync/FailReason;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/api/whispersync/FailReason;->SERVICE_ERROR:Lcom/amazon/ags/api/whispersync/FailReason;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/api/whispersync/FailReason;->CLIENT_ERROR:Lcom/amazon/ags/api/whispersync/FailReason;

    aput-object v1, v0, v5

    sput-object v0, Lcom/amazon/ags/api/whispersync/FailReason;->$VALUES:[Lcom/amazon/ags/api/whispersync/FailReason;

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

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/FailReason;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/amazon/ags/api/whispersync/FailReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/api/whispersync/FailReason;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/api/whispersync/FailReason;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/amazon/ags/api/whispersync/FailReason;->$VALUES:[Lcom/amazon/ags/api/whispersync/FailReason;

    invoke-virtual {v0}, [Lcom/amazon/ags/api/whispersync/FailReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/api/whispersync/FailReason;

    return-object v0
.end method
