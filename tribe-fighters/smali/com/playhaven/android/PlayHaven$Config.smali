.class public final enum Lcom/playhaven/android/PlayHaven$Config;
.super Ljava/lang/Enum;
.source "PlayHaven.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/PlayHaven;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Config"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/PlayHaven$Config;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum APIServer:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum AppPkg:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum AppVersion:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum DeviceId:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum DeviceModel:Lcom/playhaven/android/PlayHaven$Config;

.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum FullScreen:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum OSName:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum OSVersion:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum OptOut:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum PluginIdentifer:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum PluginType:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum PushProjectId:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum SDKVersion:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum Secret:Lcom/playhaven/android/PlayHaven$Config;

.field public static final enum Token:Lcom/playhaven/android/PlayHaven$Config;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 97
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "Token"

    invoke-direct {v0, v1, v3}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 102
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->Token:Lcom/playhaven/android/PlayHaven$Config;

    .line 104
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "Secret"

    invoke-direct {v0, v1, v4}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 109
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->Secret:Lcom/playhaven/android/PlayHaven$Config;

    .line 111
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "APIServer"

    invoke-direct {v0, v1, v5}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 114
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->APIServer:Lcom/playhaven/android/PlayHaven$Config;

    .line 116
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "SDKVersion"

    invoke-direct {v0, v1, v6}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 119
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->SDKVersion:Lcom/playhaven/android/PlayHaven$Config;

    .line 121
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "PluginIdentifer"

    invoke-direct {v0, v1, v7}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 124
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->PluginIdentifer:Lcom/playhaven/android/PlayHaven$Config;

    .line 126
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "PluginType"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 129
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->PluginType:Lcom/playhaven/android/PlayHaven$Config;

    .line 131
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "AppPkg"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 134
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->AppPkg:Lcom/playhaven/android/PlayHaven$Config;

    .line 136
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "AppVersion"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 139
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->AppVersion:Lcom/playhaven/android/PlayHaven$Config;

    .line 141
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "OSName"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 144
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->OSName:Lcom/playhaven/android/PlayHaven$Config;

    .line 146
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "OSVersion"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 149
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->OSVersion:Lcom/playhaven/android/PlayHaven$Config;

    .line 151
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "DeviceId"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 154
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->DeviceId:Lcom/playhaven/android/PlayHaven$Config;

    .line 156
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "PushProjectId"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 159
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->PushProjectId:Lcom/playhaven/android/PlayHaven$Config;

    .line 161
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "DeviceModel"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 164
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->DeviceModel:Lcom/playhaven/android/PlayHaven$Config;

    .line 166
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "FullScreen"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 170
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->FullScreen:Lcom/playhaven/android/PlayHaven$Config;

    .line 172
    new-instance v0, Lcom/playhaven/android/PlayHaven$Config;

    const-string v1, "OptOut"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/PlayHaven$Config;-><init>(Ljava/lang/String;I)V

    .line 175
    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->OptOut:Lcom/playhaven/android/PlayHaven$Config;

    .line 95
    const/16 v0, 0xf

    new-array v0, v0, [Lcom/playhaven/android/PlayHaven$Config;

    sget-object v1, Lcom/playhaven/android/PlayHaven$Config;->Token:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v1, v0, v3

    sget-object v1, Lcom/playhaven/android/PlayHaven$Config;->Secret:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v1, v0, v4

    sget-object v1, Lcom/playhaven/android/PlayHaven$Config;->APIServer:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v1, v0, v5

    sget-object v1, Lcom/playhaven/android/PlayHaven$Config;->SDKVersion:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v1, v0, v6

    sget-object v1, Lcom/playhaven/android/PlayHaven$Config;->PluginIdentifer:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/playhaven/android/PlayHaven$Config;->PluginType:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/playhaven/android/PlayHaven$Config;->AppPkg:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/playhaven/android/PlayHaven$Config;->AppVersion:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/playhaven/android/PlayHaven$Config;->OSName:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/playhaven/android/PlayHaven$Config;->OSVersion:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/playhaven/android/PlayHaven$Config;->DeviceId:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/playhaven/android/PlayHaven$Config;->PushProjectId:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/playhaven/android/PlayHaven$Config;->DeviceModel:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/playhaven/android/PlayHaven$Config;->FullScreen:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/playhaven/android/PlayHaven$Config;->OptOut:Lcom/playhaven/android/PlayHaven$Config;

    aput-object v2, v0, v1

    sput-object v0, Lcom/playhaven/android/PlayHaven$Config;->ENUM$VALUES:[Lcom/playhaven/android/PlayHaven$Config;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 95
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/PlayHaven$Config;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/PlayHaven$Config;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/PlayHaven$Config;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/PlayHaven$Config;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/PlayHaven$Config;->ENUM$VALUES:[Lcom/playhaven/android/PlayHaven$Config;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/PlayHaven$Config;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
