.class public Lcom/flurry/sdk/gr;
.super Lcom/flurry/sdk/fs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/gr$2;,
        Lcom/flurry/sdk/gr$a;
    }
.end annotation


# static fields
.field private static final a:Lcom/flurry/sdk/gr;

.field private static final c:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static final d:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class;",
            "Ljava/lang/reflect/Constructor;",
            ">;"
        }
    .end annotation
.end field

.field private static final g:Ljava/lang/Class;

.field private static final h:Lcom/flurry/sdk/fm;


# instance fields
.field private final b:Ljava/lang/ClassLoader;

.field private f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/reflect/Type;",
            "Lcom/flurry/sdk/fm;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 41
    new-instance v0, Lcom/flurry/sdk/gr;

    invoke-direct {v0}, Lcom/flurry/sdk/gr;-><init>()V

    sput-object v0, Lcom/flurry/sdk/gr;->a:Lcom/flurry/sdk/gr;

    .line 45
    new-array v0, v2, [Ljava/lang/Class;

    sput-object v0, Lcom/flurry/sdk/gr;->c:[Ljava/lang/Class;

    .line 46
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/flurry/sdk/fm;

    aput-object v1, v0, v2

    sput-object v0, Lcom/flurry/sdk/gr;->d:[Ljava/lang/Class;

    .line 47
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/flurry/sdk/gr;->e:Ljava/util/Map;

    .line 80
    new-instance v0, Lcom/flurry/sdk/gr$1;

    invoke-direct {v0}, Lcom/flurry/sdk/gr$1;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/gr;->g:Ljava/lang/Class;

    .line 81
    sget-object v0, Lcom/flurry/sdk/fm$v;->n:Lcom/flurry/sdk/fm$v;

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$v;)Lcom/flurry/sdk/fm;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/gr;->h:Lcom/flurry/sdk/fm;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 51
    const-class v0, Lcom/flurry/sdk/gr;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gr;-><init>(Ljava/lang/ClassLoader;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;)V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/flurry/sdk/fs;-><init>()V

    .line 78
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/gr;->f:Ljava/util/Map;

    .line 133
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/gr;->i:Ljava/util/WeakHashMap;

    .line 55
    iput-object p1, p0, Lcom/flurry/sdk/gr;->b:Ljava/lang/ClassLoader;

    .line 56
    return-void
.end method

.method public static a(Ljava/lang/Class;Lcom/flurry/sdk/fm;)Ljava/lang/Object;
    .locals 3

    .prologue
    .line 241
    const-class v0, Lcom/flurry/sdk/gr$a;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    .line 244
    :try_start_0
    sget-object v0, Lcom/flurry/sdk/gr;->e:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 245
    if-nez v0, :cond_0

    .line 246
    if-eqz v2, :cond_1

    sget-object v0, Lcom/flurry/sdk/gr;->d:[Ljava/lang/Class;

    :goto_0
    invoke-virtual {p0, v0}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 247
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 248
    sget-object v1, Lcom/flurry/sdk/gr;->e:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    move-object v1, v0

    .line 250
    if-eqz v2, :cond_2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v0, v2

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 254
    return-object v0

    .line 246
    :cond_1
    sget-object v0, Lcom/flurry/sdk/gr;->c:[Ljava/lang/Class;

    goto :goto_0

    .line 250
    :cond_2
    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 251
    :catch_0
    move-exception v0

    .line 252
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static b()Lcom/flurry/sdk/gr;
    .locals 1

    .prologue
    .line 64
    sget-object v0, Lcom/flurry/sdk/gr;->a:Lcom/flurry/sdk/gr;

    return-object v0
.end method

.method public static c(Lcom/flurry/sdk/fm;)Ljava/lang/String;
    .locals 4

    .prologue
    .line 125
    invoke-virtual {p0}, Lcom/flurry/sdk/fm;->f()Ljava/lang/String;

    move-result-object v2

    .line 126
    invoke-virtual {p0}, Lcom/flurry/sdk/fm;->d()Ljava/lang/String;

    move-result-object v1

    .line 127
    if-eqz v2, :cond_0

    const-string v0, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move-object v0, v1

    .line 130
    :goto_0
    return-object v0

    .line 129
    :cond_1
    const-string v0, "$"

    invoke-virtual {v2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, ""

    .line 130
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 129
    :cond_2
    const-string v0, "."

    goto :goto_1
.end method


# virtual methods
.method protected a(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm;Z)I
    .locals 2

    .prologue
    .line 227
    sget-object v0, Lcom/flurry/sdk/gr$2;->a:[I

    invoke-virtual {p3}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 232
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm;Z)I

    move-result v0

    :goto_0
    return v0

    .line 229
    :pswitch_0
    instance-of v0, p1, Ljava/lang/Enum;

    if-eqz v0, :cond_0

    .line 230
    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    check-cast p2, Ljava/lang/Enum;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_0

    .line 227
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public a(Ljava/lang/reflect/Type;)Lcom/flurry/sdk/fm;
    .locals 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/flurry/sdk/gr;->i:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    .line 139
    if-nez v0, :cond_0

    .line 140
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/gr;->a(Ljava/lang/reflect/Type;Ljava/util/Map;)Lcom/flurry/sdk/fm;

    move-result-object v0

    .line 141
    iget-object v1, p0, Lcom/flurry/sdk/gr;->i:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    :cond_0
    return-object v0
.end method

.method protected a(Ljava/lang/reflect/Type;Ljava/util/Map;)Lcom/flurry/sdk/fm;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/fm;",
            ">;)",
            "Lcom/flurry/sdk/fm;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 150
    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_0

    const-class v1, Ljava/lang/CharSequence;

    move-object v0, p1

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    sget-object v0, Lcom/flurry/sdk/fm$v;->g:Lcom/flurry/sdk/fm$v;

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$v;)Lcom/flurry/sdk/fm;

    move-result-object v0

    .line 204
    :goto_0
    return-object v0

    .line 153
    :cond_0
    const-class v0, Ljava/nio/ByteBuffer;

    if-ne p1, v0, :cond_1

    .line 154
    sget-object v0, Lcom/flurry/sdk/fm$v;->h:Lcom/flurry/sdk/fm$v;

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$v;)Lcom/flurry/sdk/fm;

    move-result-object v0

    goto :goto_0

    .line 155
    :cond_1
    const-class v0, Ljava/lang/Integer;

    if-eq p1, v0, :cond_2

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_3

    .line 156
    :cond_2
    sget-object v0, Lcom/flurry/sdk/fm$v;->i:Lcom/flurry/sdk/fm$v;

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$v;)Lcom/flurry/sdk/fm;

    move-result-object v0

    goto :goto_0

    .line 157
    :cond_3
    const-class v0, Ljava/lang/Long;

    if-eq p1, v0, :cond_4

    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_5

    .line 158
    :cond_4
    sget-object v0, Lcom/flurry/sdk/fm$v;->j:Lcom/flurry/sdk/fm$v;

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$v;)Lcom/flurry/sdk/fm;

    move-result-object v0

    goto :goto_0

    .line 159
    :cond_5
    const-class v0, Ljava/lang/Float;

    if-eq p1, v0, :cond_6

    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_7

    .line 160
    :cond_6
    sget-object v0, Lcom/flurry/sdk/fm$v;->k:Lcom/flurry/sdk/fm$v;

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$v;)Lcom/flurry/sdk/fm;

    move-result-object v0

    goto :goto_0

    .line 161
    :cond_7
    const-class v0, Ljava/lang/Double;

    if-eq p1, v0, :cond_8

    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_9

    .line 162
    :cond_8
    sget-object v0, Lcom/flurry/sdk/fm$v;->l:Lcom/flurry/sdk/fm$v;

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$v;)Lcom/flurry/sdk/fm;

    move-result-object v0

    goto :goto_0

    .line 163
    :cond_9
    const-class v0, Ljava/lang/Boolean;

    if-eq p1, v0, :cond_a

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_b

    .line 164
    :cond_a
    sget-object v0, Lcom/flurry/sdk/fm$v;->m:Lcom/flurry/sdk/fm$v;

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$v;)Lcom/flurry/sdk/fm;

    move-result-object v0

    goto :goto_0

    .line 165
    :cond_b
    const-class v0, Ljava/lang/Void;

    if-eq p1, v0, :cond_c

    sget-object v0, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_d

    .line 166
    :cond_c
    sget-object v0, Lcom/flurry/sdk/fm$v;->n:Lcom/flurry/sdk/fm$v;

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$v;)Lcom/flurry/sdk/fm;

    move-result-object v0

    goto :goto_0

    .line 167
    :cond_d
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_13

    move-object v0, p1

    .line 168
    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    .line 169
    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 170
    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 171
    const-class v2, Ljava/util/Collection;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 172
    array-length v1, v0

    if-eq v1, v4, :cond_e

    .line 173
    new-instance v0, Lcom/flurry/sdk/fl;

    const-string v1, "No array type specified."

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_e
    aget-object v0, v0, v3

    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/gr;->a(Ljava/lang/reflect/Type;Ljava/util/Map;)Lcom/flurry/sdk/fm;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/fm;

    move-result-object v0

    goto/16 :goto_0

    .line 175
    :cond_f
    const-class v2, Ljava/util/Map;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 176
    aget-object v1, v0, v3

    .line 177
    aget-object v0, v0, v4

    .line 178
    instance-of v2, p1, Ljava/lang/Class;

    if-eqz v2, :cond_10

    const-class v2, Ljava/lang/CharSequence;

    check-cast p1, Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_11

    .line 180
    :cond_10
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Map key class not CharSequence: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0

    .line 181
    :cond_11
    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/gr;->a(Ljava/lang/reflect/Type;Ljava/util/Map;)Lcom/flurry/sdk/fm;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/fm;->b(Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/fm;

    move-result-object v0

    goto/16 :goto_0

    .line 183
    :cond_12
    invoke-virtual {p0, v1, p2}, Lcom/flurry/sdk/gr;->a(Ljava/lang/reflect/Type;Ljava/util/Map;)Lcom/flurry/sdk/fm;

    move-result-object v0

    goto/16 :goto_0

    .line 185
    :cond_13
    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_15

    .line 186
    check-cast p1, Ljava/lang/Class;

    .line 187
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 188
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    .line 189
    if-nez v0, :cond_14

    .line 191
    :try_start_0
    const-string v0, "SCHEMA$"

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    check-cast v0, Lcom/flurry/sdk/fm;

    .line 193
    invoke-static {v0}, Lcom/flurry/sdk/gr;->c(Lcom/flurry/sdk/fm;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    .line 195
    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->f()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/fm;->f(Ljava/lang/String;)Lcom/flurry/sdk/fm;
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 203
    :cond_14
    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 198
    :catch_0
    move-exception v0

    .line 199
    new-instance v0, Lcom/flurry/sdk/fk;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not a Specific class: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 200
    :catch_1
    move-exception v0

    .line 201
    new-instance v1, Lcom/flurry/sdk/fk;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 206
    :cond_15
    new-instance v0, Lcom/flurry/sdk/fl;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fl;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/gd;
    .locals 1

    .prologue
    .line 60
    new-instance v0, Lcom/flurry/sdk/gs;

    invoke-direct {v0, p1, p1, p0}, Lcom/flurry/sdk/gs;-><init>(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gr;)V

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/fm;)Ljava/lang/Class;
    .locals 4

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 85
    sget-object v0, Lcom/flurry/sdk/gr$2;->a:[I

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v3

    aget v0, v0, v3

    packed-switch v0, :pswitch_data_0

    .line 119
    new-instance v0, Lcom/flurry/sdk/fk;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :pswitch_0
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v2

    .line 90
    if-nez v2, :cond_0

    .line 118
    :goto_0
    return-object v1

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/gr;->f:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 92
    if-nez v0, :cond_1

    .line 94
    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/gr;->b:Ljava/lang/ClassLoader;

    invoke-static {p1}, Lcom/flurry/sdk/gr;->c(Lcom/flurry/sdk/fm;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 98
    :goto_1
    iget-object v3, p0, Lcom/flurry/sdk/gr;->f:Ljava/util/Map;

    invoke-interface {v3, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    :cond_1
    sget-object v2, Lcom/flurry/sdk/gr;->g:Ljava/lang/Class;

    if-ne v0, v2, :cond_2

    move-object v0, v1

    :cond_2
    move-object v1, v0

    goto :goto_0

    .line 95
    :catch_0
    move-exception v0

    .line 96
    sget-object v0, Lcom/flurry/sdk/gr;->g:Ljava/lang/Class;

    goto :goto_1

    .line 101
    :pswitch_1
    const-class v1, Ljava/util/List;

    goto :goto_0

    .line 102
    :pswitch_2
    const-class v1, Ljava/util/Map;

    goto :goto_0

    .line 104
    :pswitch_3
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->k()Ljava/util/List;

    move-result-object v1

    .line 105
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_4

    sget-object v0, Lcom/flurry/sdk/gr;->h:Lcom/flurry/sdk/fm;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 106
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    sget-object v3, Lcom/flurry/sdk/gr;->h:Lcom/flurry/sdk/fm;

    invoke-virtual {v0, v3}, Lcom/flurry/sdk/fm;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    :goto_2
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/gr;->b(Lcom/flurry/sdk/fm;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    :cond_3
    move v0, v2

    goto :goto_2

    .line 107
    :cond_4
    const-class v1, Ljava/lang/Object;

    goto :goto_0

    .line 109
    :pswitch_4
    const-string v0, "String"

    const-string v1, "avro.java.string"

    invoke-virtual {p1, v1}, Lcom/flurry/sdk/fm;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 110
    const-class v1, Ljava/lang/String;

    goto :goto_0

    .line 111
    :cond_5
    const-class v1, Ljava/lang/CharSequence;

    goto :goto_0

    .line 112
    :pswitch_5
    const-class v1, Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 113
    :pswitch_6
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    goto :goto_0

    .line 114
    :pswitch_7
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    goto :goto_0

    .line 115
    :pswitch_8
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    goto :goto_0

    .line 116
    :pswitch_9
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    goto :goto_0

    .line 117
    :pswitch_a
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    goto/16 :goto_0

    .line 118
    :pswitch_b
    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    goto/16 :goto_0

    .line 85
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method

.method public c(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 259
    invoke-static {}, Lcom/flurry/sdk/gr;->b()Lcom/flurry/sdk/gr;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/gr;->b(Lcom/flurry/sdk/fm;)Ljava/lang/Class;

    move-result-object v0

    .line 260
    if-nez v0, :cond_1

    invoke-super {p0, p1, p2}, Lcom/flurry/sdk/fs;->c(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object p1

    .line 261
    :cond_0
    :goto_0
    return-object p1

    :cond_1
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0, p2}, Lcom/flurry/sdk/gr;->a(Ljava/lang/Class;Lcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_0
.end method

.method public d(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 266
    invoke-static {}, Lcom/flurry/sdk/gr;->b()Lcom/flurry/sdk/gr;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/gr;->b(Lcom/flurry/sdk/fm;)Ljava/lang/Class;

    move-result-object v0

    .line 267
    if-nez v0, :cond_1

    invoke-super {p0, p1, p2}, Lcom/flurry/sdk/fs;->d(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object p1

    .line 268
    :cond_0
    :goto_0
    return-object p1

    :cond_1
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0, p2}, Lcom/flurry/sdk/gr;->a(Ljava/lang/Class;Lcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_0
.end method

.method protected f(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 68
    instance-of v0, p1, Ljava/lang/Enum;

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Lcom/flurry/sdk/fs;->f(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected g(Ljava/lang/Object;)Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 73
    instance-of v0, p1, Ljava/lang/Enum;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/gr;->a(Ljava/lang/reflect/Type;)Lcom/flurry/sdk/fm;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1}, Lcom/flurry/sdk/fs;->g(Ljava/lang/Object;)Lcom/flurry/sdk/fm;

    move-result-object v0

    goto :goto_0
.end method
