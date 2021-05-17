.class public Lcom/playhaven/android/view/FullScreen;
.super Landroid/app/Activity;
.source "FullScreen.java"

# interfaces
.implements Lcom/playhaven/android/view/PlayHavenListener;


# static fields
.field private static final TIMESTAMP:Ljava/lang/String; = "closed.timestamp"


# instance fields
.field private compat:Lcom/playhaven/android/compat/VendorCompat;

.field private result:Landroid/content/Intent;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static callerIsFullscreen(Landroid/content/Context;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 341
    instance-of v3, p0, Landroid/app/Activity;

    if-eqz v3, :cond_1

    move-object v0, p0

    .line 343
    check-cast v0, Landroid/app/Activity;

    .line 345
    .local v0, "originatingActivity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 344
    and-int/lit16 v3, v3, 0x400

    if-eqz v3, :cond_0

    .line 351
    .end local v0    # "originatingActivity":Landroid/app/Activity;
    :goto_0
    return v1

    .restart local v0    # "originatingActivity":Landroid/app/Activity;
    :cond_0
    move v1, v2

    .line 344
    goto :goto_0

    .line 350
    .end local v0    # "originatingActivity":Landroid/app/Activity;
    :cond_1
    const-string v3, "Unable to retrieve window flags without an Activity context."

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v3, v2}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static createIntent(Landroid/content/Context;Lcom/playhaven/android/Placement;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "placement"    # Lcom/playhaven/android/Placement;

    .prologue
    .line 104
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/playhaven/android/view/FullScreen;->createIntent(Landroid/content/Context;Lcom/playhaven/android/Placement;I)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static createIntent(Landroid/content/Context;Lcom/playhaven/android/Placement;I)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "placement"    # Lcom/playhaven/android/Placement;
    .param p2, "displayOptions"    # I

    .prologue
    .line 123
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/playhaven/android/view/FullScreen;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 124
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "placement"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 125
    const-string v1, "displayOptions"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 126
    sget-object v1, Lcom/playhaven/android/PlayHaven$Config;->FullScreen:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v1}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Lcom/playhaven/android/view/FullScreen;->callerIsFullscreen(Landroid/content/Context;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 127
    return-object v0
.end method

.method public static createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "placementTag"    # Ljava/lang/String;

    .prologue
    .line 67
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/playhaven/android/view/FullScreen;->createIntent(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static createIntent(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "placementTag"    # Ljava/lang/String;
    .param p2, "displayOptions"    # I

    .prologue
    .line 86
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/playhaven/android/view/FullScreen;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 87
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "placementTag"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 88
    const-string v1, "displayOptions"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 89
    sget-object v1, Lcom/playhaven/android/PlayHaven$Config;->FullScreen:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v1}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Lcom/playhaven/android/view/FullScreen;->callerIsFullscreen(Landroid/content/Context;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 90
    return-object v0
.end method

.method public static timeElapsed(Landroid/content/Context;J)Z
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "durationMs"    # J

    .prologue
    const-wide/16 v7, 0x0

    const/4 v5, 0x1

    .line 139
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 140
    .local v2, "pref":Landroid/content/SharedPreferences;
    const-string v6, "closed.timestamp"

    invoke-interface {v2, v6, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    .line 141
    .local v3, "timestamp":J
    cmp-long v6, v3, v7

    if-nez v6, :cond_1

    .line 143
    :cond_0
    :goto_0
    return v5

    .line 142
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 143
    .local v0, "now":J
    sub-long v6, v0, v3

    cmp-long v6, v6, p1

    if-gez v6, :cond_0

    const/4 v5, 0x0

    goto :goto_0
.end method


# virtual methods
.method public doResult(ILandroid/content/Intent;Lcom/playhaven/android/view/PlayHavenView;)V
    .locals 12
    .param p1, "resultCode"    # I
    .param p2, "result"    # Landroid/content/Intent;
    .param p3, "view"    # Lcom/playhaven/android/view/PlayHavenView;

    .prologue
    const/4 v11, 0x1

    const/4 v7, 0x0

    .line 305
    if-eqz p3, :cond_0

    .line 307
    const-string v6, "placement"

    invoke-virtual {p3}, Lcom/playhaven/android/view/PlayHavenView;->getPlacement()Lcom/playhaven/android/Placement;

    move-result-object v8

    invoke-virtual {p2, v6, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 308
    const-string v6, "placementTag"

    invoke-virtual {p3}, Lcom/playhaven/android/view/PlayHavenView;->getPlacementTag()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p2, v6, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 309
    const-string v6, "displayOptions"

    invoke-virtual {p3}, Lcom/playhaven/android/view/PlayHavenView;->getDisplayOptions()I

    move-result v8

    invoke-virtual {p2, v6, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 314
    :cond_0
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getIntent()Landroid/content/Intent;

    move-result-object v6

    sget-object v8, Lcom/playhaven/android/push/NotificationBuilder$Keys;->URI:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    invoke-virtual {v8}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 315
    .local v5, "uriString":Ljava/lang/String;
    if-eqz v5, :cond_1

    .line 317
    const-string v6, "Provided URI was: %s"

    new-array v8, v11, [Ljava/lang/Object;

    aput-object v5, v8, v7

    invoke-static {v6, v8}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 318
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 319
    .local v4, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 320
    .local v0, "newIntent":Landroid/content/Intent;
    invoke-virtual {v0, p2}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 323
    const-string v6, "&"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 324
    .local v2, "params":[Ljava/lang/String;
    array-length v8, v2

    move v6, v7

    :goto_0
    if-lt v6, v8, :cond_2

    .line 330
    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/FullScreen;->startActivity(Landroid/content/Intent;)V

    .line 333
    .end local v0    # "newIntent":Landroid/content/Intent;
    .end local v2    # "params":[Ljava/lang/String;
    .end local v4    # "pm":Landroid/content/pm/PackageManager;
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/playhaven/android/view/FullScreen;->setResult(ILandroid/content/Intent;)V

    .line 334
    return-void

    .line 324
    .restart local v0    # "newIntent":Landroid/content/Intent;
    .restart local v2    # "params":[Ljava/lang/String;
    .restart local v4    # "pm":Landroid/content/pm/PackageManager;
    :cond_2
    aget-object v1, v2, v6

    .line 325
    .local v1, "param":Ljava/lang/String;
    const-string v9, "="

    invoke-virtual {v1, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 326
    .local v3, "parts":[Ljava/lang/String;
    array-length v9, v3

    const/4 v10, 0x2

    if-ne v9, v10, :cond_3

    .line 327
    aget-object v9, v3, v7

    aget-object v10, v3, v11

    invoke-virtual {v0, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 324
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
.end method

.method public finish()V
    .locals 5

    .prologue
    .line 241
    iget-object v2, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/playhaven/android/view/FullScreen;->compat:Lcom/playhaven/android/compat/VendorCompat;

    if-eqz v2, :cond_0

    .line 244
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    iput-object v2, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    .line 245
    iget-object v2, p0, Lcom/playhaven/android/view/FullScreen;->compat:Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$ID;->playhaven_activity_view:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v2, v3, v4}, Lcom/playhaven/android/compat/VendorCompat;->getId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ID;)I

    move-result v0

    .line 246
    .local v0, "activityViewId":I
    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/FullScreen;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/playhaven/android/view/PlayHavenView;

    .line 247
    .local v1, "playHavenView":Lcom/playhaven/android/view/PlayHavenView;
    iget-object v2, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    const-string v3, "dismissType"

    sget-object v4, Lcom/playhaven/android/view/PlayHavenView$DismissType;->SelfClose:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 248
    const/4 v2, -0x1

    iget-object v3, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    invoke-virtual {p0, v2, v3, v1}, Lcom/playhaven/android/view/FullScreen;->doResult(ILandroid/content/Intent;Lcom/playhaven/android/view/PlayHavenView;)V

    .line 250
    .end local v0    # "activityViewId":I
    .end local v1    # "playHavenView":Lcom/playhaven/android/view/PlayHavenView;
    :cond_0
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->storeTimestamp()V

    .line 251
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 252
    return-void
.end method

.method public onBackPressed()V
    .locals 5

    .prologue
    .line 260
    iget-object v2, p0, Lcom/playhaven/android/view/FullScreen;->compat:Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$ID;->playhaven_activity_view:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v2, v3, v4}, Lcom/playhaven/android/compat/VendorCompat;->getId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ID;)I

    move-result v0

    .line 261
    .local v0, "activityViewId":I
    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/FullScreen;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/playhaven/android/view/PlayHavenView;

    .line 262
    .local v1, "view":Lcom/playhaven/android/view/PlayHavenView;
    if-eqz v1, :cond_0

    .line 263
    sget-object v2, Lcom/playhaven/android/view/PlayHavenView$DismissType;->BackButton:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    invoke-virtual {v1, v2}, Lcom/playhaven/android/view/PlayHavenView;->dismissView(Lcom/playhaven/android/view/PlayHavenView$DismissType;)V

    .line 264
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 14
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 166
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 169
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getIntent()Landroid/content/Intent;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Intent;->getFlags()I

    move-result v5

    .line 170
    .local v5, "flags":I
    const/high16 v10, 0x100000

    and-int/2addr v10, v5

    if-eqz v10, :cond_1

    .line 172
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->getVendorCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v10

    iput-object v10, p0, Lcom/playhaven/android/view/FullScreen;->compat:Lcom/playhaven/android/compat/VendorCompat;

    .line 173
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->finish()V

    .line 233
    :cond_0
    :goto_0
    return-void

    .line 178
    :cond_1
    const/4 v10, 0x1

    invoke-virtual {p0, v10}, Lcom/playhaven/android/view/FullScreen;->requestWindowFeature(I)Z

    .line 180
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->getVendorCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v10

    iput-object v10, p0, Lcom/playhaven/android/view/FullScreen;->compat:Lcom/playhaven/android/compat/VendorCompat;

    .line 182
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getIntent()Landroid/content/Intent;

    move-result-object v10

    sget-object v11, Lcom/playhaven/android/PlayHaven$Config;->FullScreen:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v11}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    invoke-virtual {v10, v11, v12}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 183
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getWindow()Landroid/view/Window;

    move-result-object v10

    const/16 v11, 0x400

    invoke-virtual {v10, v11}, Landroid/view/Window;->addFlags(I)V

    .line 186
    :cond_2
    iget-object v10, p0, Lcom/playhaven/android/view/FullScreen;->compat:Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    sget-object v12, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_activity:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    invoke-virtual {v10, v11, v12}, Lcom/playhaven/android/compat/VendorCompat;->getLayoutId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$LAYOUT;)I

    move-result v1

    .line 187
    .local v1, "contentViewId":I
    invoke-virtual {p0, v1}, Lcom/playhaven/android/view/FullScreen;->setContentView(I)V

    .line 189
    iget-object v10, p0, Lcom/playhaven/android/view/FullScreen;->compat:Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    sget-object v12, Lcom/playhaven/android/compat/VendorCompat$ID;->playhaven_activity_view:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v10, v11, v12}, Lcom/playhaven/android/compat/VendorCompat;->getId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ID;)I

    move-result v0

    .line 190
    .local v0, "activityViewId":I
    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/FullScreen;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/playhaven/android/view/PlayHavenView;

    .line 191
    .local v9, "playHavenView":Lcom/playhaven/android/view/PlayHavenView;
    invoke-virtual {v9, p0}, Lcom/playhaven/android/view/PlayHavenView;->setPlayHavenListener(Lcom/playhaven/android/view/PlayHavenListener;)V

    .line 194
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getIntent()Landroid/content/Intent;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 195
    .local v2, "dataUri":Landroid/net/Uri;
    if-eqz v2, :cond_4

    .line 197
    invoke-virtual {v2}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v6

    .line 198
    .local v6, "path":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v10

    const/4 v11, 0x1

    if-ne v10, v11, :cond_3

    .line 200
    const-string v10, "path[0]: %s"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-interface {v6, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Lcom/playhaven/android/PlayHaven;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 204
    :cond_3
    :try_start_0
    const-string v10, "displayOptions"

    invoke-virtual {v2, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/playhaven/android/view/PlayHavenView;->setDisplayOptions(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    :goto_1
    const-string v10, "placementTag"

    invoke-virtual {v2, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/playhaven/android/view/PlayHavenView;->setPlacementTag(Ljava/lang/String;)V

    .line 212
    .end local v6    # "path":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->getIntent()Landroid/content/Intent;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    .line 213
    .local v4, "extras":Landroid/os/Bundle;
    if-eqz v4, :cond_0

    .line 215
    const-string v10, "displayOptions"

    invoke-virtual {v4, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/playhaven/android/view/PlayHavenView;->setDisplayOptions(I)V

    .line 217
    const-string v10, "placement"

    invoke-virtual {v4, v10}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    check-cast v7, Lcom/playhaven/android/Placement;

    .line 218
    .local v7, "pl":Lcom/playhaven/android/Placement;
    if-eqz v7, :cond_5

    .line 220
    invoke-virtual {v9, v7}, Lcom/playhaven/android/view/PlayHavenView;->setPlacement(Lcom/playhaven/android/Placement;)V

    goto/16 :goto_0

    .line 222
    :cond_5
    const-string v10, "placementTag"

    invoke-virtual {v4, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 223
    .local v8, "plId":Ljava/lang/String;
    if-eqz v8, :cond_6

    .line 225
    invoke-virtual {v9, v8}, Lcom/playhaven/android/view/PlayHavenView;->setPlacementTag(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 228
    :cond_6
    new-instance v3, Lcom/playhaven/android/PlayHavenException;

    const-string v10, "FullScreen was launched without a valid placement or tag."

    invoke-direct {v3, v10}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;)V

    .line 229
    .local v3, "e":Lcom/playhaven/android/PlayHavenException;
    invoke-virtual {p0, v9, v3}, Lcom/playhaven/android/view/FullScreen;->viewFailed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/PlayHavenException;)V

    goto/16 :goto_0

    .line 205
    .end local v3    # "e":Lcom/playhaven/android/PlayHavenException;
    .end local v4    # "extras":Landroid/os/Bundle;
    .end local v7    # "pl":Lcom/playhaven/android/Placement;
    .end local v8    # "plId":Ljava/lang/String;
    .restart local v6    # "path":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v10

    goto :goto_1
.end method

.method protected storeTimestamp()V
    .locals 5

    .prologue
    .line 153
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 154
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 155
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "closed.timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 156
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 157
    return-void
.end method

.method public viewDismissed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/view/PlayHavenView$DismissType;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Lcom/playhaven/android/view/PlayHavenView;
    .param p2, "dismissType"    # Lcom/playhaven/android/view/PlayHavenView$DismissType;
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    .line 292
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iput-object v0, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    .line 293
    iget-object v0, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    const-string v1, "dismissType"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 294
    if-eqz p3, :cond_0

    .line 296
    iget-object v0, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    const-string v1, "data"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 299
    :cond_0
    const/4 v0, -0x1

    iget-object v1, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1, p1}, Lcom/playhaven/android/view/FullScreen;->doResult(ILandroid/content/Intent;Lcom/playhaven/android/view/PlayHavenView;)V

    .line 300
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->finish()V

    .line 301
    return-void
.end method

.method public viewFailed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/PlayHavenException;)V
    .locals 3
    .param p1, "view"    # Lcom/playhaven/android/view/PlayHavenView;
    .param p2, "exception"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 275
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iput-object v0, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    .line 276
    iget-object v0, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    const-string v1, "dismissType"

    sget-object v2, Lcom/playhaven/android/view/PlayHavenView$DismissType;->SelfClose:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 277
    iget-object v0, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    const-string v1, "exception"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 278
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/playhaven/android/view/FullScreen;->result:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1, p1}, Lcom/playhaven/android/view/FullScreen;->doResult(ILandroid/content/Intent;Lcom/playhaven/android/view/PlayHavenView;)V

    .line 279
    invoke-virtual {p0}, Lcom/playhaven/android/view/FullScreen;->finish()V

    .line 280
    return-void
.end method
