.class public Lcom/playhaven/android/push/PushReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PushReceiver.java"

# interfaces
.implements Lcom/playhaven/android/PlacementListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/push/PushReceiver$PushParams;,
        Lcom/playhaven/android/push/PushReceiver$UriTypes;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$playhaven$android$push$PushReceiver$UriTypes:[I


# instance fields
.field protected mBundle:Landroid/os/Bundle;

.field protected mContext:Landroid/content/Context;


# direct methods
.method static synthetic $SWITCH_TABLE$com$playhaven$android$push$PushReceiver$UriTypes()[I
    .locals 3

    .prologue
    .line 40
    sget-object v0, Lcom/playhaven/android/push/PushReceiver;->$SWITCH_TABLE$com$playhaven$android$push$PushReceiver$UriTypes:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/playhaven/android/push/PushReceiver$UriTypes;->values()[Lcom/playhaven/android/push/PushReceiver$UriTypes;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ACTIVITY:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    invoke-virtual {v1}, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_4

    :goto_1
    :try_start_1
    sget-object v1, Lcom/playhaven/android/push/PushReceiver$UriTypes;->CUSTOM:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    invoke-virtual {v1}, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_3

    :goto_2
    :try_start_2
    sget-object v1, Lcom/playhaven/android/push/PushReceiver$UriTypes;->DEFAULT:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    invoke-virtual {v1}, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :goto_3
    :try_start_3
    sget-object v1, Lcom/playhaven/android/push/PushReceiver$UriTypes;->INVALID:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    invoke-virtual {v1}, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_1

    :goto_4
    :try_start_4
    sget-object v1, Lcom/playhaven/android/push/PushReceiver$UriTypes;->PLACEMENT:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    invoke-virtual {v1}, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_0

    :goto_5
    sput-object v0, Lcom/playhaven/android/push/PushReceiver;->$SWITCH_TABLE$com$playhaven$android$push$PushReceiver$UriTypes:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_5

    :catch_1
    move-exception v1

    goto :goto_4

    :catch_2
    move-exception v1

    goto :goto_3

    :catch_3
    move-exception v1

    goto :goto_2

    :catch_4
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static validatePushKeys(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 6
    .param p0, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 275
    invoke-static {}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->values()[Lcom/playhaven/android/push/NotificationBuilder$Keys;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v3, :cond_0

    .line 283
    return-object p0

    .line 275
    :cond_0
    aget-object v0, v2, v1

    .line 276
    .local v0, "item":Lcom/playhaven/android/push/NotificationBuilder$Keys;
    invoke-virtual {v0}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 277
    invoke-virtual {v0}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 278
    invoke-virtual {v0}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    invoke-virtual {v0}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 275
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public checkUri(Landroid/net/Uri;Landroid/content/Context;)Lcom/playhaven/android/push/PushReceiver$UriTypes;
    .locals 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 235
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 236
    .local v1, "host":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    .line 238
    .local v3, "scheme":Ljava/lang/String;
    if-nez v1, :cond_0

    if-eqz v3, :cond_1

    :cond_0
    const-string v5, ""

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, ""

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 239
    :cond_1
    const-string v5, "Invalid URI, host or scheme is null: %s."

    new-array v6, v8, [Ljava/lang/Object;

    aput-object p1, v6, v7

    invoke-static {v5, v6}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 240
    sget-object v5, Lcom/playhaven/android/push/PushReceiver$UriTypes;->INVALID:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    .line 267
    :goto_0
    return-object v5

    .line 243
    :cond_2
    const-string v5, "playhaven"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    const-string v5, "com.playhaven.android"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 244
    const-string v5, "activity"

    invoke-virtual {p1, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 245
    sget-object v5, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ACTIVITY:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    goto :goto_0

    .line 247
    :cond_3
    const-string v5, "placement"

    invoke-virtual {p1, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 248
    sget-object v5, Lcom/playhaven/android/push/PushReceiver$UriTypes;->PLACEMENT:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    goto :goto_0

    .line 250
    :cond_4
    const-string v5, "content_id"

    invoke-virtual {p1, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 251
    sget-object v5, Lcom/playhaven/android/push/PushReceiver$UriTypes;->PLACEMENT:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    goto :goto_0

    .line 253
    :cond_5
    sget-object v5, Lcom/playhaven/android/push/PushReceiver$UriTypes;->DEFAULT:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    goto :goto_0

    .line 258
    :cond_6
    const/4 v2, 0x0

    .line 260
    .local v2, "info":Landroid/content/pm/ResolveInfo;
    :try_start_0
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v5, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v4

    .line 261
    .local v4, "testIntent":Landroid/content/Intent;
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v4, v6}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 267
    if-nez v2, :cond_7

    sget-object v5, Lcom/playhaven/android/push/PushReceiver$UriTypes;->INVALID:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    goto :goto_0

    .line 262
    .end local v4    # "testIntent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 263
    .local v0, "e":Ljava/lang/Exception;
    const-string v5, "Nothing registered for %s"

    new-array v6, v8, [Ljava/lang/Object;

    aput-object p1, v6, v7

    invoke-static {v5, v6}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 264
    sget-object v5, Lcom/playhaven/android/push/PushReceiver$UriTypes;->INVALID:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    goto :goto_0

    .line 267
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v4    # "testIntent":Landroid/content/Intent;
    :cond_7
    sget-object v5, Lcom/playhaven/android/push/PushReceiver$UriTypes;->CUSTOM:Lcom/playhaven/android/push/PushReceiver$UriTypes;

    goto :goto_0
.end method

.method public contentDismissed(Lcom/playhaven/android/Placement;Lcom/playhaven/android/view/PlayHavenView$DismissType;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "placement"    # Lcom/playhaven/android/Placement;
    .param p2, "dismissType"    # Lcom/playhaven/android/view/PlayHavenView$DismissType;
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    .line 91
    const-string v0, "Placement dismissed with type %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 92
    return-void
.end method

.method public contentFailed(Lcom/playhaven/android/Placement;Lcom/playhaven/android/PlayHavenException;)V
    .locals 3
    .param p1, "placement"    # Lcom/playhaven/android/Placement;
    .param p2, "e"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 84
    const-string v0, "contentFailed() for placement \"%s\""

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    if-nez p1, :cond_0

    .end local p1    # "placement":Lcom/playhaven/android/Placement;
    :goto_0
    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 85
    invoke-static {p2}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/Throwable;)V

    .line 86
    return-void

    .line 84
    .restart local p1    # "placement":Lcom/playhaven/android/Placement;
    :cond_0
    invoke-virtual {p1}, Lcom/playhaven/android/Placement;->getPlacementTag()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public contentLoaded(Lcom/playhaven/android/Placement;)V
    .locals 9
    .param p1, "placement"    # Lcom/playhaven/android/Placement;

    .prologue
    .line 62
    new-instance v2, Landroid/content/Intent;

    iget-object v6, p0, Lcom/playhaven/android/push/PushReceiver;->mContext:Landroid/content/Context;

    const-class v7, Lcom/playhaven/android/push/PushReceiver;

    invoke-direct {v2, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 63
    .local v2, "newIntent":Landroid/content/Intent;
    const-string v6, "placement"

    invoke-virtual {v2, v6, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 64
    iget-object v6, p0, Lcom/playhaven/android/push/PushReceiver;->mBundle:Landroid/os/Bundle;

    invoke-virtual {v2, v6}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 65
    sget-object v6, Lcom/playhaven/android/push/NotificationBuilder$Keys;->URI:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    invoke-virtual {v6}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/playhaven/android/push/PushReceiver;->mBundle:Landroid/os/Bundle;

    sget-object v8, Lcom/playhaven/android/push/NotificationBuilder$Keys;->URI:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    invoke-virtual {v8}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 67
    iget-object v6, p0, Lcom/playhaven/android/push/PushReceiver;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v7

    const/4 v8, 0x0

    invoke-static {v6, v7, v2, v8}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 68
    .local v4, "pendingIntent":Landroid/app/PendingIntent;
    new-instance v6, Lcom/playhaven/android/push/NotificationBuilder;

    iget-object v7, p0, Lcom/playhaven/android/push/PushReceiver;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7}, Lcom/playhaven/android/push/NotificationBuilder;-><init>(Landroid/content/Context;)V

    iget-object v7, p0, Lcom/playhaven/android/push/PushReceiver;->mBundle:Landroid/os/Bundle;

    invoke-virtual {v6, v7, v4}, Lcom/playhaven/android/push/NotificationBuilder;->makeNotification(Landroid/os/Bundle;Landroid/app/PendingIntent;)Landroid/app/Notification;

    move-result-object v3

    .line 69
    .local v3, "notification":Landroid/app/Notification;
    iget-object v6, p0, Lcom/playhaven/android/push/PushReceiver;->mContext:Landroid/content/Context;

    const-string v7, "notification"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 74
    .local v1, "manager":Landroid/app/NotificationManager;
    :try_start_0
    check-cast p1, Lcom/playhaven/android/PushPlacement;

    .end local p1    # "placement":Lcom/playhaven/android/Placement;
    invoke-virtual {p1}, Lcom/playhaven/android/PushPlacement;->getMessageId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 79
    .local v5, "requestCode":I
    :goto_0
    invoke-virtual {v1, v5, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 80
    return-void

    .line 75
    .end local v5    # "requestCode":I
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v5

    .restart local v5    # "requestCode":I
    goto :goto_0
.end method

.method public getMessageId(Landroid/content/Intent;)I
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 221
    :try_start_0
    sget-object v2, Lcom/playhaven/android/push/PushReceiver$PushParams;->message_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

    invoke-virtual {v2}, Lcom/playhaven/android/push/PushReceiver$PushParams;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 222
    .local v1, "messageId":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 224
    .end local v1    # "messageId":Ljava/lang/String;
    :goto_0
    return v2

    .line 223
    :catch_0
    move-exception v0

    .line 224
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_0
.end method

.method public interpretPush(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 12
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v11, 0x0

    .line 159
    iput-object p2, p0, Lcom/playhaven/android/push/PushReceiver;->mContext:Landroid/content/Context;

    .line 160
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    invoke-static {v9}, Lcom/playhaven/android/push/PushReceiver;->validatePushKeys(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v9

    iput-object v9, p0, Lcom/playhaven/android/push/PushReceiver;->mBundle:Landroid/os/Bundle;

    .line 162
    iget-object v9, p0, Lcom/playhaven/android/push/PushReceiver;->mBundle:Landroid/os/Bundle;

    sget-object v10, Lcom/playhaven/android/push/NotificationBuilder$Keys;->URI:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    invoke-virtual {v10}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    .line 163
    .local v8, "uri":Landroid/net/Uri;
    const/4 v4, 0x0

    .line 164
    .local v4, "notification":Landroid/app/Notification;
    sget-object v9, Lcom/playhaven/android/push/PushReceiver$PushParams;->message_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

    invoke-virtual {v9}, Lcom/playhaven/android/push/PushReceiver$PushParams;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 166
    .local v2, "messageId":Ljava/lang/String;
    new-instance v3, Landroid/content/Intent;

    const-class v9, Lcom/playhaven/android/push/PushReceiver;

    invoke-direct {v3, p2, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 167
    .local v3, "newIntent":Landroid/content/Intent;
    iget-object v9, p0, Lcom/playhaven/android/push/PushReceiver;->mBundle:Landroid/os/Bundle;

    invoke-virtual {v3, v9}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 168
    iget-object v9, p0, Lcom/playhaven/android/push/PushReceiver;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p1}, Lcom/playhaven/android/push/PushReceiver;->getMessageId(Landroid/content/Intent;)I

    move-result v10

    invoke-static {v9, v10, v3, v11}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    .line 170
    .local v5, "pendingIntent":Landroid/app/PendingIntent;
    invoke-static {}, Lcom/playhaven/android/push/PushReceiver;->$SWITCH_TABLE$com$playhaven$android$push$PushReceiver$UriTypes()[I

    move-result-object v9

    iget-object v10, p0, Lcom/playhaven/android/push/PushReceiver;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v8, v10}, Lcom/playhaven/android/push/PushReceiver;->checkUri(Landroid/net/Uri;Landroid/content/Context;)Lcom/playhaven/android/push/PushReceiver$UriTypes;

    move-result-object v10

    invoke-virtual {v10}, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 203
    :pswitch_0
    const-string v9, "An invalid URI was provided in a push notification: %s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    aput-object v8, v10, v11

    invoke-static {v9, v10}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 207
    :goto_0
    if-eqz v4, :cond_0

    .line 208
    iget-object v9, p0, Lcom/playhaven/android/push/PushReceiver;->mContext:Landroid/content/Context;

    const-string v10, "notification"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 209
    .local v1, "manager":Landroid/app/NotificationManager;
    invoke-virtual {p0, p1}, Lcom/playhaven/android/push/PushReceiver;->getMessageId(Landroid/content/Intent;)I

    move-result v9

    invoke-virtual {v1, v9, v4}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 211
    .end local v1    # "manager":Landroid/app/NotificationManager;
    :cond_0
    return-void

    .line 173
    :pswitch_1
    new-instance v9, Lcom/playhaven/android/push/NotificationBuilder;

    iget-object v10, p0, Lcom/playhaven/android/push/PushReceiver;->mContext:Landroid/content/Context;

    invoke-direct {v9, v10}, Lcom/playhaven/android/push/NotificationBuilder;-><init>(Landroid/content/Context;)V

    iget-object v10, p0, Lcom/playhaven/android/push/PushReceiver;->mBundle:Landroid/os/Bundle;

    invoke-virtual {v9, v10, v5}, Lcom/playhaven/android/push/NotificationBuilder;->makeNotification(Landroid/os/Bundle;Landroid/app/PendingIntent;)Landroid/app/Notification;

    move-result-object v4

    .line 174
    goto :goto_0

    .line 177
    :pswitch_2
    const-string v9, "placement"

    invoke-virtual {v8, v9}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 178
    .local v7, "placementTag":Ljava/lang/String;
    const-string v9, "content_id"

    invoke-virtual {v8, v9}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 180
    .local v0, "contentUnitId":Ljava/lang/String;
    new-instance v6, Lcom/playhaven/android/PushPlacement;

    invoke-direct {v6, v7}, Lcom/playhaven/android/PushPlacement;-><init>(Ljava/lang/String;)V

    .line 181
    .local v6, "placement":Lcom/playhaven/android/PushPlacement;
    invoke-virtual {v6, v2}, Lcom/playhaven/android/PushPlacement;->setMessageId(Ljava/lang/String;)V

    .line 182
    invoke-virtual {v6, v0}, Lcom/playhaven/android/PushPlacement;->setContentUnitId(Ljava/lang/String;)V

    .line 183
    invoke-virtual {v6, p0}, Lcom/playhaven/android/PushPlacement;->setListener(Lcom/playhaven/android/PlacementListener;)V

    .line 184
    iget-object v9, p0, Lcom/playhaven/android/push/PushReceiver;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v9}, Lcom/playhaven/android/PushPlacement;->preload(Landroid/content/Context;)V

    goto :goto_0

    .line 200
    .end local v0    # "contentUnitId":Ljava/lang/String;
    .end local v6    # "placement":Lcom/playhaven/android/PushPlacement;
    .end local v7    # "placementTag":Ljava/lang/String;
    :pswitch_3
    new-instance v9, Lcom/playhaven/android/push/NotificationBuilder;

    iget-object v10, p0, Lcom/playhaven/android/push/PushReceiver;->mContext:Landroid/content/Context;

    invoke-direct {v9, v10}, Lcom/playhaven/android/push/NotificationBuilder;-><init>(Landroid/content/Context;)V

    iget-object v10, p0, Lcom/playhaven/android/push/PushReceiver;->mBundle:Landroid/os/Bundle;

    invoke-virtual {v9, v10, v5}, Lcom/playhaven/android/push/NotificationBuilder;->makeNotification(Landroid/os/Bundle;Landroid/app/PendingIntent;)Landroid/app/Notification;

    move-result-object v4

    .line 201
    goto :goto_0

    .line 170
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 101
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 102
    .local v2, "bundle":Landroid/os/Bundle;
    if-nez v2, :cond_1

    .line 104
    const-string v12, "Received Notification with no extras."

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Object;

    invoke-static {v12, v13}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 152
    :cond_0
    :goto_0
    return-void

    .line 108
    :cond_1
    sget-object v12, Lcom/playhaven/android/push/NotificationBuilder$Keys;->URI:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    invoke-virtual {v12}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    .line 109
    .local v11, "uri":Landroid/net/Uri;
    const/4 v6, 0x0

    .line 110
    .local v6, "nextIntent":Landroid/content/Intent;
    invoke-static {}, Lcom/playhaven/android/push/PushReceiver;->$SWITCH_TABLE$com$playhaven$android$push$PushReceiver$UriTypes()[I

    move-result-object v12

    move-object/from16 v0, p1

    invoke-virtual {p0, v11, v0}, Lcom/playhaven/android/push/PushReceiver;->checkUri(Landroid/net/Uri;Landroid/content/Context;)Lcom/playhaven/android/push/PushReceiver$UriTypes;

    move-result-object v13

    invoke-virtual {v13}, Lcom/playhaven/android/push/PushReceiver$UriTypes;->ordinal()I

    move-result v13

    aget v12, v12, v13

    packed-switch v12, :pswitch_data_0

    .line 136
    :goto_1
    :pswitch_0
    sget-object v12, Lcom/playhaven/android/push/PushReceiver$PushParams;->message_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

    invoke-virtual {v12}, Lcom/playhaven/android/push/PushReceiver$PushParams;->name()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 137
    .local v5, "message_id":Ljava/lang/String;
    const-string v12, "content_id"

    invoke-virtual {v11, v12}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 139
    .local v3, "content_id":Ljava/lang/String;
    new-instance v10, Lcom/playhaven/android/req/PushTrackingRequest;

    move-object/from16 v0, p1

    invoke-direct {v10, v0, v5, v3}, Lcom/playhaven/android/req/PushTrackingRequest;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .local v10, "trackingRequest":Lcom/playhaven/android/req/PushTrackingRequest;
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Lcom/playhaven/android/req/PushTrackingRequest;->send(Landroid/content/Context;)V

    .line 142
    if-eqz v6, :cond_0

    .line 143
    invoke-virtual {v6, v2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 144
    const/high16 v12, 0x10000000

    invoke-virtual {v6, v12}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 146
    :try_start_0
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 147
    :catch_0
    move-exception v4

    .line 148
    .local v4, "e":Ljava/lang/Exception;
    const-string v12, "Unable to launch URI provided from push notification: \"%s\"."

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v11, v13, v14

    invoke-static {v12, v13}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 149
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 114
    .end local v3    # "content_id":Ljava/lang/String;
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "message_id":Ljava/lang/String;
    .end local v10    # "trackingRequest":Lcom/playhaven/android/req/PushTrackingRequest;
    :pswitch_1
    :try_start_1
    const-string v12, "activity"

    invoke-virtual {v11, v12}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 115
    .local v1, "activityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v7, Landroid/content/Intent;

    move-object/from16 v0, p1

    invoke-direct {v7, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v6    # "nextIntent":Landroid/content/Intent;
    .local v7, "nextIntent":Landroid/content/Intent;
    move-object v6, v7

    .line 116
    .end local v7    # "nextIntent":Landroid/content/Intent;
    .restart local v6    # "nextIntent":Landroid/content/Intent;
    goto :goto_1

    .end local v1    # "activityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_1
    move-exception v4

    .line 117
    .local v4, "e":Ljava/lang/ClassNotFoundException;
    invoke-static {v4}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 122
    .end local v4    # "e":Ljava/lang/ClassNotFoundException;
    :pswitch_2
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    .line 123
    .local v9, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v6

    .line 124
    goto :goto_1

    .line 127
    .end local v9    # "pm":Landroid/content/pm/PackageManager;
    :pswitch_3
    const-string v12, "placement"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Lcom/playhaven/android/Placement;

    .line 128
    .local v8, "placement":Lcom/playhaven/android/Placement;
    const/4 v12, 0x1

    move-object/from16 v0, p1

    invoke-static {v0, v8, v12}, Lcom/playhaven/android/view/FullScreen;->createIntent(Landroid/content/Context;Lcom/playhaven/android/Placement;I)Landroid/content/Intent;

    move-result-object v6

    .line 129
    goto :goto_1

    .line 131
    .end local v8    # "placement":Lcom/playhaven/android/Placement;
    :pswitch_4
    new-instance v6, Landroid/content/Intent;

    .end local v6    # "nextIntent":Landroid/content/Intent;
    const-string v12, "android.intent.action.VIEW"

    invoke-direct {v6, v12, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .restart local v6    # "nextIntent":Landroid/content/Intent;
    goto :goto_1

    .line 110
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method
