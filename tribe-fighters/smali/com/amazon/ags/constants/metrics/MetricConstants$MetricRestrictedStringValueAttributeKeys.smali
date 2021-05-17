.class public final enum Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;
.super Ljava/lang/Enum;
.source "MetricConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/constants/metrics/MetricConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MetricRestrictedStringValueAttributeKeys"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

.field public static final enum EVENT_NAME:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

.field public static final enum PAGE_TYPE:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 32
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    const-string v1, "EVENT_NAME"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;->EVENT_NAME:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    const-string v1, "PAGE_TYPE"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;->PAGE_TYPE:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    .line 31
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;->EVENT_NAME:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;->PAGE_TYPE:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    aput-object v1, v0, v3

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;->$VALUES:[Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

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
    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 31
    const-class v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;->$VALUES:[Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    invoke-virtual {v0}, [Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    return-object v0
.end method
