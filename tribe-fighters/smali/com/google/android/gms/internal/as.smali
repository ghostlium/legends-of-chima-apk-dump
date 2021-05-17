.class public final Lcom/google/android/gms/internal/as;
.super Ljava/lang/Object;


# instance fields
.field private final ed:Lcom/google/android/gms/internal/bb;

.field private fA:Lcom/google/android/gms/internal/ax;

.field private final fw:Lcom/google/android/gms/internal/bz;

.field private final fx:Ljava/lang/Object;

.field private final fy:Lcom/google/android/gms/internal/au;

.field private fz:Z

.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/bz;Lcom/google/android/gms/internal/bb;Lcom/google/android/gms/internal/au;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/as;->fx:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/as;->fz:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/as;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/as;->fw:Lcom/google/android/gms/internal/bz;

    iput-object p3, p0, Lcom/google/android/gms/internal/as;->ed:Lcom/google/android/gms/internal/bb;

    iput-object p4, p0, Lcom/google/android/gms/internal/as;->fy:Lcom/google/android/gms/internal/au;

    return-void
.end method


# virtual methods
.method public a(JJ)Lcom/google/android/gms/internal/ay;
    .locals 11

    const-string v0, "Starting mediation."

    invoke-static {v0}, Lcom/google/android/gms/internal/cs;->r(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/as;->fy:Lcom/google/android/gms/internal/au;

    iget-object v0, v0, Lcom/google/android/gms/internal/au;->fI:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/at;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Trying mediation network: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v5, Lcom/google/android/gms/internal/at;->fD:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/cs;->t(Ljava/lang/String;)V

    iget-object v0, v5, Lcom/google/android/gms/internal/at;->fE:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v10, p0, Lcom/google/android/gms/internal/as;->fx:Ljava/lang/Object;

    monitor-enter v10

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/as;->fz:Z

    if-eqz v0, :cond_2

    new-instance v0, Lcom/google/android/gms/internal/ay;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/ay;-><init>(I)V

    monitor-exit v10

    :goto_1
    return-object v0

    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/ax;

    iget-object v1, p0, Lcom/google/android/gms/internal/as;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/google/android/gms/internal/as;->ed:Lcom/google/android/gms/internal/bb;

    iget-object v4, p0, Lcom/google/android/gms/internal/as;->fy:Lcom/google/android/gms/internal/au;

    iget-object v6, p0, Lcom/google/android/gms/internal/as;->fw:Lcom/google/android/gms/internal/bz;

    iget-object v6, v6, Lcom/google/android/gms/internal/bz;->hp:Lcom/google/android/gms/internal/v;

    iget-object v7, p0, Lcom/google/android/gms/internal/as;->fw:Lcom/google/android/gms/internal/bz;

    iget-object v7, v7, Lcom/google/android/gms/internal/bz;->em:Lcom/google/android/gms/internal/x;

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/ax;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/bb;Lcom/google/android/gms/internal/au;Lcom/google/android/gms/internal/at;Lcom/google/android/gms/internal/v;Lcom/google/android/gms/internal/x;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/as;->fA:Lcom/google/android/gms/internal/ax;

    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/internal/as;->fA:Lcom/google/android/gms/internal/ax;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/ax;->b(JJ)Lcom/google/android/gms/internal/ay;

    move-result-object v0

    iget v1, v0, Lcom/google/android/gms/internal/ay;->fZ:I

    if-nez v1, :cond_3

    const-string v1, "Adapter succeeded."

    invoke-static {v1}, Lcom/google/android/gms/internal/cs;->r(Ljava/lang/String;)V

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_3
    iget-object v1, v0, Lcom/google/android/gms/internal/ay;->gb:Lcom/google/android/gms/internal/bc;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/google/android/gms/internal/cr;->iE:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/as$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/as$1;-><init>(Lcom/google/android/gms/internal/as;Lcom/google/android/gms/internal/ay;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_4
    new-instance v0, Lcom/google/android/gms/internal/ay;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/ay;-><init>(I)V

    goto :goto_1
.end method

.method public cancel()V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/as;->fx:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/google/android/gms/internal/as;->fz:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/as;->fA:Lcom/google/android/gms/internal/ax;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/as;->fA:Lcom/google/android/gms/internal/ax;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ax;->cancel()V

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
