.class public final enum Lcom/amazon/insights/core/log/Logger$LogLevel;
.super Ljava/lang/Enum;
.source "Logger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/core/log/Logger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LogLevel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/insights/core/log/Logger$LogLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/insights/core/log/Logger$LogLevel;

.field public static final enum DEBUG:Lcom/amazon/insights/core/log/Logger$LogLevel;

.field public static final enum ERROR:Lcom/amazon/insights/core/log/Logger$LogLevel;

.field public static final enum INFO:Lcom/amazon/insights/core/log/Logger$LogLevel;

.field public static final enum OFF:Lcom/amazon/insights/core/log/Logger$LogLevel;

.field public static final enum VERBOSE:Lcom/amazon/insights/core/log/Logger$LogLevel;

.field public static final enum WARN:Lcom/amazon/insights/core/log/Logger$LogLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 26
    new-instance v0, Lcom/amazon/insights/core/log/Logger$LogLevel;

    const-string v1, "VERBOSE"

    invoke-direct {v0, v1, v3}, Lcom/amazon/insights/core/log/Logger$LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/core/log/Logger$LogLevel;->VERBOSE:Lcom/amazon/insights/core/log/Logger$LogLevel;

    .line 27
    new-instance v0, Lcom/amazon/insights/core/log/Logger$LogLevel;

    const-string v1, "DEBUG"

    invoke-direct {v0, v1, v4}, Lcom/amazon/insights/core/log/Logger$LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/core/log/Logger$LogLevel;->DEBUG:Lcom/amazon/insights/core/log/Logger$LogLevel;

    .line 28
    new-instance v0, Lcom/amazon/insights/core/log/Logger$LogLevel;

    const-string v1, "INFO"

    invoke-direct {v0, v1, v5}, Lcom/amazon/insights/core/log/Logger$LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/core/log/Logger$LogLevel;->INFO:Lcom/amazon/insights/core/log/Logger$LogLevel;

    .line 29
    new-instance v0, Lcom/amazon/insights/core/log/Logger$LogLevel;

    const-string v1, "WARN"

    invoke-direct {v0, v1, v6}, Lcom/amazon/insights/core/log/Logger$LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/core/log/Logger$LogLevel;->WARN:Lcom/amazon/insights/core/log/Logger$LogLevel;

    .line 30
    new-instance v0, Lcom/amazon/insights/core/log/Logger$LogLevel;

    const-string v1, "ERROR"

    invoke-direct {v0, v1, v7}, Lcom/amazon/insights/core/log/Logger$LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/core/log/Logger$LogLevel;->ERROR:Lcom/amazon/insights/core/log/Logger$LogLevel;

    .line 31
    new-instance v0, Lcom/amazon/insights/core/log/Logger$LogLevel;

    const-string v1, "OFF"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/amazon/insights/core/log/Logger$LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/insights/core/log/Logger$LogLevel;->OFF:Lcom/amazon/insights/core/log/Logger$LogLevel;

    .line 25
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/amazon/insights/core/log/Logger$LogLevel;

    sget-object v1, Lcom/amazon/insights/core/log/Logger$LogLevel;->VERBOSE:Lcom/amazon/insights/core/log/Logger$LogLevel;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/insights/core/log/Logger$LogLevel;->DEBUG:Lcom/amazon/insights/core/log/Logger$LogLevel;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/insights/core/log/Logger$LogLevel;->INFO:Lcom/amazon/insights/core/log/Logger$LogLevel;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/insights/core/log/Logger$LogLevel;->WARN:Lcom/amazon/insights/core/log/Logger$LogLevel;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/insights/core/log/Logger$LogLevel;->ERROR:Lcom/amazon/insights/core/log/Logger$LogLevel;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->OFF:Lcom/amazon/insights/core/log/Logger$LogLevel;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/insights/core/log/Logger$LogLevel;->$VALUES:[Lcom/amazon/insights/core/log/Logger$LogLevel;

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
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/insights/core/log/Logger$LogLevel;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 25
    const-class v0, Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/Logger$LogLevel;

    return-object v0
.end method

.method public static values()[Lcom/amazon/insights/core/log/Logger$LogLevel;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/amazon/insights/core/log/Logger$LogLevel;->$VALUES:[Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {v0}, [Lcom/amazon/insights/core/log/Logger$LogLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/insights/core/log/Logger$LogLevel;

    return-object v0
.end method
