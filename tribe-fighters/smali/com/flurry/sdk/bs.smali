.class public final Lcom/flurry/sdk/bs;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Ljava/lang/String;

.field private static final b:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/util/SparseIntArray;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/flurry/sdk/bs;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/bs;->a:Ljava/lang/String;

    .line 25
    invoke-static {}, Lcom/flurry/sdk/bs;->c()Landroid/util/SparseArray;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/bs;->b:Landroid/util/SparseArray;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()I
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x7

    return v0
.end method

.method public static a(Landroid/app/Activity;II)I
    .locals 2

    .prologue
    .line 157
    const/4 v1, -0x1

    .line 158
    if-nez p0, :cond_0

    .line 167
    :goto_0
    return v1

    .line 162
    :cond_0
    sget-object v0, Lcom/flurry/sdk/bs;->b:Landroid/util/SparseArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseIntArray;

    .line 163
    if-eqz v0, :cond_1

    .line 164
    invoke-virtual {v0, p1, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    :goto_1
    move v1, v0

    .line 167
    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1
.end method

.method public static a(Landroid/content/pm/ActivityInfo;)I
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0xd
    .end annotation

    .prologue
    .line 126
    if-nez p0, :cond_1

    .line 127
    const/4 v0, 0x0

    .line 136
    :cond_0
    :goto_0
    return v0

    .line 130
    :cond_1
    iget v0, p0, Landroid/content/pm/ActivityInfo;->configChanges:I

    .line 131
    iget-object v1, p0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    const/16 v2, 0xd

    if-ge v1, v2, :cond_0

    .line 132
    or-int/lit16 v0, v0, 0xc00

    goto :goto_0
.end method

.method public static a(Landroid/app/Activity;)Landroid/content/pm/ActivityInfo;
    .locals 2

    .prologue
    .line 100
    const/4 v0, 0x0

    .line 102
    if-nez p0, :cond_0

    .line 106
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/bs;->a(Landroid/content/pm/PackageManager;Landroid/content/ComponentName;)Landroid/content/pm/ActivityInfo;

    move-result-object v0

    goto :goto_0
.end method

.method public static a(Landroid/content/pm/PackageManager;Landroid/content/ComponentName;)Landroid/content/pm/ActivityInfo;
    .locals 5

    .prologue
    .line 84
    const/4 v0, 0x0

    .line 86
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 96
    :cond_0
    :goto_0
    return-object v0

    .line 91
    :cond_1
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, p1, v1}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 92
    :catch_0
    move-exception v1

    .line 93
    const/4 v1, 0x5

    sget-object v2, Lcom/flurry/sdk/bs;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cannot find info for activity: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static a(Landroid/app/Activity;I)V
    .locals 0

    .prologue
    .line 28
    if-eqz p0, :cond_0

    .line 29
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 31
    :cond_0
    return-void
.end method

.method public static a(Landroid/app/Activity;IZ)Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, -0x1

    .line 51
    if-nez p0, :cond_1

    move v1, v2

    .line 79
    :cond_0
    :goto_0
    return v1

    .line 58
    :cond_1
    invoke-static {p0}, Lcom/flurry/sdk/bs;->b(Landroid/app/Activity;)Z

    move-result v0

    .line 59
    if-nez v0, :cond_3

    .line 61
    invoke-static {p0, p1}, Lcom/flurry/sdk/bs;->b(Landroid/app/Activity;I)I

    move-result v0

    .line 63
    if-ne v3, v0, :cond_2

    .line 64
    const/4 v0, 0x5

    sget-object v1, Lcom/flurry/sdk/bs;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cannot set requested orientation without restarting activity, requestedOrientation = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 67
    sget-object v0, Lcom/flurry/sdk/bs;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot set requested orientation without restarting activity. It is recommended to add keyboardHidden|orientation|screenSize for android:configChanges attribute for activity: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    move v1, v2

    .line 70
    goto :goto_0

    :cond_2
    move p1, v0

    move p2, v1

    .line 74
    :cond_3
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 75
    if-nez p2, :cond_0

    .line 76
    invoke-virtual {p0, v3}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_0
.end method

.method public static b()I
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x6

    return v0
.end method

.method public static b(Landroid/app/Activity;I)I
    .locals 1

    .prologue
    .line 141
    if-nez p0, :cond_0

    .line 142
    const/4 v0, -0x1

    .line 145
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    invoke-static {p0, p1, v0}, Lcom/flurry/sdk/bs;->a(Landroid/app/Activity;II)I

    move-result v0

    goto :goto_0
.end method

.method public static b(Landroid/app/Activity;)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 110
    invoke-static {p0}, Lcom/flurry/sdk/bs;->a(Landroid/app/Activity;)Landroid/content/pm/ActivityInfo;

    move-result-object v1

    .line 111
    invoke-static {v1}, Lcom/flurry/sdk/bs;->a(Landroid/content/pm/ActivityInfo;)I

    move-result v1

    .line 113
    and-int/lit16 v2, v1, 0x80

    if-nez v2, :cond_1

    .line 121
    :cond_0
    :goto_0
    return v0

    .line 117
    :cond_1
    and-int/lit16 v1, v1, 0x400

    if-eqz v1, :cond_0

    .line 121
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static c(Landroid/app/Activity;I)I
    .locals 1

    .prologue
    .line 151
    const/4 v0, -0x1

    invoke-static {p0, v0, p1}, Lcom/flurry/sdk/bs;->a(Landroid/app/Activity;II)I

    move-result v0

    return v0
.end method

.method private static c()Landroid/util/SparseArray;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/util/SparseIntArray;",
            ">;"
        }
    .end annotation

    .prologue
    .line 171
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 172
    const/4 v1, 0x1

    invoke-static {}, Lcom/flurry/sdk/bs;->d()Landroid/util/SparseIntArray;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 173
    const/4 v1, 0x2

    invoke-static {}, Lcom/flurry/sdk/bs;->e()Landroid/util/SparseIntArray;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 174
    return-object v0
.end method

.method private static d()Landroid/util/SparseIntArray;
    .locals 7

    .prologue
    const/16 v6, 0x9

    const/4 v5, 0x5

    const/4 v4, 0x1

    const/4 v3, 0x7

    .line 178
    invoke-static {}, Lcom/flurry/sdk/bs;->a()I

    move-result v0

    .line 180
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    .line 181
    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 182
    const/4 v2, 0x2

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 183
    const/4 v2, 0x3

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 184
    const/4 v2, 0x4

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 186
    invoke-virtual {v1, v4, v4}, Landroid/util/SparseIntArray;->put(II)V

    .line 187
    invoke-virtual {v1, v5, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 188
    invoke-virtual {v1, v3, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 190
    invoke-virtual {v1, v6, v6}, Landroid/util/SparseIntArray;->put(II)V

    .line 192
    const/16 v0, 0xa

    invoke-virtual {v1, v0, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 194
    return-object v1
.end method

.method private static e()Landroid/util/SparseIntArray;
    .locals 7

    .prologue
    const/16 v6, 0x8

    const/4 v5, 0x5

    const/4 v4, 0x0

    const/4 v3, 0x6

    .line 198
    invoke-static {}, Lcom/flurry/sdk/bs;->b()I

    move-result v0

    .line 200
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    .line 201
    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 202
    const/4 v2, 0x2

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 203
    const/4 v2, 0x3

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 204
    const/4 v2, 0x4

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 206
    invoke-virtual {v1, v4, v4}, Landroid/util/SparseIntArray;->put(II)V

    .line 208
    invoke-virtual {v1, v5, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 209
    invoke-virtual {v1, v3, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 211
    invoke-virtual {v1, v6, v6}, Landroid/util/SparseIntArray;->put(II)V

    .line 213
    const/16 v0, 0xa

    invoke-virtual {v1, v0, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 215
    return-object v1
.end method
