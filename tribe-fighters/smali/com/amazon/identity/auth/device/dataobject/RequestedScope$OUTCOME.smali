.class public final enum Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;
.super Ljava/lang/Enum;
.source "RequestedScope.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/dataobject/RequestedScope;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "OUTCOME"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

.field public static final enum GRANTED_LOCALLY:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

.field public static final enum REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

.field public static final enum UNKNOWN:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;


# instance fields
.field public final longVal:J


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 23
    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    const-string v1, "UNKNOWN"

    const-wide/16 v2, -0x2

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->UNKNOWN:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    .line 24
    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    const-string v1, "REJECTED"

    const-wide/16 v2, -0x1

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    .line 25
    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    const-string v1, "GRANTED_LOCALLY"

    const-wide/16 v2, 0x0

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->GRANTED_LOCALLY:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    .line 22
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->UNKNOWN:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->GRANTED_LOCALLY:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    aput-object v1, v0, v6

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->$VALUES:[Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IJ)V
    .locals 0
    .param p3, "longVal"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)V"
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-wide p3, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    return-object v0
.end method

.method public static values()[Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->$VALUES:[Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    invoke-virtual {v0}, [Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    return-object v0
.end method
