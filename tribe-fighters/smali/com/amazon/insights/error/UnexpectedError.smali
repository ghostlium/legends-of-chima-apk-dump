.class public Lcom/amazon/insights/error/UnexpectedError;
.super Lcom/amazon/insights/error/BaseInsightsError;
.source "UnexpectedError.java"


# instance fields
.field private final exception:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/amazon/insights/error/BaseInsightsError;-><init>(Ljava/lang/String;)V

    .line 21
    iput-object p2, p0, Lcom/amazon/insights/error/UnexpectedError;->exception:Ljava/lang/Exception;

    .line 22
    return-void
.end method


# virtual methods
.method public getException()Ljava/lang/Exception;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/amazon/insights/error/UnexpectedError;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public bridge synthetic getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    invoke-super {p0}, Lcom/amazon/insights/error/BaseInsightsError;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
