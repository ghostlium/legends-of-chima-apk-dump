.class public Lcom/cobra/zufflin/GooglePlay/IAP/util/IabException;
.super Ljava/lang/Exception;
.source "IabException.java"


# static fields
.field private static final serialVersionUID:J = 0x742f4dd2048e2fd9L


# instance fields
.field mResult:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "response"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 35
    new-instance v0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;

    invoke-direct {v0, p1, p2}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabException;-><init>(Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;)V

    .line 36
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "response"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "cause"    # Ljava/lang/Exception;

    .prologue
    .line 42
    new-instance v0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;

    invoke-direct {v0, p1, p2}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-direct {p0, v0, p3}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabException;-><init>(Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;Ljava/lang/Exception;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;)V
    .locals 1
    .param p1, "r"    # Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;

    .prologue
    .line 32
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabException;-><init>(Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;Ljava/lang/Exception;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "r"    # Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;
    .param p2, "cause"    # Ljava/lang/Exception;

    .prologue
    .line 38
    invoke-virtual {p1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 39
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabException;->mResult:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;

    .line 40
    return-void
.end method


# virtual methods
.method public getResult()Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabException;->mResult:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;

    return-object v0
.end method
