.class public abstract Lcom/flurry/sdk/le;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/le$b;,
        Lcom/flurry/sdk/le$a;,
        Lcom/flurry/sdk/le$c;
    }
.end annotation


# instance fields
.field public final a:Lcom/flurry/sdk/le;

.field public final b:Ljava/lang/Object;


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/le;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/flurry/sdk/le;->a:Lcom/flurry/sdk/le;

    .line 24
    iput-object p2, p0, Lcom/flurry/sdk/le;->b:Ljava/lang/Object;

    .line 25
    return-void
.end method


# virtual methods
.method public abstract a(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation
.end method
