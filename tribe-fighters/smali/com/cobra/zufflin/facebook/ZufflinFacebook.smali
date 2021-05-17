.class public Lcom/cobra/zufflin/facebook/ZufflinFacebook;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Lcom/cobra/zufflin/facebook/OnDownloadImageComplete;
.implements Lcom/cobra/zufflin/ZufflinActivityListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;
    }
.end annotation


# static fields
.field private static final REAUTH_ACTIVITY_CODE:I = 0x64

.field public static singleton:Lcom/cobra/zufflin/facebook/ZufflinFacebook;


# instance fields
.field private _FileDir:Ljava/io/File;

.field private _FriendsDataJSONObject:Lorg/json/JSONObject;

.field private _friendData:Lcom/facebook/model/GraphObject;

.field private _user:Lcom/facebook/model/GraphUser;

.field private parentBundle:Landroid/os/Bundle;

.field permissionsRequired:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private queuedAction:Ljava/lang/String;

.field private queuedActionParameters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private statusCallback:Lcom/facebook/Session$StatusCallback;

.field private uiHelper:Lcom/facebook/UiLifecycleHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->singleton:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v1, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-direct {v1, p0, v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)V

    iput-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->statusCallback:Lcom/facebook/Session$StatusCallback;

    .line 64
    new-array v1, v5, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "basic_info"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->permissionsRequired:Ljava/util/List;

    .line 116
    sput-object p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->singleton:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    .line 117
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/cobra/zufflin/ZufflinActivity;->addActivityListener(Lcom/cobra/zufflin/ZufflinActivityListener;)V

    .line 119
    iput-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_user:Lcom/facebook/model/GraphUser;

    .line 120
    iput-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_FriendsDataJSONObject:Lorg/json/JSONObject;

    .line 121
    iput-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedAction:Ljava/lang/String;

    .line 122
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    .line 124
    new-instance v1, Lcom/facebook/UiLifecycleHelper;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->statusCallback:Lcom/facebook/Session$StatusCallback;

    invoke-direct {v1, v2, v3}, Lcom/facebook/UiLifecycleHelper;-><init>(Landroid/app/Activity;Lcom/facebook/Session$StatusCallback;)V

    iput-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->uiHelper:Lcom/facebook/UiLifecycleHelper;

    .line 125
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->uiHelper:Lcom/facebook/UiLifecycleHelper;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/cobra/zufflin/ZufflinActivity;->getBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/facebook/UiLifecycleHelper;->onCreate(Landroid/os/Bundle;)V

    .line 130
    new-instance v1, Ljava/io/File;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/cobra/zufflin/ZufflinActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "facebookfiles"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_FileDir:Ljava/io/File;

    .line 131
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_FileDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    .line 135
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 137
    .local v0, "session":Lcom/facebook/Session;
    const-string v1, "FACEBOOK"

    const-string v2, "ZufflinFacebook(): Creating new session"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    if-nez v0, :cond_0

    .line 141
    const-string v1, "FACEBOOK"

    const-string v2, "ZufflinFacebook(): Session was Null!"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    new-instance v0, Lcom/facebook/Session;

    .end local v0    # "session":Lcom/facebook/Session;
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/Session;-><init>(Landroid/content/Context;)V

    .line 143
    .restart local v0    # "session":Lcom/facebook/Session;
    invoke-static {v0}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 148
    :cond_0
    invoke-virtual {v0}, Lcom/facebook/Session;->isOpened()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 150
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->statusCallback:Lcom/facebook/Session$StatusCallback;

    invoke-static {v1, v5, v2}, Lcom/facebook/Session;->openActiveSession(Landroid/app/Activity;ZLcom/facebook/Session$StatusCallback;)Lcom/facebook/Session;

    .line 177
    :goto_0
    return-void

    .line 154
    :cond_1
    invoke-virtual {v0}, Lcom/facebook/Session;->getState()Lcom/facebook/SessionState;

    move-result-object v1

    sget-object v2, Lcom/facebook/SessionState;->CREATED_TOKEN_LOADED:Lcom/facebook/SessionState;

    invoke-virtual {v1, v2}, Lcom/facebook/SessionState;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 156
    new-instance v1, Lcom/facebook/Session$OpenRequest;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/facebook/Session$OpenRequest;-><init>(Landroid/app/Activity;)V

    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->statusCallback:Lcom/facebook/Session$StatusCallback;

    invoke-virtual {v1, v2}, Lcom/facebook/Session$OpenRequest;->setCallback(Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session$OpenRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/Session;->openForRead(Lcom/facebook/Session$OpenRequest;)V

    goto :goto_0

    .line 160
    :cond_2
    const-string v1, "FACEBOOK"

    const-string v2, "ZufflinFacebook(): Token not present, require new login"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    invoke-virtual {p0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnShouldLogout()V

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedAction:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 60
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedAction:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$10(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 508
    invoke-direct/range {p0 .. p5}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->publishFeedDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/util/List;)Z
    .locals 1

    .prologue
    .line 900
    invoke-direct {p0, p1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->getHasPermissions(Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$3(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/util/Map;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$4(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Lcom/facebook/model/GraphUser;)V
    .locals 0

    .prologue
    .line 54
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_user:Lcom/facebook/model/GraphUser;

    return-void
.end method

.method static synthetic access$5(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/io/File;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_FileDir:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$6(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphUser;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_user:Lcom/facebook/model/GraphUser;

    return-object v0
.end method

.method static synthetic access$7(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Lcom/facebook/model/GraphObject;)V
    .locals 0

    .prologue
    .line 55
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_friendData:Lcom/facebook/model/GraphObject;

    return-void
.end method

.method static synthetic access$8(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphObject;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_friendData:Lcom/facebook/model/GraphObject;

    return-object v0
.end method

.method static synthetic access$9(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/UiLifecycleHelper;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->uiHelper:Lcom/facebook/UiLifecycleHelper;

    return-object v0
.end method

.method private getAppKeyHash()V
    .locals 11

    .prologue
    const/4 v6, 0x0

    .line 87
    :try_start_0
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v7

    invoke-virtual {v7}, Lcom/cobra/zufflin/ZufflinActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v8

    invoke-virtual {v8}, Lcom/cobra/zufflin/ZufflinActivity;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x40

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 88
    .local v2, "info":Landroid/content/pm/PackageInfo;
    iget-object v7, v2, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v8, v7

    :goto_0
    if-lt v6, v8, :cond_0

    .line 112
    .end local v2    # "info":Landroid/content/pm/PackageInfo;
    :goto_1
    return-void

    .line 88
    .restart local v2    # "info":Landroid/content/pm/PackageInfo;
    :cond_0
    aget-object v4, v7, v6

    .line 92
    .local v4, "signature":Landroid/content/pm/Signature;
    const-string v9, "SHA"

    invoke-static {v9}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 93
    .local v3, "md":Ljava/security/MessageDigest;
    invoke-virtual {v4}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/security/MessageDigest;->update([B)V

    .line 94
    new-instance v5, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v9

    const/4 v10, 0x0

    invoke-static {v9, v10}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v9

    invoke-direct {v5, v9}, Ljava/lang/String;-><init>([B)V

    .line 95
    .local v5, "something":Ljava/lang/String;
    const-string v9, "FACEBOOK"

    invoke-static {v9, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 88
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 98
    .end local v2    # "info":Landroid/content/pm/PackageInfo;
    .end local v3    # "md":Ljava/security/MessageDigest;
    .end local v4    # "signature":Landroid/content/pm/Signature;
    .end local v5    # "something":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 100
    .local v1, "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v6, "name not found"

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 103
    .end local v1    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v0

    .line 105
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    const-string v6, "no such an algorithm"

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 107
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_2
    move-exception v0

    .line 109
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "exception"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private getHasPermissions(Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 902
    .local p1, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v2

    .line 903
    .local v2, "session":Lcom/facebook/Session;
    invoke-virtual {v2}, Lcom/facebook/Session;->getPermissions()Ljava/util/List;

    move-result-object v0

    .line 904
    .local v0, "current_permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v3, "FACEBOOK"

    const-string v4, "getHasPermissions()"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 906
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-lt v1, v3, :cond_0

    .line 915
    const/4 v3, 0x1

    :goto_1
    return v3

    .line 909
    :cond_0
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 911
    const/4 v3, 0x0

    goto :goto_1

    .line 906
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private publishFeedDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "caption"    # Ljava/lang/String;
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "picture"    # Ljava/lang/String;
    .param p5, "link"    # Ljava/lang/String;

    .prologue
    .line 509
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 510
    .local v1, "params":Landroid/os/Bundle;
    const-string v2, "name"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    const-string v2, "caption"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 512
    const-string v2, "description"

    invoke-virtual {v1, v2, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    const-string v2, "link"

    invoke-virtual {v1, v2, p5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 514
    const-string v2, "picture"

    invoke-virtual {v1, v2, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    new-instance v2, Lcom/facebook/widget/WebDialog$FeedDialogBuilder;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v3

    .line 517
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v4

    .line 516
    invoke-direct {v2, v3, v4, v1}, Lcom/facebook/widget/WebDialog$FeedDialogBuilder;-><init>(Landroid/content/Context;Lcom/facebook/Session;Landroid/os/Bundle;)V

    .line 519
    new-instance v3, Lcom/cobra/zufflin/facebook/ZufflinFacebook$4;

    invoke-direct {v3, p0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$4;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)V

    invoke-virtual {v2, v3}, Lcom/facebook/widget/WebDialog$FeedDialogBuilder;->setOnCompleteListener(Lcom/facebook/widget/WebDialog$OnCompleteListener;)Lcom/facebook/widget/WebDialog$BuilderBase;

    move-result-object v2

    check-cast v2, Lcom/facebook/widget/WebDialog$FeedDialogBuilder;

    .line 561
    invoke-virtual {v2}, Lcom/facebook/widget/WebDialog$FeedDialogBuilder;->build()Lcom/facebook/widget/WebDialog;

    move-result-object v0

    .line 562
    .local v0, "feedDialog":Lcom/facebook/widget/WebDialog;
    invoke-virtual {v0}, Lcom/facebook/widget/WebDialog;->show()V

    .line 563
    return-void
.end method

.method private requestPublishPermissions(Lcom/facebook/Session;Ljava/util/List;)V
    .locals 3
    .param p1, "session"    # Lcom/facebook/Session;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/Session;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 920
    .local p2, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 921
    const-string v1, "FACEBOOK"

    const-string v2, "requestPublishPermissions()"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 923
    new-instance v1, Lcom/facebook/Session$NewPermissionsRequest;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    invoke-direct {v1, v2, p2}, Lcom/facebook/Session$NewPermissionsRequest;-><init>(Landroid/app/Activity;Ljava/util/List;)V

    .line 924
    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Lcom/facebook/Session$NewPermissionsRequest;->setRequestCode(I)Lcom/facebook/Session$NewPermissionsRequest;

    move-result-object v0

    .line 925
    .local v0, "newPermissionsRequest":Lcom/facebook/Session$NewPermissionsRequest;
    invoke-virtual {p1, v0}, Lcom/facebook/Session;->requestNewPublishPermissions(Lcom/facebook/Session$NewPermissionsRequest;)V

    .line 927
    .end local v0    # "newPermissionsRequest":Lcom/facebook/Session$NewPermissionsRequest;
    :cond_0
    return-void
.end method


# virtual methods
.method public FetchFriendsData()V
    .locals 4

    .prologue
    .line 248
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 250
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v2

    new-instance v3, Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;

    invoke-direct {v3, p0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)V

    invoke-static {v2, v3}, Lcom/facebook/Request;->newMyFriendsRequest(Lcom/facebook/Session;Lcom/facebook/Request$GraphUserListCallback;)Lcom/facebook/Request;

    move-result-object v1

    .line 290
    .local v1, "request":Lcom/facebook/Request;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 291
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "fields"

    const-string v3, "id,first_name,last_name"

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    invoke-virtual {v1, v0}, Lcom/facebook/Request;->setParameters(Landroid/os/Bundle;)V

    .line 293
    invoke-virtual {v1}, Lcom/facebook/Request;->executeAsync()Lcom/facebook/RequestAsyncTask;

    .line 295
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "request":Lcom/facebook/Request;
    :cond_0
    return-void
.end method

.method public FetchUserDataByID(Ljava/lang/String;)V
    .locals 2
    .param p1, "userID"    # Ljava/lang/String;

    .prologue
    .line 299
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 305
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    new-instance v1, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;

    invoke-direct {v1, p0, p1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/ZufflinActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 351
    :cond_0
    return-void
.end method

.method public FetchUserPicture(Ljava/lang/String;I)V
    .locals 13
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 355
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v12

    .line 356
    .local v12, "session":Lcom/facebook/Session;
    if-eqz v12, :cond_0

    .line 359
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/Session;->isOpened()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 363
    const/4 v6, 0x0

    .line 364
    .local v6, "userID":Ljava/lang/String;
    const/4 v5, 0x0

    .line 368
    .local v5, "filesavename":Ljava/lang/String;
    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    .line 371
    :try_start_0
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_user:Lcom/facebook/model/GraphUser;

    invoke-interface {v1}, Lcom/facebook/model/GraphUser;->getId()Ljava/lang/String;

    move-result-object v6

    .line 372
    move-object v5, p1

    .line 391
    :goto_0
    if-eqz v6, :cond_0

    .line 393
    new-instance v3, Ljava/net/URL;

    const-string v1, "http://graph.facebook.com/%s/picture?type=square&width=%d&height=%d"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v6, v2, v4

    const/4 v4, 0x1

    const/16 v7, 0xc8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v2, v4

    const/4 v4, 0x2

    const/16 v7, 0xc8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 399
    .local v3, "url":Ljava/net/URL;
    new-instance v0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;

    .line 400
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    .line 403
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_FileDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v2, p0

    move v7, p2

    .line 399
    invoke-direct/range {v0 .. v7}, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;-><init>(Landroid/content/Context;Lcom/cobra/zufflin/facebook/OnDownloadImageComplete;Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 407
    .local v0, "_downloader":Lcom/cobra/zufflin/facebook/DownloadProfilePictures;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1

    .line 423
    .end local v0    # "_downloader":Lcom/cobra/zufflin/facebook/DownloadProfilePictures;
    .end local v3    # "url":Ljava/net/URL;
    .end local v5    # "filesavename":Ljava/lang/String;
    .end local v6    # "userID":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 380
    .restart local v5    # "filesavename":Ljava/lang/String;
    .restart local v6    # "userID":Ljava/lang/String;
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_friendData:Lcom/facebook/model/GraphObject;

    invoke-interface {v1}, Lcom/facebook/model/GraphObject;->getInnerJSONObject()Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "data"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 381
    .local v11, "jsonMainArr":Lorg/json/JSONArray;
    invoke-virtual {v11, p2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 382
    .local v8, "childJSONObject":Lorg/json/JSONObject;
    const-string v1, "id"

    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 383
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ".jpg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v5

    goto :goto_0

    .line 385
    .end local v8    # "childJSONObject":Lorg/json/JSONObject;
    .end local v11    # "jsonMainArr":Lorg/json/JSONArray;
    :catch_0
    move-exception v10

    .line 388
    .local v10, "e1":Lorg/json/JSONException;
    :try_start_2
    invoke-virtual {v10}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 415
    .end local v10    # "e1":Lorg/json/JSONException;
    :catch_1
    move-exception v9

    .line 417
    .local v9, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v9}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_1
.end method

.method public FetchUserPictureByUserID(Ljava/lang/String;)V
    .locals 10
    .param p1, "userid"    # Ljava/lang/String;

    .prologue
    .line 427
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v9

    .line 428
    .local v9, "session":Lcom/facebook/Session;
    if-eqz v9, :cond_0

    .line 431
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/Session;->isOpened()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 436
    move-object v6, p1

    .line 437
    .local v6, "userID":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ".jpg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 443
    .local v5, "filesavename":Ljava/lang/String;
    if-eqz v6, :cond_0

    .line 445
    :try_start_0
    new-instance v3, Ljava/net/URL;

    const-string v1, "http://graph.facebook.com/%s/picture?type=square&width=%d&height=%d"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v6, v2, v4

    const/4 v4, 0x1

    const/16 v7, 0xc8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v2, v4

    const/4 v4, 0x2

    const/16 v7, 0xc8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 450
    .local v3, "url":Ljava/net/URL;
    new-instance v0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;

    .line 451
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    .line 454
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_FileDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    .line 457
    const/4 v7, -0x2

    move-object v2, p0

    .line 450
    invoke-direct/range {v0 .. v7}, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;-><init>(Landroid/content/Context;Lcom/cobra/zufflin/facebook/OnDownloadImageComplete;Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 458
    .local v0, "_downloader":Lcom/cobra/zufflin/facebook/DownloadProfilePictures;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 474
    .end local v0    # "_downloader":Lcom/cobra/zufflin/facebook/DownloadProfilePictures;
    .end local v3    # "url":Ljava/net/URL;
    .end local v5    # "filesavename":Ljava/lang/String;
    .end local v6    # "userID":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 466
    .restart local v5    # "filesavename":Ljava/lang/String;
    .restart local v6    # "userID":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 468
    .local v8, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v8}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_0
.end method

.method public Login()V
    .locals 4

    .prologue
    .line 188
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 189
    .local v0, "session":Lcom/facebook/Session;
    invoke-virtual {v0}, Lcom/facebook/Session;->isOpened()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/facebook/Session;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 191
    new-instance v1, Lcom/facebook/Session$OpenRequest;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/facebook/Session$OpenRequest;-><init>(Landroid/app/Activity;)V

    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->statusCallback:Lcom/facebook/Session$StatusCallback;

    invoke-virtual {v1, v2}, Lcom/facebook/Session$OpenRequest;->setCallback(Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session$OpenRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/Session;->openForRead(Lcom/facebook/Session$OpenRequest;)V

    .line 202
    :goto_0
    return-void

    .line 195
    :cond_0
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->statusCallback:Lcom/facebook/Session$StatusCallback;

    invoke-static {v1, v2, v3}, Lcom/facebook/Session;->openActiveSession(Landroid/app/Activity;ZLcom/facebook/Session$StatusCallback;)Lcom/facebook/Session;

    goto :goto_0
.end method

.method public Logout()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 206
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 208
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/Session;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 211
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/Session;->closeAndClearTokenInformation()V

    .line 212
    invoke-virtual {p0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->cleanup()V

    .line 215
    :cond_0
    iput-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_friendData:Lcom/facebook/model/GraphObject;

    .line 216
    iput-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_user:Lcom/facebook/model/GraphUser;

    .line 217
    return-void
.end method

.method public cleanup()V
    .locals 5

    .prologue
    .line 226
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_FileDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 228
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_FileDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 230
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_FileDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    .line 231
    .local v0, "children":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-lt v1, v2, :cond_1

    .line 236
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_FileDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_0

    .line 237
    const-string v2, "FACEBOOK"

    const-string v3, "cleanup(): ERROR: Facebook directory was found but not deleted!"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    .end local v0    # "children":[Ljava/lang/String;
    .end local v1    # "i":I
    :cond_0
    return-void

    .line 234
    .restart local v0    # "children":[Ljava/lang/String;
    .restart local v1    # "i":I
    :cond_1
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->_FileDir:Ljava/io/File;

    aget-object v4, v0, v1

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 231
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 181
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/cobra/zufflin/ZufflinActivity;->removeActivityListener(Lcom/cobra/zufflin/ZufflinActivityListener;)V

    .line 182
    invoke-virtual {p0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->Logout()V

    .line 183
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->singleton:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    .line 184
    return-void
.end method

.method public getAccessToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 484
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/Session;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isSessionActive()Z
    .locals 1

    .prologue
    .line 479
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/Session;->isOpened()Z

    move-result v0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 1062
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/facebook/Session;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    .line 1064
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->uiHelper:Lcom/facebook/UiLifecycleHelper;

    new-instance v1, Lcom/cobra/zufflin/facebook/ZufflinFacebook$9;

    invoke-direct {v1, p0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$9;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)V

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/facebook/UiLifecycleHelper;->onActivityResult(IILandroid/content/Intent;Lcom/facebook/widget/FacebookDialog$Callback;)V

    .line 1078
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 1119
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->uiHelper:Lcom/facebook/UiLifecycleHelper;

    invoke-virtual {v0}, Lcom/facebook/UiLifecycleHelper;->onDestroy()V

    .line 1120
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 1084
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->uiHelper:Lcom/facebook/UiLifecycleHelper;

    invoke-virtual {v0}, Lcom/facebook/UiLifecycleHelper;->onPause()V

    .line 1085
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 1091
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->uiHelper:Lcom/facebook/UiLifecycleHelper;

    invoke-virtual {v0}, Lcom/facebook/UiLifecycleHelper;->onResume()V

    .line 1092
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 1111
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 1112
    .local v0, "session":Lcom/facebook/Session;
    invoke-static {v0, p1}, Lcom/facebook/Session;->saveSession(Lcom/facebook/Session;Landroid/os/Bundle;)V

    .line 1113
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->uiHelper:Lcom/facebook/UiLifecycleHelper;

    invoke-virtual {v1, p1}, Lcom/facebook/UiLifecycleHelper;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 1114
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 1098
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 1104
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->uiHelper:Lcom/facebook/UiLifecycleHelper;

    invoke-virtual {v0}, Lcom/facebook/UiLifecycleHelper;->onStop()V

    .line 1105
    return-void
.end method

.method public onTaskCompleted(Ljava/lang/String;Ljava/lang/String;ILcom/cobra/zufflin/facebook/DownloadProfilePictures;)V
    .locals 1
    .param p1, "filepath"    # Ljava/lang/String;
    .param p2, "userID"    # Ljava/lang/String;
    .param p3, "index"    # I
    .param p4, "downloaderObject"    # Lcom/cobra/zufflin/facebook/DownloadProfilePictures;

    .prologue
    .line 73
    const-string v0, "ERROR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {p0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnProfilePicDownloadFailed()V

    .line 81
    :goto_0
    return-void

    .line 79
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnProfilePicDownloaded(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public native passOnEvent(Ljava/lang/String;)V
.end method

.method public native passOnLoggedInUserDetails(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public native passOnLoggedInUserFriendsDataDownloaded(Ljava/lang/String;)V
.end method

.method public native passOnPhotoEvent(Z)V
.end method

.method public native passOnProfilePicDownloadFailed()V
.end method

.method public native passOnProfilePicDownloaded(Ljava/lang/String;Ljava/lang/String;I)V
.end method

.method public native passOnRequestEvent(Z)V
.end method

.method public native passOnRequestedUserDetails(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public native passOnScreenshotEvent(ZLjava/lang/String;)V
.end method

.method public native passOnShouldLogout()V
.end method

.method public native passOnStatusUpdateEvent(Z)V
.end method

.method public native passOnStoryEvent(Z)V
.end method

.method public postPhoto(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "picture_path"    # Ljava/lang/String;

    .prologue
    .line 793
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "publish_stream"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "photo_upload"

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 794
    .local v0, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedAction:Ljava/lang/String;

    .line 795
    invoke-direct {p0, v0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->getHasPermissions(Ljava/util/List;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 798
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    .line 799
    .local v1, "session":Lcom/facebook/Session;
    const-string v2, "POST_PHOTO"

    iput-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedAction:Ljava/lang/String;

    .line 800
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 801
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    const-string v3, "title"

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 802
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    const-string v3, "message"

    invoke-interface {v2, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 803
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    const-string v3, "picture_path"

    invoke-interface {v2, v3, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 807
    invoke-direct {p0, v1, v0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->requestPublishPermissions(Lcom/facebook/Session;Ljava/util/List;)V

    .line 898
    .end local v1    # "session":Lcom/facebook/Session;
    :goto_0
    return-void

    .line 813
    :cond_0
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    new-instance v3, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;

    invoke-direct {v3, p0, p3, p1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/cobra/zufflin/ZufflinActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public postRequest(Ljava/lang/String;Ljava/lang/String;Ljava/util/Vector;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 567
    .local p3, "data":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    new-instance v1, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;Ljava/lang/String;Ljava/util/Vector;)V

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/ZufflinActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 616
    return-void
.end method

.method public postScreenshot(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "picture_path"    # Ljava/lang/String;

    .prologue
    .line 692
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "publish_stream"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "photo_upload"

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 693
    .local v0, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedAction:Ljava/lang/String;

    .line 694
    invoke-direct {p0, v0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->getHasPermissions(Ljava/util/List;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 697
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    .line 698
    .local v1, "session":Lcom/facebook/Session;
    const-string v2, "POST_SCREENSHOT"

    iput-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedAction:Ljava/lang/String;

    .line 699
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 700
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    const-string v3, "title"

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 701
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    const-string v3, "picture_path"

    invoke-interface {v2, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 705
    invoke-direct {p0, v1, v0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->requestPublishPermissions(Lcom/facebook/Session;Ljava/util/List;)V

    .line 788
    .end local v1    # "session":Lcom/facebook/Session;
    :goto_0
    return-void

    .line 711
    :cond_0
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    new-instance v3, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;

    invoke-direct {v3, p0, p2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/cobra/zufflin/ZufflinActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public postStatusUpdate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "caption"    # Ljava/lang/String;
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "picture"    # Ljava/lang/String;
    .param p5, "link"    # Ljava/lang/String;

    .prologue
    .line 489
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v7

    new-instance v0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Lcom/cobra/zufflin/ZufflinActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 506
    return-void
.end method

.method public postStory(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "target_url"    # Ljava/lang/String;

    .prologue
    .line 621
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "publish_actions"

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 622
    .local v0, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedAction:Ljava/lang/String;

    .line 623
    invoke-direct {p0, v0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->getHasPermissions(Ljava/util/List;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 626
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    .line 627
    .local v1, "session":Lcom/facebook/Session;
    const-string v2, "POST_STORY"

    iput-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedAction:Ljava/lang/String;

    .line 629
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 630
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    const-string v3, "type"

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 631
    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->queuedActionParameters:Ljava/util/Map;

    const-string v3, "target_url"

    invoke-interface {v2, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 633
    invoke-direct {p0, v1, v0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->requestPublishPermissions(Lcom/facebook/Session;Ljava/util/List;)V

    .line 687
    .end local v1    # "session":Lcom/facebook/Session;
    :goto_0
    return-void

    .line 639
    :cond_0
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    new-instance v3, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;

    invoke-direct {v3, p0, p1, p2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/cobra/zufflin/ZufflinActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
