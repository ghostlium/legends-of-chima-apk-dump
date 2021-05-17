.class Lcom/flurry/sdk/u$b;
.super Lcom/flurry/sdk/fj;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/u;

.field private final b:Ljava/lang/String;

.field private final c:Landroid/view/ViewGroup;

.field private final d:Z

.field private final e:Lcom/flurry/android/FlurryAdSize;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/u;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V
    .locals 0

    .prologue
    .line 734
    iput-object p1, p0, Lcom/flurry/sdk/u$b;->a:Lcom/flurry/sdk/u;

    invoke-direct {p0}, Lcom/flurry/sdk/fj;-><init>()V

    .line 735
    iput-object p2, p0, Lcom/flurry/sdk/u$b;->b:Ljava/lang/String;

    .line 736
    iput-object p3, p0, Lcom/flurry/sdk/u$b;->c:Landroid/view/ViewGroup;

    .line 737
    iput-object p4, p0, Lcom/flurry/sdk/u$b;->e:Lcom/flurry/android/FlurryAdSize;

    .line 738
    iput-boolean p5, p0, Lcom/flurry/sdk/u$b;->d:Z

    .line 739
    return-void
.end method


# virtual methods
.method public a()V
    .locals 6

    .prologue
    .line 743
    invoke-static {}, Lcom/flurry/sdk/fg;->h()I

    move-result v5

    .line 744
    iget-object v0, p0, Lcom/flurry/sdk/u$b;->a:Lcom/flurry/sdk/u;

    iget-object v1, p0, Lcom/flurry/sdk/u$b;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/flurry/sdk/u$b;->c:Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/flurry/sdk/u$b;->e:Lcom/flurry/android/FlurryAdSize;

    iget-boolean v4, p0, Lcom/flurry/sdk/u$b;->d:Z

    invoke-static/range {v0 .. v5}, Lcom/flurry/sdk/u;->a(Lcom/flurry/sdk/u;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;ZI)Ljava/util/List;

    move-result-object v0

    .line 746
    iget-object v1, p0, Lcom/flurry/sdk/u$b;->a:Lcom/flurry/sdk/u;

    invoke-static {v1, v0, v5}, Lcom/flurry/sdk/u;->a(Lcom/flurry/sdk/u;Ljava/util/List;I)V

    .line 752
    iget-object v0, p0, Lcom/flurry/sdk/u$b;->a:Lcom/flurry/sdk/u;

    iget-object v1, p0, Lcom/flurry/sdk/u$b;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/u;->f(Ljava/lang/String;)V

    .line 753
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/u;->c()Ljava/lang/String;

    move-result-object v1

    const-string v2, "fetchAdTaskExecute :setting cache request limit count"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 754
    return-void
.end method

.method public b()V
    .locals 4

    .prologue
    .line 757
    const/4 v0, 0x0

    .line 760
    iget-object v1, p0, Lcom/flurry/sdk/u$b;->a:Lcom/flurry/sdk/u;

    iget-object v2, p0, Lcom/flurry/sdk/u$b;->b:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/flurry/sdk/u;->a(Lcom/flurry/sdk/u;Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v1

    .line 761
    monitor-enter v1

    .line 762
    :try_start_0
    sget-object v2, Lcom/flurry/sdk/u$a$a;->b:Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v1}, Lcom/flurry/sdk/u$a;->b()Lcom/flurry/sdk/u$a$a;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/u$a$a;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 763
    const/4 v0, 0x1

    .line 765
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 767
    if-eqz v0, :cond_1

    .line 768
    iget-object v0, p0, Lcom/flurry/sdk/u$b;->a:Lcom/flurry/sdk/u;

    iget-object v1, p0, Lcom/flurry/sdk/u$b;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flurry/sdk/u;->b(Lcom/flurry/sdk/u;Ljava/lang/String;)V

    .line 770
    :cond_1
    return-void

    .line 765
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
