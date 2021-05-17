.class Lcom/flurry/sdk/q$3;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/q;->c(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/flurry/sdk/q;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/q;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 629
    iput-object p1, p0, Lcom/flurry/sdk/q$3;->b:Lcom/flurry/sdk/q;

    iput-object p2, p0, Lcom/flurry/sdk/q$3;->a:Ljava/lang/String;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .prologue
    .line 633
    iget-object v0, p0, Lcom/flurry/sdk/q$3;->b:Lcom/flurry/sdk/q;

    iget-object v1, p0, Lcom/flurry/sdk/q$3;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/q;->d(Ljava/lang/String;)Z

    .line 634
    return-void
.end method
