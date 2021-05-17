.class public Lcom/flurry/sdk/fo;
.super Lcom/flurry/sdk/fk;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/Object;

.field private b:Lcom/flurry/sdk/fm;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/fm;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Not in union "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    .line 28
    iput-object p1, p0, Lcom/flurry/sdk/fo;->b:Lcom/flurry/sdk/fm;

    .line 29
    iput-object p2, p0, Lcom/flurry/sdk/fo;->a:Ljava/lang/Object;

    .line 30
    return-void
.end method
