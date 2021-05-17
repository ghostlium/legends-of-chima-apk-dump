.class public Lcom/flurry/sdk/mx$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/na;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/mx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 283
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/mx$1;)V
    .locals 0

    .prologue
    .line 280
    invoke-direct {p0}, Lcom/flurry/sdk/mx$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/reflect/Method;)Z
    .locals 1

    .prologue
    .line 288
    invoke-static {p1}, Lcom/flurry/sdk/qs;->a(Ljava/lang/reflect/Method;)Z

    move-result v0

    return v0
.end method
