.class Lcom/flurry/sdk/u$3;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/u;->k(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/android/FlurryAdListener;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/flurry/sdk/u;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/u;Lcom/flurry/android/FlurryAdListener;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 454
    iput-object p1, p0, Lcom/flurry/sdk/u$3;->c:Lcom/flurry/sdk/u;

    iput-object p2, p0, Lcom/flurry/sdk/u$3;->a:Lcom/flurry/android/FlurryAdListener;

    iput-object p3, p0, Lcom/flurry/sdk/u$3;->b:Ljava/lang/String;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .prologue
    .line 457
    iget-object v0, p0, Lcom/flurry/sdk/u$3;->a:Lcom/flurry/android/FlurryAdListener;

    iget-object v1, p0, Lcom/flurry/sdk/u$3;->b:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/flurry/android/FlurryAdListener;->onRendered(Ljava/lang/String;)V

    .line 458
    return-void
.end method
