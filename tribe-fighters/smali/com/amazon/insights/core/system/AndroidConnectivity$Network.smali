.class public final enum Lcom/amazon/insights/core/system/AndroidConnectivity$Network;
.super Ljava/lang/Enum;
.source "AndroidConnectivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/core/system/AndroidConnectivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Network"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/insights/core/system/AndroidConnectivity$Network;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

.field public static final enum MOBILE:Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

.field public static final enum WIFI:Lcom/amazon/insights/core/system/AndroidConnectivity$Network;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 18
    new-instance v0, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

    const-string v1, "MOBILE"

    invoke-direct {v0, v1, v2}, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;->MOBILE:Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

    .line 19
    new-instance v0, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

    const-string v1, "WIFI"

    invoke-direct {v0, v1, v3}, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;->WIFI:Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

    .line 17
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

    sget-object v1, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;->MOBILE:Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;->WIFI:Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

    aput-object v1, v0, v3

    sput-object v0, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;->$VALUES:[Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

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
    .line 17
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/insights/core/system/AndroidConnectivity$Network;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 17
    const-class v0, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

    return-object v0
.end method

.method public static values()[Lcom/amazon/insights/core/system/AndroidConnectivity$Network;
    .locals 1

    .prologue
    .line 17
    sget-object v0, Lcom/amazon/insights/core/system/AndroidConnectivity$Network;->$VALUES:[Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

    invoke-virtual {v0}, [Lcom/amazon/insights/core/system/AndroidConnectivity$Network;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/insights/core/system/AndroidConnectivity$Network;

    return-object v0
.end method
