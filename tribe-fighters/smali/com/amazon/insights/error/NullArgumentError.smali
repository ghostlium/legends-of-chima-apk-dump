.class public Lcom/amazon/insights/error/NullArgumentError;
.super Lcom/amazon/insights/error/BaseInsightsError;
.source "NullArgumentError.java"


# static fields
.field private static final MESSAGE_TEMPLATE:Ljava/lang/String; = "Null value for parameter: \'%s\' provided to method \'%s\'"


# instance fields
.field private final parameterName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "parameterName"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 20
    const-string v0, "Null value for parameter: \'%s\' provided to method \'%s\'"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazon/insights/error/BaseInsightsError;-><init>(Ljava/lang/String;)V

    .line 21
    iput-object p1, p0, Lcom/amazon/insights/error/NullArgumentError;->parameterName:Ljava/lang/String;

    .line 22
    return-void
.end method


# virtual methods
.method public bridge synthetic getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 15
    invoke-super {p0}, Lcom/amazon/insights/error/BaseInsightsError;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParameterName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/amazon/insights/error/NullArgumentError;->parameterName:Ljava/lang/String;

    return-object v0
.end method
