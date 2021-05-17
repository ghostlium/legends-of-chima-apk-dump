.class Lcom/flurry/android/dx;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static fz:Lcom/flurry/android/dx;

.field private static m:Ljava/lang/String;


# instance fields
.field private aA:Ljava/lang/String;

.field private fx:Ljava/lang/String;

.field private volatile fy:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const-string v0, "FlurryAgent"

    sput-object v0, Lcom/flurry/android/dx;->m:Ljava/lang/String;

    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-string v0, ""

    iput-object v0, p0, Lcom/flurry/android/dx;->fx:Ljava/lang/String;

    .line 17
    return-void
.end method

.method static declared-synchronized an()Lcom/flurry/android/dx;
    .locals 2

    .prologue
    .line 29
    const-class v1, Lcom/flurry/android/dx;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/android/dx;->fz:Lcom/flurry/android/dx;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lcom/flurry/android/dx;

    invoke-direct {v0}, Lcom/flurry/android/dx;-><init>()V

    sput-object v0, Lcom/flurry/android/dx;->fz:Lcom/flurry/android/dx;

    .line 33
    :cond_0
    sget-object v0, Lcom/flurry/android/dx;->fz:Lcom/flurry/android/dx;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 29
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method final a(Lcom/flurry/android/ds;)V
    .locals 1

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/flurry/android/dx;->fy:Z

    if-nez v0, :cond_0

    .line 44
    iget-object v0, p1, Lcom/flurry/android/ds;->aA:Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/android/dx;->aA:Ljava/lang/String;

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/dx;->fy:Z

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/dx;->aA:Ljava/lang/String;

    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->j(Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public final getPushToken()Ljava/lang/String;
    .locals 2

    .prologue
    .line 108
    sget-object v0, Lcom/flurry/android/dx;->m:Ljava/lang/String;

    const-string v1, "getting push token."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    iget-object v0, p0, Lcom/flurry/android/dx;->fx:Ljava/lang/String;

    return-object v0
.end method

.method final isInitialized()Z
    .locals 1

    .prologue
    .line 54
    iget-boolean v0, p0, Lcom/flurry/android/dx;->fy:Z

    return v0
.end method

.method public final setPushToken(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "NP"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 90
    :cond_0
    sget-object v0, Lcom/flurry/android/dx;->m:Ljava/lang/String;

    const-string v1, "setting push token."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 94
    iput-object p1, p0, Lcom/flurry/android/dx;->fx:Ljava/lang/String;

    .line 104
    :cond_1
    :goto_0
    return-void

    .line 98
    :cond_2
    const-string v0, "NP"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 100
    iput-object p1, p0, Lcom/flurry/android/dx;->fx:Ljava/lang/String;

    goto :goto_0
.end method
