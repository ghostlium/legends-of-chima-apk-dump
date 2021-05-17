.class final Lcom/flurry/android/cv;
.super Lcom/flurry/android/es;
.source "SourceFile"


# instance fields
.field private synthetic cx:Lcom/flurry/android/s;


# direct methods
.method synthetic constructor <init>(Lcom/flurry/android/s;)V
    .locals 1

    .prologue
    .line 138
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/flurry/android/cv;-><init>(Lcom/flurry/android/s;B)V

    return-void
.end method

.method private constructor <init>(Lcom/flurry/android/s;B)V
    .locals 0

    .prologue
    .line 138
    iput-object p1, p0, Lcom/flurry/android/cv;->cx:Lcom/flurry/android/s;

    invoke-direct {p0}, Lcom/flurry/android/es;-><init>()V

    return-void
.end method


# virtual methods
.method public final c()V
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/flurry/android/cv;->cx:Lcom/flurry/android/s;

    invoke-static {v0}, Lcom/flurry/android/s;->a(Lcom/flurry/android/s;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/flurry/android/cv;->cx:Lcom/flurry/android/s;

    invoke-static {v0}, Lcom/flurry/android/s;->c(Lcom/flurry/android/s;)V

    .line 144
    :cond_0
    return-void
.end method
