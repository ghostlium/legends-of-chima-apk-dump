.class Lcom/amazon/insights/error/BaseInsightsError;
.super Ljava/lang/Object;
.source "BaseInsightsError.java"

# interfaces
.implements Lcom/amazon/insights/error/InsightsError;


# instance fields
.field private final message:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/amazon/insights/error/BaseInsightsError;->message:Ljava/lang/String;

    .line 12
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/amazon/insights/error/BaseInsightsError;->message:Ljava/lang/String;

    return-object v0
.end method
