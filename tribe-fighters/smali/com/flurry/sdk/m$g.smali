.class final Lcom/flurry/sdk/m$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/m$d$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "g"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/m;

.field private b:Landroid/webkit/WebChromeClient$CustomViewCallback;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/m;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 0

    .prologue
    .line 301
    iput-object p1, p0, Lcom/flurry/sdk/m$g;->a:Lcom/flurry/sdk/m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 302
    iput-object p2, p0, Lcom/flurry/sdk/m$g;->b:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 303
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lcom/flurry/sdk/m$g;->b:Landroid/webkit/WebChromeClient$CustomViewCallback;

    if-eqz v0, :cond_0

    .line 308
    iget-object v0, p0, Lcom/flurry/sdk/m$g;->b:Landroid/webkit/WebChromeClient$CustomViewCallback;

    invoke-interface {v0}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 310
    :cond_0
    return-void
.end method
