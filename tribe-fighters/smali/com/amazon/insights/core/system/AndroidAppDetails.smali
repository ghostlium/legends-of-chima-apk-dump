.class public Lcom/amazon/insights/core/system/AndroidAppDetails;
.super Ljava/lang/Object;
.source "AndroidAppDetails.java"

# interfaces
.implements Lcom/amazon/insights/core/system/AppDetails;


# static fields
.field private static logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private applicationContext:Landroid/content/Context;

.field private packageInfo:Landroid/content/pm/PackageInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-class v0, Lcom/amazon/insights/core/system/AndroidAppDetails;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/core/system/AndroidAppDetails;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->applicationContext:Landroid/content/Context;

    .line 21
    :try_start_0
    iget-object v1, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->applicationContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->applicationContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->packageInfo:Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    :goto_0
    return-void

    .line 22
    :catch_0
    move-exception v0

    .line 23
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v1, Lcom/amazon/insights/core/system/AndroidAppDetails;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to get details for package "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->applicationContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->w(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public packageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->packageInfo:Landroid/content/pm/PackageInfo;

    if-eqz v0, :cond_0

    .line 33
    iget-object v0, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->packageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 36
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public signatures()[Ljava/lang/String;
    .locals 4

    .prologue
    .line 68
    iget-object v3, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->packageInfo:Landroid/content/pm/PackageInfo;

    if-eqz v3, :cond_0

    .line 69
    iget-object v3, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->packageInfo:Landroid/content/pm/PackageInfo;

    iget-object v1, v3, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 70
    .local v1, "sigs":[Landroid/content/pm/Signature;
    array-length v3, v1

    new-array v2, v3, [Ljava/lang/String;

    .line 71
    .local v2, "strSigs":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_1

    .line 72
    aget-object v3, v1, v0

    invoke-virtual {v3}, Landroid/content/pm/Signature;->toCharsString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    .line 71
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 78
    .end local v0    # "i":I
    .end local v1    # "sigs":[Landroid/content/pm/Signature;
    .end local v2    # "strSigs":[Ljava/lang/String;
    :cond_0
    const/4 v2, 0x0

    :cond_1
    return-object v2
.end method

.method public versionCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->packageInfo:Landroid/content/pm/PackageInfo;

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->packageInfo:Landroid/content/pm/PackageInfo;

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 60
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public versionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->packageInfo:Landroid/content/pm/PackageInfo;

    if-eqz v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/amazon/insights/core/system/AndroidAppDetails;->packageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 48
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
