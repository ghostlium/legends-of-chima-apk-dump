.class public final Lcom/flurry/sdk/qm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lcom/flurry/sdk/qm;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final f:[Lcom/flurry/sdk/rx;


# instance fields
.field protected final b:[Lcom/flurry/sdk/qn;

.field protected final c:Lcom/flurry/sdk/qo;

.field protected d:Lcom/flurry/sdk/qg;

.field protected e:Lcom/flurry/sdk/qg;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    new-instance v0, Lcom/flurry/sdk/qm;

    invoke-direct {v0}, Lcom/flurry/sdk/qm;-><init>()V

    sput-object v0, Lcom/flurry/sdk/qm;->a:Lcom/flurry/sdk/qm;

    .line 53
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/flurry/sdk/rx;

    sput-object v0, Lcom/flurry/sdk/qm;->f:[Lcom/flurry/sdk/rx;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    new-instance v0, Lcom/flurry/sdk/qo;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/qo;-><init>(Lcom/flurry/sdk/qm;)V

    iput-object v0, p0, Lcom/flurry/sdk/qm;->c:Lcom/flurry/sdk/qo;

    .line 95
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/qm;->b:[Lcom/flurry/sdk/qn;

    .line 96
    return-void
.end method

.method public static a()Lcom/flurry/sdk/qm;
    .locals 1

    .prologue
    .line 118
    sget-object v0, Lcom/flurry/sdk/qm;->a:Lcom/flurry/sdk/qm;

    return-object v0
.end method

.method public static a(Ljava/lang/String;)Lcom/flurry/sdk/rx;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 218
    sget-object v0, Lcom/flurry/sdk/qm;->a:Lcom/flurry/sdk/qm;

    invoke-virtual {v0, p0}, Lcom/flurry/sdk/qm;->b(Ljava/lang/String;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public static b()Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 134
    invoke-static {}, Lcom/flurry/sdk/qm;->a()Lcom/flurry/sdk/qm;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/qm;->c()Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method private b(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 995
    const-class v0, Ljava/util/Map;

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;Ljava/lang/Class;)[Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 997
    if-nez v0, :cond_0

    .line 998
    invoke-virtual {p0}, Lcom/flurry/sdk/qm;->c()Lcom/flurry/sdk/rx;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/qm;->c()Lcom/flurry/sdk/rx;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/flurry/sdk/qi;->a(Ljava/lang/Class;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/qi;

    move-result-object v0

    .line 1004
    :goto_0
    return-object v0

    .line 1001
    :cond_0
    array-length v1, v0

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    .line 1002
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Strange Map type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": can not determine type parameters"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1004
    :cond_1
    const/4 v1, 0x0

    aget-object v1, v0, v1

    const/4 v2, 0x1

    aget-object v0, v0, v2

    invoke-static {p1, v1, v0}, Lcom/flurry/sdk/qi;->a(Ljava/lang/Class;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/qi;

    move-result-object v0

    goto :goto_0
.end method

.method private c(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 1009
    const-class v0, Ljava/util/Collection;

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;Ljava/lang/Class;)[Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 1011
    if-nez v0, :cond_0

    .line 1012
    invoke-virtual {p0}, Lcom/flurry/sdk/qm;->c()Lcom/flurry/sdk/rx;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flurry/sdk/qf;->a(Ljava/lang/Class;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/qf;

    move-result-object v0

    .line 1018
    :goto_0
    return-object v0

    .line 1015
    :cond_0
    array-length v1, v0

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    .line 1016
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Strange Collection type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": can not determine type parameters"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1018
    :cond_1
    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/flurry/sdk/qf;->a(Ljava/lang/Class;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/qf;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method protected declared-synchronized a(Lcom/flurry/sdk/qg;)Lcom/flurry/sdk/qg;
    .locals 2

    .prologue
    .line 1142
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/qm;->d:Lcom/flurry/sdk/qg;

    if-nez v0, :cond_0

    .line 1143
    invoke-virtual {p1}, Lcom/flurry/sdk/qg;->a()Lcom/flurry/sdk/qg;

    move-result-object v0

    .line 1144
    const-class v1, Ljava/util/Map;

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/qm;->a(Lcom/flurry/sdk/qg;Ljava/lang/Class;)Lcom/flurry/sdk/qg;

    .line 1145
    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->b()Lcom/flurry/sdk/qg;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/qm;->d:Lcom/flurry/sdk/qg;

    .line 1147
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/qm;->d:Lcom/flurry/sdk/qg;

    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->a()Lcom/flurry/sdk/qg;

    move-result-object v0

    .line 1148
    invoke-virtual {p1, v0}, Lcom/flurry/sdk/qg;->a(Lcom/flurry/sdk/qg;)V

    .line 1149
    invoke-virtual {v0, p1}, Lcom/flurry/sdk/qg;->b(Lcom/flurry/sdk/qg;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1150
    monitor-exit p0

    return-object p1

    .line 1142
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected a(Lcom/flurry/sdk/qg;Ljava/lang/Class;)Lcom/flurry/sdk/qg;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/qg;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/qg;"
        }
    .end annotation

    .prologue
    .line 1113
    invoke-virtual {p1}, Lcom/flurry/sdk/qg;->e()Ljava/lang/Class;

    move-result-object v1

    .line 1114
    invoke-virtual {v1}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v2

    .line 1117
    if-eqz v2, :cond_1

    .line 1118
    array-length v3, v2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_1

    aget-object v4, v2, v0

    .line 1119
    invoke-virtual {p0, v4, p2}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/flurry/sdk/qg;

    move-result-object v4

    .line 1120
    if-eqz v4, :cond_0

    .line 1121
    invoke-virtual {v4, p1}, Lcom/flurry/sdk/qg;->b(Lcom/flurry/sdk/qg;)V

    .line 1122
    invoke-virtual {p1, v4}, Lcom/flurry/sdk/qg;->a(Lcom/flurry/sdk/qg;)V

    .line 1137
    :goto_1
    return-object p1

    .line 1118
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1128
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 1129
    if-eqz v0, :cond_2

    .line 1130
    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/flurry/sdk/qg;

    move-result-object v0

    .line 1131
    if-eqz v0, :cond_2

    .line 1132
    invoke-virtual {v0, p1}, Lcom/flurry/sdk/qg;->b(Lcom/flurry/sdk/qg;)V

    .line 1133
    invoke-virtual {p1, v0}, Lcom/flurry/sdk/qg;->a(Lcom/flurry/sdk/qg;)V

    goto :goto_1

    .line 1137
    :cond_2
    const/4 p1, 0x0

    goto :goto_1
.end method

.method protected a(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/flurry/sdk/qg;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/qg;"
        }
    .end annotation

    .prologue
    .line 1069
    new-instance v0, Lcom/flurry/sdk/qg;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/qg;-><init>(Ljava/lang/reflect/Type;)V

    .line 1070
    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->e()Ljava/lang/Class;

    move-result-object v1

    .line 1071
    if-ne v1, p2, :cond_0

    .line 1084
    :goto_0
    return-object v0

    .line 1075
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 1076
    if-eqz v1, :cond_1

    .line 1077
    invoke-virtual {p0, v1, p2}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/flurry/sdk/qg;

    move-result-object v1

    .line 1078
    if-eqz v1, :cond_1

    .line 1079
    invoke-virtual {v1, v0}, Lcom/flurry/sdk/qg;->b(Lcom/flurry/sdk/qg;)V

    .line 1080
    invoke-virtual {v0, v1}, Lcom/flurry/sdk/qg;->a(Lcom/flurry/sdk/qg;)V

    goto :goto_0

    .line 1084
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)Lcom/flurry/sdk/qi;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/util/Map;",
            ">;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/qi;"
        }
    .end annotation

    .prologue
    .line 604
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/Type;)Lcom/flurry/sdk/rx;

    move-result-object v0

    invoke-virtual {p0, p3}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/Type;)Lcom/flurry/sdk/rx;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/flurry/sdk/qi;->a(Ljava/lang/Class;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/qi;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/rx;Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 312
    instance-of v0, p1, Lcom/flurry/sdk/qj;

    if-eqz v0, :cond_4

    .line 314
    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Ljava/util/Map;

    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Ljava/util/Collection;

    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 318
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 319
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not subtype of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 322
    :cond_1
    new-instance v0, Lcom/flurry/sdk/ql;

    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flurry/sdk/ql;-><init>(Lcom/flurry/sdk/qm;Ljava/lang/Class;)V

    invoke-virtual {p0, p2, v0}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 324
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->n()Ljava/lang/Object;

    move-result-object v1

    .line 325
    if-eqz v1, :cond_2

    .line 327
    invoke-virtual {v0, v1}, Lcom/flurry/sdk/rx;->d(Ljava/lang/Object;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 329
    :cond_2
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->o()Ljava/lang/Object;

    move-result-object v1

    .line 330
    if-eqz v1, :cond_3

    .line 331
    invoke-virtual {v0, v1}, Lcom/flurry/sdk/rx;->f(Ljava/lang/Object;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 337
    :cond_3
    :goto_0
    return-object v0

    :cond_4
    invoke-virtual {p1, p2}, Lcom/flurry/sdk/rx;->f(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0
.end method

.method public a(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 662
    new-instance v0, Lcom/flurry/sdk/qj;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method protected a(Ljava/lang/Class;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/ql;",
            ")",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 821
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 822
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    invoke-static {v0, v1, v1}, Lcom/flurry/sdk/qc;->a(Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)Lcom/flurry/sdk/qc;

    move-result-object v0

    .line 840
    :goto_0
    return-object v0

    .line 827
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->isEnum()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 828
    new-instance v0, Lcom/flurry/sdk/qj;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;)V

    goto :goto_0

    .line 834
    :cond_1
    const-class v0, Ljava/util/Map;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 835
    invoke-direct {p0, p1}, Lcom/flurry/sdk/qm;->b(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0

    .line 837
    :cond_2
    const-class v0, Ljava/util/Collection;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 838
    invoke-direct {p0, p1}, Lcom/flurry/sdk/qm;->c(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0

    .line 840
    :cond_3
    new-instance v0, Lcom/flurry/sdk/qj;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;)V

    goto :goto_0
.end method

.method protected a(Ljava/lang/Class;Ljava/util/List;)Lcom/flurry/sdk/rx;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/rx;",
            ">;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 849
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 850
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    invoke-static {v0, v1, v1}, Lcom/flurry/sdk/qc;->a(Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)Lcom/flurry/sdk/qc;

    move-result-object v0

    .line 876
    :goto_0
    return-object v0

    .line 852
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->isEnum()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 853
    new-instance v0, Lcom/flurry/sdk/qj;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;)V

    goto :goto_0

    .line 855
    :cond_1
    const-class v0, Ljava/util/Map;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 858
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 859
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/rx;

    .line 860
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_2

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flurry/sdk/rx;

    .line 862
    :goto_1
    invoke-static {p1, v0, v1}, Lcom/flurry/sdk/qi;->a(Ljava/lang/Class;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/qi;

    move-result-object v0

    goto :goto_0

    .line 860
    :cond_2
    invoke-virtual {p0}, Lcom/flurry/sdk/qm;->c()Lcom/flurry/sdk/rx;

    move-result-object v1

    goto :goto_1

    .line 864
    :cond_3
    invoke-direct {p0, p1}, Lcom/flurry/sdk/qm;->b(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0

    .line 866
    :cond_4
    const-class v0, Ljava/util/Collection;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 867
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-lt v0, v3, :cond_5

    .line 868
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/rx;

    invoke-static {p1, v0}, Lcom/flurry/sdk/qf;->a(Ljava/lang/Class;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/qf;

    move-result-object v0

    goto :goto_0

    .line 870
    :cond_5
    invoke-direct {p0, p1}, Lcom/flurry/sdk/qm;->c(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0

    .line 872
    :cond_6
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_7

    .line 873
    new-instance v0, Lcom/flurry/sdk/qj;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;)V

    goto :goto_0

    .line 875
    :cond_7
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/flurry/sdk/rx;

    invoke-interface {p2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flurry/sdk/rx;

    .line 876
    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;[Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0
.end method

.method public a(Ljava/lang/Class;[Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/rx;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Lcom/flurry/sdk/rx;",
            ")",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 639
    invoke-virtual {p1}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v1

    .line 640
    array-length v0, v1

    array-length v2, p2

    if-eq v0, v2, :cond_0

    .line 641
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Parameter type mismatch for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": expected "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v1, v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " parameters, was given "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 644
    :cond_0
    array-length v0, v1

    new-array v2, v0, [Ljava/lang/String;

    .line 645
    const/4 v0, 0x0

    array-length v3, v1

    :goto_0
    if-ge v0, v3, :cond_1

    .line 646
    aget-object v5, v1, v0

    invoke-interface {v5}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v0

    .line 645
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 648
    :cond_1
    new-instance v0, Lcom/flurry/sdk/qj;

    move-object v1, p1

    move-object v3, p2

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;[Ljava/lang/String;[Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 649
    return-object v0
.end method

.method protected a(Ljava/lang/reflect/GenericArrayType;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 935
    invoke-interface {p1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 936
    invoke-static {v0, v1, v1}, Lcom/flurry/sdk/qc;->a(Lcom/flurry/sdk/rx;Ljava/lang/Object;Ljava/lang/Object;)Lcom/flurry/sdk/qc;

    move-result-object v0

    return-object v0
.end method

.method protected a(Ljava/lang/reflect/ParameterizedType;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v3, 0x0

    .line 894
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 895
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v5

    .line 896
    if-nez v5, :cond_1

    move v4, v3

    .line 900
    :goto_0
    if-nez v4, :cond_2

    .line 901
    sget-object v1, Lcom/flurry/sdk/qm;->f:[Lcom/flurry/sdk/rx;

    .line 910
    :cond_0
    const-class v2, Ljava/util/Map;

    invoke-virtual {v2, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 911
    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;[Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/rx;

    move-result-object v1

    .line 912
    const-class v2, Ljava/util/Map;

    invoke-virtual {p0, v1, v2}, Lcom/flurry/sdk/qm;->b(Lcom/flurry/sdk/rx;Ljava/lang/Class;)[Lcom/flurry/sdk/rx;

    move-result-object v1

    .line 913
    array-length v2, v1

    const/4 v4, 0x2

    if-eq v2, v4, :cond_3

    .line 914
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not find 2 type parameters for Map class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " (found "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 896
    :cond_1
    array-length v1, v5

    move v4, v1

    goto :goto_0

    .line 903
    :cond_2
    new-array v1, v4, [Lcom/flurry/sdk/rx;

    move v2, v3

    .line 904
    :goto_1
    if-ge v2, v4, :cond_0

    .line 905
    aget-object v6, v5, v2

    invoke-virtual {p0, v6, p2}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v6

    aput-object v6, v1, v2

    .line 904
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 916
    :cond_3
    aget-object v2, v1, v3

    aget-object v1, v1, v7

    invoke-static {v0, v2, v1}, Lcom/flurry/sdk/qi;->a(Ljava/lang/Class;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/qi;

    move-result-object v0

    .line 929
    :goto_2
    return-object v0

    .line 918
    :cond_4
    const-class v2, Ljava/util/Collection;

    invoke-virtual {v2, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 919
    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;[Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/rx;

    move-result-object v1

    .line 920
    const-class v2, Ljava/util/Collection;

    invoke-virtual {p0, v1, v2}, Lcom/flurry/sdk/qm;->b(Lcom/flurry/sdk/rx;Ljava/lang/Class;)[Lcom/flurry/sdk/rx;

    move-result-object v1

    .line 921
    array-length v2, v1

    if-eq v2, v7, :cond_5

    .line 922
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not find 1 type parameter for Collection class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " (found "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 924
    :cond_5
    aget-object v1, v1, v3

    invoke-static {v0, v1}, Lcom/flurry/sdk/qf;->a(Ljava/lang/Class;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/qf;

    move-result-object v0

    goto :goto_2

    .line 926
    :cond_6
    if-nez v4, :cond_7

    .line 927
    new-instance v1, Lcom/flurry/sdk/qj;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;)V

    move-object v0, v1

    goto :goto_2

    .line 929
    :cond_7
    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;[Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_2
.end method

.method public a(Ljava/lang/reflect/Type;)Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 444
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 448
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method protected a(Ljava/lang/reflect/TypeVariable;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Lcom/flurry/sdk/ql;",
            ")",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 945
    if-nez p2, :cond_1

    .line 946
    invoke-virtual {p0}, Lcom/flurry/sdk/qm;->c()Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 977
    :cond_0
    :goto_0
    return-object v0

    .line 950
    :cond_1
    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v1

    .line 951
    invoke-virtual {p2, v1}, Lcom/flurry/sdk/ql;->a(Ljava/lang/String;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 952
    if-nez v0, :cond_0

    .line 961
    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 976
    invoke-virtual {p2, v1}, Lcom/flurry/sdk/ql;->b(Ljava/lang/String;)V

    .line 977
    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0
.end method

.method protected a(Ljava/lang/reflect/WildcardType;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;
    .locals 2

    .prologue
    .line 990
    invoke-interface {p1}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Class;Ljava/lang/Class;)[Lcom/flurry/sdk/rx;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)[",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 399
    new-instance v0, Lcom/flurry/sdk/ql;

    invoke-direct {v0, p0, p1}, Lcom/flurry/sdk/ql;-><init>(Lcom/flurry/sdk/qm;Ljava/lang/Class;)V

    invoke-virtual {p0, p1, p2, v0}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/flurry/sdk/ql;)[Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Class;Ljava/lang/Class;Lcom/flurry/sdk/ql;)[Lcom/flurry/sdk/rx;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/ql;",
            ")[",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 405
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/qm;->c(Ljava/lang/Class;Ljava/lang/Class;)Lcom/flurry/sdk/qg;

    move-result-object v0

    .line 407
    if-nez v0, :cond_1

    .line 408
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a subtype of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    move-object p3, v1

    .line 412
    :cond_1
    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->b()Lcom/flurry/sdk/qg;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 413
    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->b()Lcom/flurry/sdk/qg;

    move-result-object v0

    .line 414
    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->e()Ljava/lang/Class;

    move-result-object v2

    .line 415
    new-instance v1, Lcom/flurry/sdk/ql;

    invoke-direct {v1, p0, v2}, Lcom/flurry/sdk/ql;-><init>(Lcom/flurry/sdk/qm;Ljava/lang/Class;)V

    .line 416
    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->c()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 417
    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->d()Ljava/lang/reflect/ParameterizedType;

    move-result-object v3

    .line 418
    invoke-interface {v3}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v3

    .line 419
    invoke-virtual {v2}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v4

    .line 420
    array-length v5, v3

    .line 421
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v5, :cond_0

    .line 422
    aget-object v6, v4, v2

    invoke-interface {v6}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v6

    .line 423
    sget-object v7, Lcom/flurry/sdk/qm;->a:Lcom/flurry/sdk/qm;

    aget-object v8, v3, v2

    invoke-virtual {v7, v8, p3}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v7

    .line 424
    invoke-virtual {v1, v6, v7}, Lcom/flurry/sdk/ql;->a(Ljava/lang/String;Lcom/flurry/sdk/rx;)V

    .line 421
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 431
    :cond_2
    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->c()Z

    move-result v0

    if-nez v0, :cond_3

    .line 432
    const/4 v0, 0x0

    .line 434
    :goto_1
    return-object v0

    :cond_3
    invoke-virtual {p3}, Lcom/flurry/sdk/ql;->b()[Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_1
.end method

.method public b(Ljava/lang/Class;Ljava/lang/Class;)Lcom/flurry/sdk/qf;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/util/Collection;",
            ">;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/qf;"
        }
    .end annotation

    .prologue
    .line 546
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/Type;)Lcom/flurry/sdk/rx;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flurry/sdk/qf;->a(Ljava/lang/Class;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/qf;

    move-result-object v0

    return-object v0
.end method

.method protected declared-synchronized b(Lcom/flurry/sdk/qg;)Lcom/flurry/sdk/qg;
    .locals 2

    .prologue
    .line 1155
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/qm;->e:Lcom/flurry/sdk/qg;

    if-nez v0, :cond_0

    .line 1156
    invoke-virtual {p1}, Lcom/flurry/sdk/qg;->a()Lcom/flurry/sdk/qg;

    move-result-object v0

    .line 1157
    const-class v1, Ljava/util/List;

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/qm;->a(Lcom/flurry/sdk/qg;Ljava/lang/Class;)Lcom/flurry/sdk/qg;

    .line 1158
    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->b()Lcom/flurry/sdk/qg;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/qm;->e:Lcom/flurry/sdk/qg;

    .line 1160
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/qm;->e:Lcom/flurry/sdk/qg;

    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->a()Lcom/flurry/sdk/qg;

    move-result-object v0

    .line 1161
    invoke-virtual {p1, v0}, Lcom/flurry/sdk/qg;->a(Lcom/flurry/sdk/qg;)V

    .line 1162
    invoke-virtual {v0, p1}, Lcom/flurry/sdk/qg;->b(Lcom/flurry/sdk/qg;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1163
    monitor-exit p0

    return-object p1

    .line 1155
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected b(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/flurry/sdk/qg;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/qg;"
        }
    .end annotation

    .prologue
    .line 1089
    new-instance v0, Lcom/flurry/sdk/qg;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/qg;-><init>(Ljava/lang/reflect/Type;)V

    .line 1090
    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->e()Ljava/lang/Class;

    move-result-object v1

    .line 1091
    if-ne v1, p2, :cond_0

    .line 1092
    new-instance v0, Lcom/flurry/sdk/qg;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/qg;-><init>(Ljava/lang/reflect/Type;)V

    .line 1108
    :goto_0
    return-object v0

    .line 1098
    :cond_0
    const-class v2, Ljava/util/HashMap;

    if-ne v1, v2, :cond_1

    .line 1099
    const-class v2, Ljava/util/Map;

    if-ne p2, v2, :cond_1

    .line 1100
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/qm;->a(Lcom/flurry/sdk/qg;)Lcom/flurry/sdk/qg;

    move-result-object v0

    goto :goto_0

    .line 1103
    :cond_1
    const-class v2, Ljava/util/ArrayList;

    if-ne v1, v2, :cond_2

    .line 1104
    const-class v1, Ljava/util/List;

    if-ne p2, v1, :cond_2

    .line 1105
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/qm;->b(Lcom/flurry/sdk/qg;)Lcom/flurry/sdk/qg;

    move-result-object v0

    goto :goto_0

    .line 1108
    :cond_2
    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/qm;->a(Lcom/flurry/sdk/qg;Ljava/lang/Class;)Lcom/flurry/sdk/qg;

    move-result-object v0

    goto :goto_0
.end method

.method public b(Ljava/lang/String;)Lcom/flurry/sdk/rx;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 354
    iget-object v0, p0, Lcom/flurry/sdk/qm;->c:Lcom/flurry/sdk/qo;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/qo;->a(Ljava/lang/String;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public b(Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;
    .locals 5

    .prologue
    .line 475
    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_1

    move-object v0, p1

    .line 476
    check-cast v0, Ljava/lang/Class;

    .line 480
    if-nez p2, :cond_0

    .line 481
    new-instance p2, Lcom/flurry/sdk/ql;

    invoke-direct {p2, p0, v0}, Lcom/flurry/sdk/ql;-><init>(Lcom/flurry/sdk/qm;Ljava/lang/Class;)V

    .line 483
    :cond_0
    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 505
    :goto_0
    iget-object v1, p0, Lcom/flurry/sdk/qm;->b:[Lcom/flurry/sdk/qn;

    if-eqz v1, :cond_6

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->f()Z

    move-result v1

    if-nez v1, :cond_6

    .line 506
    iget-object v3, p0, Lcom/flurry/sdk/qm;->b:[Lcom/flurry/sdk/qn;

    array-length v4, v3

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v4, :cond_6

    aget-object v2, v3, v1

    .line 507
    invoke-virtual {v2, v0, p1, p2, p0}, Lcom/flurry/sdk/qn;->a(Lcom/flurry/sdk/rx;Ljava/lang/reflect/Type;Lcom/flurry/sdk/ql;Lcom/flurry/sdk/qm;)Lcom/flurry/sdk/rx;

    move-result-object v2

    .line 506
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    move-object v0, v2

    goto :goto_1

    .line 486
    :cond_1
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_2

    move-object v0, p1

    .line 487
    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/ParameterizedType;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0

    .line 489
    :cond_2
    instance-of v0, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v0, :cond_3

    move-object v0, p1

    .line 490
    check-cast v0, Ljava/lang/reflect/GenericArrayType;

    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/GenericArrayType;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0

    .line 492
    :cond_3
    instance-of v0, p1, Ljava/lang/reflect/TypeVariable;

    if-eqz v0, :cond_4

    move-object v0, p1

    .line 493
    check-cast v0, Ljava/lang/reflect/TypeVariable;

    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/TypeVariable;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0

    .line 495
    :cond_4
    instance-of v0, p1, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_5

    move-object v0, p1

    .line 496
    check-cast v0, Ljava/lang/reflect/WildcardType;

    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/WildcardType;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0

    .line 499
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized Type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 510
    :cond_6
    return-object v0
.end method

.method public b(Lcom/flurry/sdk/rx;Ljava/lang/Class;)[Lcom/flurry/sdk/rx;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Ljava/lang/Class",
            "<*>;)[",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 378
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    .line 379
    if-ne v0, p2, :cond_2

    .line 381
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->h()I

    move-result v2

    .line 382
    if-nez v2, :cond_1

    const/4 v0, 0x0

    .line 395
    :cond_0
    :goto_0
    return-object v0

    .line 383
    :cond_1
    new-array v0, v2, [Lcom/flurry/sdk/rx;

    .line 384
    const/4 v1, 0x0

    :goto_1
    if-ge v1, v2, :cond_0

    .line 385
    invoke-virtual {p1, v1}, Lcom/flurry/sdk/rx;->b(I)Lcom/flurry/sdk/rx;

    move-result-object v3

    aput-object v3, v0, v1

    .line 384
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 395
    :cond_2
    new-instance v1, Lcom/flurry/sdk/ql;

    invoke-direct {v1, p0, p1}, Lcom/flurry/sdk/ql;-><init>(Lcom/flurry/sdk/qm;Lcom/flurry/sdk/rx;)V

    invoke-virtual {p0, v0, p2, v1}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;Ljava/lang/Class;Lcom/flurry/sdk/ql;)[Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0
.end method

.method protected c(Ljava/lang/Class;Ljava/lang/Class;)Lcom/flurry/sdk/qg;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/qg;"
        }
    .end annotation

    .prologue
    .line 1061
    invoke-virtual {p2}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1062
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/qm;->b(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/flurry/sdk/qg;

    move-result-object v0

    .line 1064
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/flurry/sdk/qg;

    move-result-object v0

    goto :goto_0
.end method

.method protected c()Lcom/flurry/sdk/rx;
    .locals 2

    .prologue
    .line 1043
    new-instance v0, Lcom/flurry/sdk/qj;

    const-class v1, Ljava/lang/Object;

    invoke-direct {v0, v1}, Lcom/flurry/sdk/qj;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method
