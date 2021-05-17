.class final Lcom/flurry/sdk/bp$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/bp$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/bp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "c"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/bp$1;)V
    .locals 0

    .prologue
    .line 168
    invoke-direct {p0}, Lcom/flurry/sdk/bp$c;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)Lcom/mobclix/android/sdk/MobclixAdView;
    .locals 1

    .prologue
    .line 171
    new-instance v0, Lcom/mobclix/android/sdk/MobclixIABRectangleMAdView;

    check-cast p1, Landroid/app/Activity;

    invoke-direct {v0, p1}, Lcom/mobclix/android/sdk/MobclixIABRectangleMAdView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method
