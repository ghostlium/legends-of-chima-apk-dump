.class final Lcom/flurry/sdk/lc$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/lc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "b"
.end annotation


# instance fields
.field private final a:Lcom/flurry/sdk/kt;

.field private final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/kt;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    iput-object p1, p0, Lcom/flurry/sdk/lc$b;->a:Lcom/flurry/sdk/kt;

    .line 160
    iput-object p2, p0, Lcom/flurry/sdk/lc$b;->b:Ljava/lang/String;

    .line 161
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/flurry/sdk/lc$b;->b:Ljava/lang/String;

    return-object v0
.end method

.method public a(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/flurry/sdk/lc$b;->b:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public b()Lcom/flurry/sdk/kt;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lcom/flurry/sdk/lc$b;->a:Lcom/flurry/sdk/kt;

    return-object v0
.end method
