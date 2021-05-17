.class public final enum Lcom/amazon/ags/client/KindleFireStatus;
.super Ljava/lang/Enum;
.source "KindleFireStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/client/KindleFireStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/client/KindleFireStatus;

.field public static final enum CANNOT_AUTHORIZE:Lcom/amazon/ags/client/KindleFireStatus;

.field public static final enum INITIALIZING:Lcom/amazon/ags/client/KindleFireStatus;

.field public static final enum NOT_AUTHORIZED:Lcom/amazon/ags/client/KindleFireStatus;

.field public static final enum NOT_REGISTERED:Lcom/amazon/ags/client/KindleFireStatus;

.field public static final enum SERVICE_CONNECTED:Lcom/amazon/ags/client/KindleFireStatus;

.field public static final enum SERVICE_DISCONNECTED:Lcom/amazon/ags/client/KindleFireStatus;

.field public static final enum UNIVERSAL_NOT_SUPPORTED:Lcom/amazon/ags/client/KindleFireStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 13
    new-instance v0, Lcom/amazon/ags/client/KindleFireStatus;

    const-string v1, "INITIALIZING"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/client/KindleFireStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/KindleFireStatus;->INITIALIZING:Lcom/amazon/ags/client/KindleFireStatus;

    .line 18
    new-instance v0, Lcom/amazon/ags/client/KindleFireStatus;

    const-string v1, "SERVICE_CONNECTED"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/client/KindleFireStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/KindleFireStatus;->SERVICE_CONNECTED:Lcom/amazon/ags/client/KindleFireStatus;

    .line 24
    new-instance v0, Lcom/amazon/ags/client/KindleFireStatus;

    const-string v1, "SERVICE_DISCONNECTED"

    invoke-direct {v0, v1, v5}, Lcom/amazon/ags/client/KindleFireStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/KindleFireStatus;->SERVICE_DISCONNECTED:Lcom/amazon/ags/client/KindleFireStatus;

    .line 30
    new-instance v0, Lcom/amazon/ags/client/KindleFireStatus;

    const-string v1, "UNIVERSAL_NOT_SUPPORTED"

    invoke-direct {v0, v1, v6}, Lcom/amazon/ags/client/KindleFireStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/KindleFireStatus;->UNIVERSAL_NOT_SUPPORTED:Lcom/amazon/ags/client/KindleFireStatus;

    .line 36
    new-instance v0, Lcom/amazon/ags/client/KindleFireStatus;

    const-string v1, "CANNOT_AUTHORIZE"

    invoke-direct {v0, v1, v7}, Lcom/amazon/ags/client/KindleFireStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/KindleFireStatus;->CANNOT_AUTHORIZE:Lcom/amazon/ags/client/KindleFireStatus;

    .line 42
    new-instance v0, Lcom/amazon/ags/client/KindleFireStatus;

    const-string v1, "NOT_AUTHORIZED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/KindleFireStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/KindleFireStatus;->NOT_AUTHORIZED:Lcom/amazon/ags/client/KindleFireStatus;

    .line 48
    new-instance v0, Lcom/amazon/ags/client/KindleFireStatus;

    const-string v1, "NOT_REGISTERED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/KindleFireStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/client/KindleFireStatus;->NOT_REGISTERED:Lcom/amazon/ags/client/KindleFireStatus;

    .line 8
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/amazon/ags/client/KindleFireStatus;

    sget-object v1, Lcom/amazon/ags/client/KindleFireStatus;->INITIALIZING:Lcom/amazon/ags/client/KindleFireStatus;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/client/KindleFireStatus;->SERVICE_CONNECTED:Lcom/amazon/ags/client/KindleFireStatus;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/client/KindleFireStatus;->SERVICE_DISCONNECTED:Lcom/amazon/ags/client/KindleFireStatus;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/ags/client/KindleFireStatus;->UNIVERSAL_NOT_SUPPORTED:Lcom/amazon/ags/client/KindleFireStatus;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/ags/client/KindleFireStatus;->CANNOT_AUTHORIZE:Lcom/amazon/ags/client/KindleFireStatus;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/ags/client/KindleFireStatus;->NOT_AUTHORIZED:Lcom/amazon/ags/client/KindleFireStatus;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/amazon/ags/client/KindleFireStatus;->NOT_REGISTERED:Lcom/amazon/ags/client/KindleFireStatus;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/ags/client/KindleFireStatus;->$VALUES:[Lcom/amazon/ags/client/KindleFireStatus;

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

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/client/KindleFireStatus;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/amazon/ags/client/KindleFireStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/client/KindleFireStatus;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/client/KindleFireStatus;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/amazon/ags/client/KindleFireStatus;->$VALUES:[Lcom/amazon/ags/client/KindleFireStatus;

    invoke-virtual {v0}, [Lcom/amazon/ags/client/KindleFireStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/client/KindleFireStatus;

    return-object v0
.end method
