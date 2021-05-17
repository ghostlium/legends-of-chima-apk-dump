.class public final enum Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;
.super Ljava/lang/Enum;
.source "DefaultVariation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/abtest/DefaultVariation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AllocationSource"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

.field public static final enum CACHE:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

.field public static final enum DEFAULT:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

.field public static final enum SERVER:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 38
    new-instance v0, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    const-string v1, "SERVER"

    invoke-direct {v0, v1, v2}, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->SERVER:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    .line 39
    new-instance v0, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    const-string v1, "CACHE"

    invoke-direct {v0, v1, v3}, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->CACHE:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    .line 40
    new-instance v0, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    const-string v1, "DEFAULT"

    invoke-direct {v0, v1, v4}, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->DEFAULT:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    .line 37
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    sget-object v1, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->SERVER:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->CACHE:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->DEFAULT:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    aput-object v1, v0, v4

    sput-object v0, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->$VALUES:[Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

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
    .line 37
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 37
    const-class v0, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    return-object v0
.end method

.method public static values()[Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->$VALUES:[Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    invoke-virtual {v0}, [Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    return-object v0
.end method
