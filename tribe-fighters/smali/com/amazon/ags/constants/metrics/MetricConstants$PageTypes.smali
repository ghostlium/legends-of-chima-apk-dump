.class public final enum Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;
.super Ljava/lang/Enum;
.source "MetricConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/constants/metrics/MetricConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PageTypes"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

.field public static final enum GC_APP:Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

.field public static final enum IN_GAME:Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

.field public static final enum POPUP:Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 40
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    const-string v1, "IN_GAME"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;->IN_GAME:Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    .line 45
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    const-string v1, "POPUP"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;->POPUP:Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    .line 50
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    const-string v1, "GC_APP"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;->GC_APP:Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    .line 35
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;->IN_GAME:Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;->POPUP:Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;->GC_APP:Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    aput-object v1, v0, v4

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;->$VALUES:[Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

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
    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 35
    const-class v0, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;->$VALUES:[Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    invoke-virtual {v0}, [Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/constants/metrics/MetricConstants$PageTypes;

    return-object v0
.end method
