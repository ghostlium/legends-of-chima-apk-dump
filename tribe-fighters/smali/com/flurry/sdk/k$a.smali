.class final Lcom/flurry/sdk/k$a;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/k;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/k;)V
    .locals 0

    .prologue
    .line 142
    iput-object p1, p0, Lcom/flurry/sdk/k$a;->a:Lcom/flurry/sdk/k;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/k;Lcom/flurry/sdk/k$1;)V
    .locals 0

    .prologue
    .line 142
    invoke-direct {p0, p1}, Lcom/flurry/sdk/k$a;-><init>(Lcom/flurry/sdk/k;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/flurry/sdk/k$a;->a:Lcom/flurry/sdk/k;

    invoke-static {v0}, Lcom/flurry/sdk/k;->a(Lcom/flurry/sdk/k;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/flurry/sdk/k$a;->a:Lcom/flurry/sdk/k;

    invoke-static {v0}, Lcom/flurry/sdk/k;->c(Lcom/flurry/sdk/k;)V

    .line 148
    :cond_0
    return-void
.end method
