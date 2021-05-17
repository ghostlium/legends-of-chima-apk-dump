.class public Lcom/flurry/sdk/ak;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private b:Lcom/flurry/sdk/am;

.field private c:Lcom/flurry/sdk/v;

.field private d:I

.field private final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/flurry/sdk/ak;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lcom/flurry/sdk/ak;->d:I

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/ak;->e:Ljava/util/Map;

    .line 30
    new-instance v0, Lcom/flurry/sdk/v;

    invoke-direct {v0}, Lcom/flurry/sdk/v;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/ak;->c:Lcom/flurry/sdk/v;

    .line 31
    new-instance v0, Lcom/flurry/sdk/am;

    invoke-direct {v0}, Lcom/flurry/sdk/am;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    .line 32
    iget-object v0, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    iget-object v1, p0, Lcom/flurry/sdk/ak;->c:Lcom/flurry/sdk/v;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/am;->a(Lcom/flurry/sdk/an;)V

    .line 33
    return-void
.end method


# virtual methods
.method public declared-synchronized a(Ljava/lang/String;II)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II)",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 173
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/flurry/sdk/fg;->h()I

    move-result v1

    .line 175
    iget-object v0, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v0, p1, v1}, Lcom/flurry/sdk/am;->a(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    .line 177
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ak;->a(Ljava/util/List;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 179
    const/4 v0, 0x3

    sget-object v2, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "no valid ad units in cache for current orientation for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v2, v4}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 180
    if-ne v1, v3, :cond_4

    const/4 v2, 0x2

    .line 184
    :goto_0
    iget-object v0, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v0, p1, v2}, Lcom/flurry/sdk/am;->a(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v1

    .line 185
    invoke-virtual {p0, v1}, Lcom/flurry/sdk/ak;->a(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ak;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 187
    :cond_0
    const/4 v0, 0x3

    sget-object v4, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "no valid ad units in cache for other orientation for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v4, v5}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    :cond_1
    move-object v0, v1

    move v1, v2

    .line 191
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 192
    if-eqz v0, :cond_7

    .line 194
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 195
    :cond_3
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-ge v0, p3, :cond_7

    .line 197
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 198
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->c()Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v5, v6}, Lcom/flurry/sdk/fh;->a(J)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->e()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v5, v3, :cond_5

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_5

    .line 200
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    iget-object v5, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v5, p1, v1, v0}, Lcom/flurry/sdk/am;->b(Ljava/lang/String;ILcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Z

    move-result v0

    .line 202
    const/4 v5, 0x3

    sget-object v6, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Found combinable ad unit for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 203
    const/4 v5, 0x3

    sget-object v6, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Combinable Ad unit was removed = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v6, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 173
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_4
    move v2, v3

    .line 180
    goto/16 :goto_0

    .line 205
    :cond_5
    :try_start_1
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->c()Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v5, v6}, Lcom/flurry/sdk/fh;->a(J)Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-gtz v5, :cond_3

    .line 208
    :cond_6
    iget-object v5, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v5, p1, v1, v0}, Lcom/flurry/sdk/am;->b(Ljava/lang/String;ILcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Z

    .line 209
    const/4 v0, 0x3

    sget-object v5, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Removed invalid or expired ad unit for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v5, v6}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_1

    .line 215
    :cond_7
    monitor-exit p0

    return-object v2
.end method

.method public declared-synchronized a()V
    .locals 1

    .prologue
    .line 59
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v0}, Lcom/flurry/sdk/am;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    monitor-exit p0

    return-void

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 63
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/am;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    monitor-exit p0

    return-void

    .line 63
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized a(Ljava/lang/String;I)V
    .locals 2

    .prologue
    .line 79
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/flurry/sdk/fg;->h()I

    move-result v0

    .line 80
    iget-object v1, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v1, p1, v0, p2}, Lcom/flurry/sdk/am;->a(Ljava/lang/String;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    monitor-exit p0

    return-void

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 73
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/flurry/sdk/fg;->h()I

    move-result v0

    .line 74
    iget-object v1, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v1, p1, v0, p2}, Lcom/flurry/sdk/am;->a(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    monitor-exit p0

    return-void

    .line 73
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized a(Ljava/util/List;I)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 37
    monitor-enter p0

    const/4 v1, 0x3

    :try_start_0
    sget-object v2, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "putting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " orientation: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 39
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-object v10, v0

    .line 41
    invoke-virtual {v10}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->g()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 43
    new-instance v1, Lcom/flurry/sdk/y;

    invoke-virtual {v10}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->g()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->h()Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v10}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->l()Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-virtual {v10}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->i()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v10}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->j()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v10}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->k()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-direct/range {v1 .. v9}, Lcom/flurry/sdk/y;-><init>(Ljava/lang/String;JJIII)V

    .line 44
    invoke-static {}, Lcom/flurry/sdk/z;->a()Lcom/flurry/sdk/z;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/flurry/sdk/z;->a(Lcom/flurry/sdk/y;)V

    .line 52
    :cond_0
    invoke-static {}, Lcom/flurry/sdk/d;->a()Lcom/flurry/sdk/d;

    move-result-object v1

    invoke-virtual {v1, v10, p2}, Lcom/flurry/sdk/d;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;I)V

    .line 53
    invoke-virtual {v10}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 54
    iget-object v2, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v2, v1, p2, v10}, Lcom/flurry/sdk/am;->a(Ljava/lang/String;ILcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 37
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 56
    :cond_1
    monitor-exit p0

    return-void
.end method

.method public a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Z
    .locals 2

    .prologue
    .line 162
    invoke-virtual {p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->e()Ljava/lang/CharSequence;

    move-result-object v0

    const-string v1, "takeover"

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public a(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            ">;)Z"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 167
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public declared-synchronized b(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 85
    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 87
    invoke-static {}, Lcom/flurry/sdk/fg;->h()I

    move-result v0

    .line 88
    iget-object v1, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v1, p1, v0}, Lcom/flurry/sdk/am;->b(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/flurry/sdk/ak;->d:I

    .line 89
    iget-object v0, p0, Lcom/flurry/sdk/ak;->e:Ljava/util/Map;

    iget v1, p0, Lcom/flurry/sdk/ak;->d:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    :cond_0
    monitor-exit p0

    return-void

    .line 85
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized c(Ljava/lang/String;)I
    .locals 2

    .prologue
    .line 96
    monitor-enter p0

    const/4 v1, 0x0

    .line 98
    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/ak;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 100
    if-eqz v0, :cond_0

    .line 102
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 104
    :goto_0
    monitor-exit p0

    return v0

    .line 96
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public declared-synchronized d(Ljava/lang/String;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x1

    .line 109
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/flurry/sdk/fg;->h()I

    move-result v2

    .line 111
    iget-object v0, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v0, p1, v2}, Lcom/flurry/sdk/am;->a(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    .line 113
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ak;->a(Ljava/util/List;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 115
    const/4 v0, 0x3

    sget-object v4, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "no valid ad units in cache for current orientation for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v4, v5}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 116
    if-ne v2, v3, :cond_0

    const/4 v3, 0x2

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v0, p1, v3}, Lcom/flurry/sdk/am;->a(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v2

    .line 122
    invoke-virtual {p0, v2}, Lcom/flurry/sdk/ak;->a(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ak;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 124
    :cond_1
    const/4 v0, 0x3

    sget-object v2, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "no valid ad units in cache for other orientation for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v1

    .line 157
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_2
    move v3, v2

    move-object v2, v0

    .line 129
    :cond_3
    :try_start_1
    invoke-virtual {p0, v2}, Lcom/flurry/sdk/ak;->a(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 133
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 134
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 136
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 137
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->c()Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v5, v6}, Lcom/flurry/sdk/fh;->a(J)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_4

    .line 141
    iget-object v1, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v1, p1, v3, v0}, Lcom/flurry/sdk/am;->b(Ljava/lang/String;ILcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Z

    move-result v1

    .line 142
    const/4 v2, 0x3

    sget-object v3, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "found valid ad unit for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 143
    const/4 v2, 0x3

    sget-object v3, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Ad unit was removed = = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v3, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 109
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 150
    :cond_4
    :try_start_2
    iget-object v5, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v5, p1, v3, v0}, Lcom/flurry/sdk/am;->b(Ljava/lang/String;ILcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Z

    .line 151
    const/4 v0, 0x3

    sget-object v5, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Removed invalid or expired ad unit for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v5, v6}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 155
    :cond_5
    const/4 v0, 0x3

    sget-object v3, Lcom/flurry/sdk/ak;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "no valid ad units for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v3, v4}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Lcom/flurry/sdk/ak;->c:Lcom/flurry/sdk/v;

    invoke-virtual {v0, p1, v2}, Lcom/flurry/sdk/v;->a(Ljava/lang/String;Ljava/util/List;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v0, v1

    .line 157
    goto/16 :goto_0
.end method

.method public declared-synchronized e(Ljava/lang/String;)Z
    .locals 5

    .prologue
    .line 225
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/flurry/sdk/fg;->h()I

    move-result v1

    .line 227
    iget-object v0, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v0, p1, v1}, Lcom/flurry/sdk/am;->a(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    .line 230
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ak;->a(Ljava/util/List;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 232
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 234
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->c()Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/flurry/sdk/fh;->a(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-eqz v3, :cond_0

    .line 236
    const/4 v0, 0x1

    .line 245
    :goto_1
    monitor-exit p0

    return v0

    .line 241
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/flurry/sdk/ak;->b:Lcom/flurry/sdk/am;

    invoke-virtual {v3, p1, v1, v0}, Lcom/flurry/sdk/am;->b(Ljava/lang/String;ILcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 225
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 245
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method
