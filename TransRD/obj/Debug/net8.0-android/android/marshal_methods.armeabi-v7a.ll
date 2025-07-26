; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [333 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [660 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 67
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 66
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 107
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 253
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 287
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 79
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 144
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 328
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 123
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 196
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 101
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 271
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 106
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 271
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 138
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 291
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 76
	i32 149764678, ; 19: Svg.Skia.dll => 0x8ed3a46 => 209
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 123
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 227
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 131
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 273
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 150
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 325
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 326
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 225
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 247
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 35: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 90
	i32 261689757, ; 36: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 230
	i32 276479776, ; 37: System.Threading.Timer.dll => 0x107abf20 => 146
	i32 278686392, ; 38: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 249
	i32 280482487, ; 39: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 246
	i32 280992041, ; 40: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 297
	i32 291076382, ; 41: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 292822316, ; 42: Mapsui.UI.Maui => 0x11741d2c => 178
	i32 298918909, ; 43: System.Net.Ping.dll => 0x11d123fd => 68
	i32 317674968, ; 44: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 325
	i32 318968648, ; 45: Xamarin.AndroidX.Activity.dll => 0x13031348 => 216
	i32 321597661, ; 46: System.Numerics => 0x132b30dd => 82
	i32 336156722, ; 47: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 310
	i32 342366114, ; 48: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 248
	i32 356389973, ; 49: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 309
	i32 360082299, ; 50: System.ServiceModel.Web => 0x15766b7b => 130
	i32 367780167, ; 51: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 52: System.Transactions.Local => 0x1658bf94 => 148
	i32 375677976, ; 53: System.Net.ServicePoint.dll => 0x16646418 => 73
	i32 379916513, ; 54: System.Threading.Thread.dll => 0x16a510e1 => 144
	i32 385762202, ; 55: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 56: System.Threading.ThreadPool.dll => 0x1766c1f7 => 145
	i32 395744057, ; 57: _Microsoft.Android.Resource.Designer => 0x17969339 => 329
	i32 403441872, ; 58: WindowsBase => 0x180c08d0 => 164
	i32 435591531, ; 59: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 321
	i32 441335492, ; 60: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 231
	i32 442565967, ; 61: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 62: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 244
	i32 451504562, ; 63: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 124
	i32 456227837, ; 64: System.Web.HttpUtility.dll => 0x1b317bfd => 151
	i32 459347974, ; 65: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 465658307, ; 66: ExCSS => 0x1bc161c3 => 174
	i32 465846621, ; 67: mscorlib => 0x1bc4415d => 165
	i32 469710990, ; 68: System.dll => 0x1bff388e => 163
	i32 469965489, ; 69: Svg.Model => 0x1c031ab1 => 208
	i32 476646585, ; 70: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 246
	i32 486930444, ; 71: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 259
	i32 498788369, ; 72: System.ObjectModel => 0x1dbae811 => 83
	i32 500358224, ; 73: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 308
	i32 503918385, ; 74: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 302
	i32 513247710, ; 75: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 190
	i32 525008092, ; 76: SkiaSharp.dll => 0x1f4afcdc => 201
	i32 526420162, ; 77: System.Transactions.dll => 0x1f6088c2 => 149
	i32 527452488, ; 78: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 291
	i32 530272170, ; 79: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 539058512, ; 80: Microsoft.Extensions.Logging => 0x20216150 => 186
	i32 540030774, ; 81: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 82: System.Runtime.Extensions => 0x2080b118 => 102
	i32 546455878, ; 83: System.Runtime.Serialization.Xml => 0x20924146 => 113
	i32 549171840, ; 84: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 85: Jsr305Binding => 0x213954e7 => 284
	i32 569601784, ; 86: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 282
	i32 577335427, ; 87: System.Security.Cryptography.Cng => 0x22697083 => 119
	i32 592146354, ; 88: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 316
	i32 601371474, ; 89: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 90: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 91: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 118
	i32 627609679, ; 92: Xamarin.AndroidX.CustomView => 0x2568904f => 236
	i32 627931235, ; 93: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 314
	i32 639843206, ; 94: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 242
	i32 643868501, ; 95: System.Net => 0x2660a755 => 80
	i32 662205335, ; 96: System.Text.Encodings.Web.dll => 0x27787397 => 135
	i32 663517072, ; 97: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 278
	i32 666292255, ; 98: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 223
	i32 672442732, ; 99: System.Collections.Concurrent => 0x2814a96c => 8
	i32 680049820, ; 100: Mapsui.Rendering.Skia.dll => 0x2888bc9c => 180
	i32 683518922, ; 101: System.Net.Security => 0x28bdabca => 72
	i32 688181140, ; 102: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 296
	i32 690569205, ; 103: System.Xml.Linq.dll => 0x29293ff5 => 154
	i32 691348768, ; 104: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 293
	i32 693804605, ; 105: System.Windows => 0x295a9e3d => 153
	i32 699345723, ; 106: System.Reflection.Emit => 0x29af2b3b => 91
	i32 700284507, ; 107: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 288
	i32 700358131, ; 108: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 706645707, ; 109: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 311
	i32 709557578, ; 110: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 299
	i32 720511267, ; 111: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 292
	i32 722857257, ; 112: System.Runtime.Loader.dll => 0x2b15ed29 => 108
	i32 735137430, ; 113: System.Security.SecureString.dll => 0x2bd14e96 => 128
	i32 752232764, ; 114: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 115: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 213
	i32 759454413, ; 116: System.Net.Requests => 0x2d445acd => 71
	i32 762598435, ; 117: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 118: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 119: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 320
	i32 778756650, ; 120: SkiaSharp.HarfBuzz.dll => 0x2e6ae22a => 202
	i32 789151979, ; 121: Microsoft.Extensions.Options => 0x2f0980eb => 189
	i32 790371945, ; 122: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 237
	i32 804715423, ; 123: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 124: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 251
	i32 823281589, ; 125: System.Private.Uri.dll => 0x311247b5 => 85
	i32 830298997, ; 126: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 127: System.Xml.XPath.dll => 0x31a103c6 => 159
	i32 834051424, ; 128: System.Net.Quic => 0x31b69d60 => 70
	i32 843511501, ; 129: Xamarin.AndroidX.Print => 0x3246f6cd => 264
	i32 873119928, ; 130: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 131: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 132: System.Net.Http.Json => 0x3463c971 => 62
	i32 899130691, ; 133: NetTopologySuite.dll => 0x3597a543 => 197
	i32 904024072, ; 134: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 135: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 926902833, ; 136: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 323
	i32 928116545, ; 137: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 287
	i32 952186615, ; 138: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 104
	i32 956575887, ; 139: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 292
	i32 966729478, ; 140: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 285
	i32 967690846, ; 141: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 248
	i32 975236339, ; 142: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 143: System.Xml.XDocument => 0x3a2aaa1d => 157
	i32 986514023, ; 144: System.Private.DataContractSerialization.dll => 0x3acd0267 => 84
	i32 987214855, ; 145: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 992768348, ; 146: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 147: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 1001831731, ; 148: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 149: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 268
	i32 1019214401, ; 150: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 151: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 185
	i32 1029334545, ; 152: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 298
	i32 1031528504, ; 153: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 286
	i32 1035644815, ; 154: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 221
	i32 1036536393, ; 155: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1044663988, ; 156: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1052210849, ; 157: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 255
	i32 1067306892, ; 158: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 159: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 160: Xamarin.Kotlin.StdLib => 0x409e66d8 => 289
	i32 1098259244, ; 161: System => 0x41761b2c => 163
	i32 1118262833, ; 162: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 311
	i32 1121599056, ; 163: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 254
	i32 1127624469, ; 164: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 188
	i32 1149092582, ; 165: Xamarin.AndroidX.Window => 0x447dc2e6 => 281
	i32 1168523401, ; 166: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 317
	i32 1170634674, ; 167: System.Web.dll => 0x45c677b2 => 152
	i32 1175144683, ; 168: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 277
	i32 1178241025, ; 169: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 262
	i32 1203215381, ; 170: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 315
	i32 1204270330, ; 171: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 223
	i32 1208641965, ; 172: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1214827643, ; 173: CommunityToolkit.Mvvm => 0x4868cc7b => 173
	i32 1219128291, ; 174: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1234928153, ; 175: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 313
	i32 1243150071, ; 176: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 282
	i32 1253011324, ; 177: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 178: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 297
	i32 1264511973, ; 179: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 272
	i32 1267360935, ; 180: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 276
	i32 1273260888, ; 181: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 228
	i32 1275534314, ; 182: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 293
	i32 1278448581, ; 183: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 220
	i32 1293217323, ; 184: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 239
	i32 1309188875, ; 185: System.Private.DataContractSerialization => 0x4e08a30b => 84
	i32 1313028017, ; 186: Topten.RichTextKit => 0x4e4337b1 => 211
	i32 1322716291, ; 187: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 281
	i32 1324164729, ; 188: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 189: System.Runtime.Serialization.Json.dll => 0x4f97822f => 111
	i32 1364015309, ; 190: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 191: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 327
	i32 1376866003, ; 192: Xamarin.AndroidX.SavedState => 0x52114ed3 => 268
	i32 1379779777, ; 193: System.Resources.ResourceManager => 0x523dc4c1 => 98
	i32 1388087747, ; 194: Mapsui.dll => 0x52bc89c3 => 177
	i32 1402170036, ; 195: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 196: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 232
	i32 1408764838, ; 197: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 110
	i32 1411638395, ; 198: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 100
	i32 1422545099, ; 199: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 101
	i32 1422967952, ; 200: Mapsui.Tiling.dll => 0x54d0c490 => 181
	i32 1430672901, ; 201: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 295
	i32 1434145427, ; 202: System.Runtime.Handles => 0x557b5293 => 103
	i32 1435222561, ; 203: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 285
	i32 1439761251, ; 204: System.Net.Quic.dll => 0x55d10363 => 70
	i32 1443938015, ; 205: NetTopologySuite => 0x5610bedf => 197
	i32 1452070440, ; 206: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 207: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 208: System.Runtime.Extensions.dll => 0x56e36530 => 102
	i32 1458022317, ; 209: System.Net.Security.dll => 0x56e7a7ad => 72
	i32 1461004990, ; 210: es\Microsoft.Maui.Controls.resources => 0x57152abe => 301
	i32 1461234159, ; 211: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 212: System.Security.Cryptography.OpenSsl => 0x57201017 => 122
	i32 1462112819, ; 213: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 214: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 222
	i32 1470490898, ; 215: Microsoft.Extensions.Primitives => 0x57a5e912 => 190
	i32 1479771757, ; 216: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 217: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 218: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 219: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 269
	i32 1493001747, ; 220: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 305
	i32 1514721132, ; 221: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 300
	i32 1536373174, ; 222: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 223: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 137
	i32 1543355203, ; 224: System.Reflection.Emit.dll => 0x5bfdbb43 => 91
	i32 1550322496, ; 225: System.Reflection.Extensions.dll => 0x5c680b40 => 92
	i32 1551623176, ; 226: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 320
	i32 1565862583, ; 227: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 228: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 140
	i32 1573704789, ; 229: System.Runtime.Serialization.Json => 0x5dccd455 => 111
	i32 1580037396, ; 230: System.Threading.Overlapped => 0x5e2d7514 => 139
	i32 1582372066, ; 231: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 238
	i32 1592978981, ; 232: System.Runtime.Serialization.dll => 0x5ef2ee25 => 114
	i32 1597949149, ; 233: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 286
	i32 1600541741, ; 234: ShimSkiaSharp => 0x5f66542d => 200
	i32 1601112923, ; 235: System.Xml.Serialization => 0x5f6f0b5b => 156
	i32 1604827217, ; 236: System.Net.WebClient => 0x5fa7b851 => 75
	i32 1618516317, ; 237: System.Net.WebSockets.Client.dll => 0x6078995d => 78
	i32 1622152042, ; 238: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 258
	i32 1622358360, ; 239: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1623212457, ; 240: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 204
	i32 1624863272, ; 241: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 280
	i32 1635184631, ; 242: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 242
	i32 1636350590, ; 243: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 235
	i32 1639515021, ; 244: System.Net.Http.dll => 0x61b9038d => 63
	i32 1639986890, ; 245: System.Text.RegularExpressions => 0x61c036ca => 137
	i32 1641389582, ; 246: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 247: System.Runtime => 0x62c6282e => 115
	i32 1658241508, ; 248: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 274
	i32 1658251792, ; 249: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 283
	i32 1670060433, ; 250: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 230
	i32 1672364457, ; 251: NetTopologySuite.IO.GeoJSON4STJ.dll => 0x63ae41a9 => 199
	i32 1675553242, ; 252: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 253: System.Net.Primitives.dll => 0x63fca3d0 => 69
	i32 1678508291, ; 254: System.Net.WebSockets => 0x640c0103 => 79
	i32 1679769178, ; 255: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1691477237, ; 256: System.Reflection.Metadata => 0x64d1e4f5 => 93
	i32 1696967625, ; 257: System.Security.Cryptography.Csp => 0x6525abc9 => 120
	i32 1698840827, ; 258: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 290
	i32 1701541528, ; 259: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 260: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 251
	i32 1726116996, ; 261: System.Reflection.dll => 0x66e27484 => 96
	i32 1728033016, ; 262: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 263: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 226
	i32 1736233607, ; 264: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 318
	i32 1743415430, ; 265: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 296
	i32 1744735666, ; 266: System.Transactions.Local.dll => 0x67fe8db2 => 148
	i32 1746316138, ; 267: Mono.Android.Export => 0x6816ab6a => 168
	i32 1750313021, ; 268: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 269: System.Resources.Reader.dll => 0x68cc9d1e => 97
	i32 1763938596, ; 270: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 271: System.Reflection.Extensions => 0x6942234e => 92
	i32 1766324549, ; 272: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 273
	i32 1770582343, ; 273: Microsoft.Extensions.Logging.dll => 0x6988f147 => 186
	i32 1776026572, ; 274: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 275: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 276: Mono.Android.Runtime.dll => 0x6a216153 => 169
	i32 1782862114, ; 277: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 312
	i32 1788241197, ; 278: Xamarin.AndroidX.Fragment => 0x6a96652d => 244
	i32 1793755602, ; 279: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 304
	i32 1808609942, ; 280: Xamarin.AndroidX.Loader => 0x6bcd3296 => 258
	i32 1813058853, ; 281: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 289
	i32 1813201214, ; 282: Xamarin.Google.Android.Material => 0x6c13413e => 283
	i32 1818569960, ; 283: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 263
	i32 1818787751, ; 284: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 285: System.Text.Encoding.Extensions => 0x6cbab720 => 133
	i32 1824722060, ; 286: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 110
	i32 1828688058, ; 287: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 187
	i32 1839733746, ; 288: Mapsui.Nts.dll => 0x6da81bf2 => 179
	i32 1842015223, ; 289: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 324
	i32 1847515442, ; 290: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 213
	i32 1853025655, ; 291: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 321
	i32 1858542181, ; 292: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 293: System.Reflection.Primitives => 0x6f7a29e4 => 94
	i32 1875935024, ; 294: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 303
	i32 1879696579, ; 295: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 296: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 224
	i32 1888955245, ; 297: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 298: System.Reflection.Metadata.dll => 0x70a66bdd => 93
	i32 1898237753, ; 299: System.Reflection.DispatchProxy => 0x7124cf39 => 88
	i32 1900610850, ; 300: System.Resources.ResourceManager.dll => 0x71490522 => 98
	i32 1910275211, ; 301: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1910702736, ; 302: TransRD.dll => 0x71e30290 => 0
	i32 1939592360, ; 303: System.Private.Xml.Linq => 0x739bd4a8 => 86
	i32 1956758971, ; 304: System.Resources.Writer => 0x74a1c5bb => 99
	i32 1961813231, ; 305: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 270
	i32 1968388702, ; 306: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 182
	i32 1983156543, ; 307: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 290
	i32 1985761444, ; 308: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 215
	i32 2003115576, ; 309: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 300
	i32 2011961780, ; 310: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 311: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 255
	i32 2025202353, ; 312: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 295
	i32 2031763787, ; 313: Xamarin.Android.Glide => 0x791a414b => 212
	i32 2045470958, ; 314: System.Private.Xml => 0x79eb68ee => 87
	i32 2055257422, ; 315: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 250
	i32 2060060697, ; 316: System.Windows.dll => 0x7aca0819 => 153
	i32 2066184531, ; 317: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 299
	i32 2070888862, ; 318: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 319: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 320: System.Numerics.Vectors => 0x7c9bf920 => 81
	i32 2127167465, ; 321: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 322: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 323: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 161
	i32 2146852085, ; 324: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 325: Microsoft.Maui => 0x80bd55ad => 194
	i32 2169148018, ; 326: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 307
	i32 2181898931, ; 327: Microsoft.Extensions.Options.dll => 0x820d22b3 => 189
	i32 2192057212, ; 328: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 187
	i32 2193016926, ; 329: System.ObjectModel.dll => 0x82b6c85e => 83
	i32 2201107256, ; 330: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 294
	i32 2201231467, ; 331: System.Net.Http => 0x8334206b => 63
	i32 2207618523, ; 332: it\Microsoft.Maui.Controls.resources => 0x839595db => 309
	i32 2217644978, ; 333: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 277
	i32 2222056684, ; 334: System.Threading.Tasks.Parallel => 0x8471e4ec => 142
	i32 2244775296, ; 335: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 259
	i32 2252106437, ; 336: System.Xml.Serialization.dll => 0x863c6ac5 => 156
	i32 2256313426, ; 337: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 338: System.Security.AccessControl.dll => 0x8702d9a2 => 116
	i32 2266799131, ; 339: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 183
	i32 2267999099, ; 340: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 214
	i32 2270573516, ; 341: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 303
	i32 2279755925, ; 342: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 266
	i32 2293034957, ; 343: System.ServiceModel.Web.dll => 0x88acefcd => 130
	i32 2295906218, ; 344: System.Net.Sockets => 0x88d8bfaa => 74
	i32 2298471582, ; 345: System.Net.Mail => 0x88ffe49e => 65
	i32 2303942373, ; 346: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 313
	i32 2305521784, ; 347: System.Private.CoreLib.dll => 0x896b7878 => 171
	i32 2315684594, ; 348: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 218
	i32 2320631194, ; 349: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 142
	i32 2327893114, ; 350: ExCSS.dll => 0x8ac0d47a => 174
	i32 2340441535, ; 351: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 105
	i32 2344264397, ; 352: System.ValueTuple => 0x8bbaa2cd => 150
	i32 2353062107, ; 353: System.Net.Primitives => 0x8c40e0db => 69
	i32 2364201794, ; 354: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 206
	i32 2368005991, ; 355: System.Xml.ReaderWriter.dll => 0x8d24e767 => 155
	i32 2371007202, ; 356: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 182
	i32 2378619854, ; 357: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 120
	i32 2383496789, ; 358: System.Security.Principal.Windows.dll => 0x8e114655 => 126
	i32 2395872292, ; 359: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 308
	i32 2401565422, ; 360: System.Web.HttpUtility => 0x8f24faee => 151
	i32 2403452196, ; 361: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 241
	i32 2421380589, ; 362: System.Threading.Tasks.Dataflow => 0x905355ed => 140
	i32 2423080555, ; 363: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 228
	i32 2427813419, ; 364: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 305
	i32 2435356389, ; 365: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 366: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 367: System.Text.Encoding.dll => 0x924edee6 => 134
	i32 2458678730, ; 368: System.Net.Sockets.dll => 0x928c75ca => 74
	i32 2459001652, ; 369: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465532216, ; 370: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 231
	i32 2471841756, ; 371: netstandard.dll => 0x93554fdc => 166
	i32 2475788418, ; 372: Java.Interop.dll => 0x93918882 => 167
	i32 2480646305, ; 373: Microsoft.Maui.Controls => 0x93dba8a1 => 192
	i32 2483903535, ; 374: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 375: System.Net.ServicePoint => 0x94147f61 => 73
	i32 2490993605, ; 376: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 377: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 378: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 253
	i32 2521915375, ; 379: SkiaSharp.Views.Maui.Controls.Compatibility => 0x96515fef => 205
	i32 2522472828, ; 380: Xamarin.Android.Glide.dll => 0x9659e17c => 212
	i32 2523023297, ; 381: Svg.Custom.dll => 0x966247c1 => 207
	i32 2538310050, ; 382: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 90
	i32 2550873716, ; 383: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 306
	i32 2562349572, ; 384: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 385: System.Text.Encodings.Web => 0x9930ee42 => 135
	i32 2577414832, ; 386: Mapsui.Nts => 0x99a03ab0 => 179
	i32 2581783588, ; 387: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 254
	i32 2581819634, ; 388: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 276
	i32 2585220780, ; 389: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 133
	i32 2585805581, ; 390: System.Net.Ping => 0x9a20430d => 68
	i32 2589602615, ; 391: System.Threading.ThreadPool => 0x9a5a3337 => 145
	i32 2593496499, ; 392: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 315
	i32 2602257211, ; 393: Svg.Model.dll => 0x9b1b4b3b => 208
	i32 2605712449, ; 394: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 294
	i32 2609324236, ; 395: Svg.Custom => 0x9b8720cc => 207
	i32 2615233544, ; 396: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 245
	i32 2616218305, ; 397: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 188
	i32 2617129537, ; 398: System.Private.Xml.dll => 0x9bfe3a41 => 87
	i32 2618712057, ; 399: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 95
	i32 2620871830, ; 400: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 235
	i32 2624644809, ; 401: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 240
	i32 2625339995, ; 402: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 206
	i32 2626831493, ; 403: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 310
	i32 2627185994, ; 404: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 405: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 406: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 249
	i32 2663391936, ; 407: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 214
	i32 2663698177, ; 408: System.Runtime.Loader => 0x9ec4cf01 => 108
	i32 2664396074, ; 409: System.Xml.XDocument.dll => 0x9ecf752a => 157
	i32 2665622720, ; 410: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 411: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 412: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 113
	i32 2693849962, ; 413: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 414: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 274
	i32 2715334215, ; 415: System.Threading.Tasks.dll => 0xa1d8b647 => 143
	i32 2717744543, ; 416: System.Security.Claims => 0xa1fd7d9f => 117
	i32 2719963679, ; 417: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 119
	i32 2724373263, ; 418: System.Runtime.Numerics.dll => 0xa262a30f => 109
	i32 2732626843, ; 419: Xamarin.AndroidX.Activity => 0xa2e0939b => 216
	i32 2735172069, ; 420: System.Threading.Channels => 0xa30769e5 => 138
	i32 2737747696, ; 421: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 222
	i32 2740948882, ; 422: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 423: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 104
	i32 2752995522, ; 424: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 316
	i32 2756874198, ; 425: NetTopologySuite.IO.GeoJSON4STJ => 0xa4528fd6 => 199
	i32 2758225723, ; 426: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 193
	i32 2764765095, ; 427: Microsoft.Maui.dll => 0xa4caf7a7 => 194
	i32 2765824710, ; 428: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 132
	i32 2770495804, ; 429: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 288
	i32 2778768386, ; 430: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 279
	i32 2779977773, ; 431: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 267
	i32 2785988530, ; 432: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 322
	i32 2788224221, ; 433: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 245
	i32 2795602088, ; 434: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 203
	i32 2801831435, ; 435: Microsoft.Maui.Graphics => 0xa7008e0b => 196
	i32 2803228030, ; 436: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 158
	i32 2806116107, ; 437: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 301
	i32 2810250172, ; 438: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 232
	i32 2819470561, ; 439: System.Xml.dll => 0xa80db4e1 => 162
	i32 2821205001, ; 440: System.ServiceProcess.dll => 0xa8282c09 => 131
	i32 2821294376, ; 441: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 267
	i32 2824502124, ; 442: System.Xml.XmlDocument => 0xa85a7b6c => 160
	i32 2831556043, ; 443: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 314
	i32 2838993487, ; 444: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 256
	i32 2849599387, ; 445: System.Threading.Overlapped.dll => 0xa9d96f9b => 139
	i32 2853208004, ; 446: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 279
	i32 2855708567, ; 447: Xamarin.AndroidX.Transition => 0xaa36a797 => 275
	i32 2861098320, ; 448: Mono.Android.Export.dll => 0xaa88e550 => 168
	i32 2861189240, ; 449: Microsoft.Maui.Essentials => 0xaa8a4878 => 195
	i32 2870099610, ; 450: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 217
	i32 2875164099, ; 451: Jsr305Binding.dll => 0xab5f85c3 => 284
	i32 2875220617, ; 452: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2884993177, ; 453: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 243
	i32 2887636118, ; 454: System.Net.dll => 0xac1dd496 => 80
	i32 2899753641, ; 455: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 456: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 457: System.Reflection => 0xacf080de => 96
	i32 2905242038, ; 458: mscorlib.dll => 0xad2a79b6 => 165
	i32 2909740682, ; 459: System.Private.CoreLib => 0xad6f1e8a => 171
	i32 2912489636, ; 460: SkiaSharp.Views.Android => 0xad9910a4 => 203
	i32 2916838712, ; 461: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 280
	i32 2919462931, ; 462: System.Numerics.Vectors.dll => 0xae037813 => 81
	i32 2921128767, ; 463: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 219
	i32 2936416060, ; 464: System.Resources.Reader => 0xaf06273c => 97
	i32 2940926066, ; 465: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 466: System.Xml.XPath.XDocument => 0xaf624531 => 158
	i32 2959614098, ; 467: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 468: System.Security.Principal.Windows => 0xb0ed41f3 => 126
	i32 2972252294, ; 469: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 118
	i32 2978675010, ; 470: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 239
	i32 2987532451, ; 471: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 270
	i32 2996846495, ; 472: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 252
	i32 3016983068, ; 473: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 272
	i32 3023353419, ; 474: WindowsBase.dll => 0xb434b64b => 164
	i32 3024354802, ; 475: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 247
	i32 3038032645, ; 476: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 329
	i32 3056245963, ; 477: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 269
	i32 3057625584, ; 478: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 260
	i32 3059408633, ; 479: Mono.Android.Runtime => 0xb65adef9 => 169
	i32 3059793426, ; 480: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 481: System.Threading.Tasks => 0xb755818f => 143
	i32 3077302341, ; 482: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 307
	i32 3090735792, ; 483: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 124
	i32 3099732863, ; 484: System.Security.Claims.dll => 0xb8c22b7f => 117
	i32 3103600923, ; 485: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 486: System.Runtime.Serialization => 0xb979e222 => 114
	i32 3121463068, ; 487: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 488: System.Threading.Tasks.Extensions => 0xba4127cb => 141
	i32 3132293585, ; 489: System.Security.AccessControl => 0xbab301d1 => 116
	i32 3134694676, ; 490: ShimSkiaSharp.dll => 0xbad7a514 => 200
	i32 3147165239, ; 491: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 492: GoogleGson.dll => 0xbba64c02 => 175
	i32 3159123045, ; 493: System.Reflection.Primitives.dll => 0xbc4c6465 => 94
	i32 3160747431, ; 494: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 495: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 261
	i32 3192346100, ; 496: System.Security.SecureString => 0xbe4755f4 => 128
	i32 3193515020, ; 497: System.Web => 0xbe592c0c => 152
	i32 3204380047, ; 498: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 499: System.Xml.XmlDocument.dll => 0xbf506931 => 160
	i32 3211777861, ; 500: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 238
	i32 3220365878, ; 501: System.Threading => 0xbff2e236 => 147
	i32 3226221578, ; 502: System.Runtime.Handles.dll => 0xc04c3c0a => 103
	i32 3251039220, ; 503: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 88
	i32 3258312781, ; 504: Xamarin.AndroidX.CardView => 0xc235e84d => 226
	i32 3265493905, ; 505: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 506: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 141
	i32 3277815716, ; 507: System.Resources.Writer.dll => 0xc35f7fa4 => 99
	i32 3278552754, ; 508: Mapsui => 0xc36abeb2 => 177
	i32 3279906254, ; 509: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 510: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 511: System.Security.Cryptography.Encoding => 0xc4251ff9 => 121
	i32 3299363146, ; 512: System.Text.Encoding => 0xc4a8494a => 134
	i32 3303498502, ; 513: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 514: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 302
	i32 3316684772, ; 515: System.Net.Requests.dll => 0xc5b097e4 => 71
	i32 3317135071, ; 516: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 236
	i32 3317144872, ; 517: System.Data => 0xc5b79d28 => 24
	i32 3340387945, ; 518: SkiaSharp => 0xc71a4669 => 201
	i32 3340431453, ; 519: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 224
	i32 3345895724, ; 520: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 265
	i32 3346324047, ; 521: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 262
	i32 3357674450, ; 522: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 319
	i32 3358260929, ; 523: System.Text.Json => 0xc82afec1 => 136
	i32 3362336904, ; 524: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 217
	i32 3362522851, ; 525: Xamarin.AndroidX.Core => 0xc86c06e3 => 233
	i32 3366347497, ; 526: Java.Interop => 0xc8a662e9 => 167
	i32 3374999561, ; 527: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 266
	i32 3381016424, ; 528: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 298
	i32 3395150330, ; 529: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 100
	i32 3403906625, ; 530: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 122
	i32 3405233483, ; 531: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 237
	i32 3428513518, ; 532: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 184
	i32 3429136800, ; 533: System.Xml => 0xcc6479a0 => 162
	i32 3430777524, ; 534: netstandard => 0xcc7d82b4 => 166
	i32 3441283291, ; 535: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 240
	i32 3445260447, ; 536: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 537: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 191
	i32 3459815001, ; 538: Mapsui.Rendering.Skia => 0xce389659 => 180
	i32 3463511458, ; 539: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 306
	i32 3466574376, ; 540: SkiaSharp.Views.Maui.Controls.Compatibility.dll => 0xce9fba28 => 205
	i32 3471940407, ; 541: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3473156932, ; 542: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 204
	i32 3476120550, ; 543: Mono.Android => 0xcf3163e6 => 170
	i32 3479583265, ; 544: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 319
	i32 3484440000, ; 545: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 318
	i32 3485117614, ; 546: System.Text.Json.dll => 0xcfbaacae => 136
	i32 3486566296, ; 547: System.Transactions => 0xcfd0c798 => 149
	i32 3493954962, ; 548: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 229
	i32 3509114376, ; 549: System.Xml.Linq => 0xd128d608 => 154
	i32 3515174580, ; 550: System.Security.dll => 0xd1854eb4 => 129
	i32 3530912306, ; 551: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 552: System.Net.HttpListener => 0xd2ff69f1 => 64
	i32 3560100363, ; 553: System.Threading.Timer => 0xd432d20b => 146
	i32 3570554715, ; 554: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 555: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 326
	i32 3597029428, ; 556: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 215
	i32 3598340787, ; 557: System.Net.WebSockets.Client => 0xd67a52b3 => 78
	i32 3608519521, ; 558: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 559: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 105
	i32 3627220390, ; 560: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 264
	i32 3633644679, ; 561: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 219
	i32 3638274909, ; 562: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 563: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 250
	i32 3643446276, ; 564: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 323
	i32 3643854240, ; 565: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 261
	i32 3645089577, ; 566: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 567: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 183
	i32 3660523487, ; 568: System.Net.NetworkInformation => 0xda2f27df => 67
	i32 3672681054, ; 569: Mono.Android.dll => 0xdae8aa5e => 170
	i32 3682565725, ; 570: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 225
	i32 3684561358, ; 571: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 229
	i32 3697841164, ; 572: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 328
	i32 3700866549, ; 573: System.Net.WebProxy.dll => 0xdc96bdf5 => 77
	i32 3706696989, ; 574: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 234
	i32 3712156464, ; 575: Mapsui.UI.Maui.dll => 0xdd430330 => 178
	i32 3716563718, ; 576: System.Runtime.Intrinsics => 0xdd864306 => 107
	i32 3718780102, ; 577: Xamarin.AndroidX.Annotation => 0xdda814c6 => 218
	i32 3724971120, ; 578: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 260
	i32 3732100267, ; 579: System.Net.NameResolution => 0xde7354ab => 66
	i32 3737834244, ; 580: System.Net.Http.Json.dll => 0xdecad304 => 62
	i32 3748608112, ; 581: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 210
	i32 3751444290, ; 582: System.Xml.XPath => 0xdf9a7f42 => 159
	i32 3786282454, ; 583: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 227
	i32 3792276235, ; 584: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3792835768, ; 585: HarfBuzzSharp => 0xe21214b8 => 176
	i32 3798102808, ; 586: BruTile => 0xe2627318 => 172
	i32 3800979733, ; 587: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 191
	i32 3802395368, ; 588: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 589: System.Net.WebProxy => 0xe3a54a09 => 77
	i32 3823082795, ; 590: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3829621856, ; 591: System.Numerics.dll => 0xe4436460 => 82
	i32 3841636137, ; 592: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 185
	i32 3844307129, ; 593: System.Net.Mail.dll => 0xe52378b9 => 65
	i32 3849253459, ; 594: System.Runtime.InteropServices.dll => 0xe56ef253 => 106
	i32 3870376305, ; 595: System.Net.HttpListener.dll => 0xe6b14171 => 64
	i32 3873536506, ; 596: System.Security.Principal => 0xe6e179fa => 127
	i32 3875112723, ; 597: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 121
	i32 3885497537, ; 598: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 76
	i32 3885922214, ; 599: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 275
	i32 3888767677, ; 600: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 265
	i32 3889960447, ; 601: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 327
	i32 3896106733, ; 602: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 603: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 233
	i32 3901907137, ; 604: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 605: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 606: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 278
	i32 3928044579, ; 607: System.Xml.ReaderWriter => 0xea213423 => 155
	i32 3930554604, ; 608: System.Security.Principal.dll => 0xea4780ec => 127
	i32 3931092270, ; 609: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 263
	i32 3934069706, ; 610: Topten.RichTextKit.dll => 0xea7d23ca => 211
	i32 3945713374, ; 611: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3952289091, ; 612: NetTopologySuite.Features.dll => 0xeb932543 => 198
	i32 3953583589, ; 613: Svg.Skia => 0xeba6e5e5 => 209
	i32 3953953790, ; 614: System.Text.Encoding.CodePages => 0xebac8bfe => 132
	i32 3955647286, ; 615: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 221
	i32 3959773229, ; 616: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 252
	i32 3980434154, ; 617: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 322
	i32 3987592930, ; 618: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 304
	i32 4003436829, ; 619: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4003906742, ; 620: HarfBuzzSharp.dll => 0xeea6c4b6 => 176
	i32 4013003792, ; 621: BruTile.dll => 0xef319410 => 172
	i32 4015948917, ; 622: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 220
	i32 4022681963, ; 623: Mapsui.Tiling => 0xefc5416b => 181
	i32 4025784931, ; 624: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 625: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 193
	i32 4054681211, ; 626: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 89
	i32 4066802364, ; 627: SkiaSharp.HarfBuzz => 0xf2667abc => 202
	i32 4068434129, ; 628: System.Private.Xml.Linq.dll => 0xf27f60d1 => 86
	i32 4073602200, ; 629: System.Threading.dll => 0xf2ce3c98 => 147
	i32 4094352644, ; 630: Microsoft.Maui.Essentials.dll => 0xf40add04 => 195
	i32 4099507663, ; 631: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 632: System.Private.Uri => 0xf462c30d => 85
	i32 4101593132, ; 633: Xamarin.AndroidX.Emoji2 => 0xf479582c => 241
	i32 4102112229, ; 634: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 317
	i32 4125707920, ; 635: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 312
	i32 4126470640, ; 636: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 184
	i32 4127667938, ; 637: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 638: System.AppContext => 0xf6318da0 => 6
	i32 4144557198, ; 639: NetTopologySuite.Features => 0xf708ec8e => 198
	i32 4147896353, ; 640: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 89
	i32 4150914736, ; 641: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 324
	i32 4151237749, ; 642: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 643: System.Xml.XmlSerializer => 0xf7e95c85 => 161
	i32 4161255271, ; 644: System.Reflection.TypeExtensions => 0xf807b767 => 95
	i32 4164802419, ; 645: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4181436372, ; 646: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 647: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 257
	i32 4185676441, ; 648: System.Security => 0xf97c5a99 => 129
	i32 4196529839, ; 649: System.Net.WebClient.dll => 0xfa21f6af => 75
	i32 4213026141, ; 650: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 210
	i32 4231761228, ; 651: TransRD => 0xfc3b8d4c => 0
	i32 4256097574, ; 652: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 234
	i32 4258378803, ; 653: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 256
	i32 4260525087, ; 654: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 655: Microsoft.Maui.Controls.dll => 0xfea12dee => 192
	i32 4274623895, ; 656: CommunityToolkit.Mvvm.dll => 0xfec99597 => 173
	i32 4274976490, ; 657: System.Runtime.Numerics => 0xfecef6ea => 109
	i32 4292120959, ; 658: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 257
	i32 4294763496 ; 659: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 243
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [660 x i32] [
	i32 67, ; 0
	i32 66, ; 1
	i32 107, ; 2
	i32 253, ; 3
	i32 287, ; 4
	i32 47, ; 5
	i32 79, ; 6
	i32 144, ; 7
	i32 29, ; 8
	i32 328, ; 9
	i32 123, ; 10
	i32 196, ; 11
	i32 101, ; 12
	i32 271, ; 13
	i32 106, ; 14
	i32 271, ; 15
	i32 138, ; 16
	i32 291, ; 17
	i32 76, ; 18
	i32 209, ; 19
	i32 123, ; 20
	i32 13, ; 21
	i32 227, ; 22
	i32 131, ; 23
	i32 273, ; 24
	i32 150, ; 25
	i32 325, ; 26
	i32 326, ; 27
	i32 18, ; 28
	i32 225, ; 29
	i32 26, ; 30
	i32 247, ; 31
	i32 1, ; 32
	i32 58, ; 33
	i32 41, ; 34
	i32 90, ; 35
	i32 230, ; 36
	i32 146, ; 37
	i32 249, ; 38
	i32 246, ; 39
	i32 297, ; 40
	i32 53, ; 41
	i32 178, ; 42
	i32 68, ; 43
	i32 325, ; 44
	i32 216, ; 45
	i32 82, ; 46
	i32 310, ; 47
	i32 248, ; 48
	i32 309, ; 49
	i32 130, ; 50
	i32 54, ; 51
	i32 148, ; 52
	i32 73, ; 53
	i32 144, ; 54
	i32 61, ; 55
	i32 145, ; 56
	i32 329, ; 57
	i32 164, ; 58
	i32 321, ; 59
	i32 231, ; 60
	i32 12, ; 61
	i32 244, ; 62
	i32 124, ; 63
	i32 151, ; 64
	i32 112, ; 65
	i32 174, ; 66
	i32 165, ; 67
	i32 163, ; 68
	i32 208, ; 69
	i32 246, ; 70
	i32 259, ; 71
	i32 83, ; 72
	i32 308, ; 73
	i32 302, ; 74
	i32 190, ; 75
	i32 201, ; 76
	i32 149, ; 77
	i32 291, ; 78
	i32 59, ; 79
	i32 186, ; 80
	i32 50, ; 81
	i32 102, ; 82
	i32 113, ; 83
	i32 39, ; 84
	i32 284, ; 85
	i32 282, ; 86
	i32 119, ; 87
	i32 316, ; 88
	i32 51, ; 89
	i32 43, ; 90
	i32 118, ; 91
	i32 236, ; 92
	i32 314, ; 93
	i32 242, ; 94
	i32 80, ; 95
	i32 135, ; 96
	i32 278, ; 97
	i32 223, ; 98
	i32 8, ; 99
	i32 180, ; 100
	i32 72, ; 101
	i32 296, ; 102
	i32 154, ; 103
	i32 293, ; 104
	i32 153, ; 105
	i32 91, ; 106
	i32 288, ; 107
	i32 44, ; 108
	i32 311, ; 109
	i32 299, ; 110
	i32 292, ; 111
	i32 108, ; 112
	i32 128, ; 113
	i32 25, ; 114
	i32 213, ; 115
	i32 71, ; 116
	i32 54, ; 117
	i32 45, ; 118
	i32 320, ; 119
	i32 202, ; 120
	i32 189, ; 121
	i32 237, ; 122
	i32 22, ; 123
	i32 251, ; 124
	i32 85, ; 125
	i32 42, ; 126
	i32 159, ; 127
	i32 70, ; 128
	i32 264, ; 129
	i32 3, ; 130
	i32 41, ; 131
	i32 62, ; 132
	i32 197, ; 133
	i32 16, ; 134
	i32 52, ; 135
	i32 323, ; 136
	i32 287, ; 137
	i32 104, ; 138
	i32 292, ; 139
	i32 285, ; 140
	i32 248, ; 141
	i32 33, ; 142
	i32 157, ; 143
	i32 84, ; 144
	i32 31, ; 145
	i32 12, ; 146
	i32 50, ; 147
	i32 55, ; 148
	i32 268, ; 149
	i32 35, ; 150
	i32 185, ; 151
	i32 298, ; 152
	i32 286, ; 153
	i32 221, ; 154
	i32 34, ; 155
	i32 57, ; 156
	i32 255, ; 157
	i32 175, ; 158
	i32 17, ; 159
	i32 289, ; 160
	i32 163, ; 161
	i32 311, ; 162
	i32 254, ; 163
	i32 188, ; 164
	i32 281, ; 165
	i32 317, ; 166
	i32 152, ; 167
	i32 277, ; 168
	i32 262, ; 169
	i32 315, ; 170
	i32 223, ; 171
	i32 28, ; 172
	i32 173, ; 173
	i32 51, ; 174
	i32 313, ; 175
	i32 282, ; 176
	i32 5, ; 177
	i32 297, ; 178
	i32 272, ; 179
	i32 276, ; 180
	i32 228, ; 181
	i32 293, ; 182
	i32 220, ; 183
	i32 239, ; 184
	i32 84, ; 185
	i32 211, ; 186
	i32 281, ; 187
	i32 60, ; 188
	i32 111, ; 189
	i32 56, ; 190
	i32 327, ; 191
	i32 268, ; 192
	i32 98, ; 193
	i32 177, ; 194
	i32 19, ; 195
	i32 232, ; 196
	i32 110, ; 197
	i32 100, ; 198
	i32 101, ; 199
	i32 181, ; 200
	i32 295, ; 201
	i32 103, ; 202
	i32 285, ; 203
	i32 70, ; 204
	i32 197, ; 205
	i32 37, ; 206
	i32 31, ; 207
	i32 102, ; 208
	i32 72, ; 209
	i32 301, ; 210
	i32 9, ; 211
	i32 122, ; 212
	i32 45, ; 213
	i32 222, ; 214
	i32 190, ; 215
	i32 9, ; 216
	i32 42, ; 217
	i32 4, ; 218
	i32 269, ; 219
	i32 305, ; 220
	i32 300, ; 221
	i32 30, ; 222
	i32 137, ; 223
	i32 91, ; 224
	i32 92, ; 225
	i32 320, ; 226
	i32 48, ; 227
	i32 140, ; 228
	i32 111, ; 229
	i32 139, ; 230
	i32 238, ; 231
	i32 114, ; 232
	i32 286, ; 233
	i32 200, ; 234
	i32 156, ; 235
	i32 75, ; 236
	i32 78, ; 237
	i32 258, ; 238
	i32 36, ; 239
	i32 204, ; 240
	i32 280, ; 241
	i32 242, ; 242
	i32 235, ; 243
	i32 63, ; 244
	i32 137, ; 245
	i32 15, ; 246
	i32 115, ; 247
	i32 274, ; 248
	i32 283, ; 249
	i32 230, ; 250
	i32 199, ; 251
	i32 47, ; 252
	i32 69, ; 253
	i32 79, ; 254
	i32 125, ; 255
	i32 93, ; 256
	i32 120, ; 257
	i32 290, ; 258
	i32 26, ; 259
	i32 251, ; 260
	i32 96, ; 261
	i32 27, ; 262
	i32 226, ; 263
	i32 318, ; 264
	i32 296, ; 265
	i32 148, ; 266
	i32 168, ; 267
	i32 4, ; 268
	i32 97, ; 269
	i32 32, ; 270
	i32 92, ; 271
	i32 273, ; 272
	i32 186, ; 273
	i32 21, ; 274
	i32 40, ; 275
	i32 169, ; 276
	i32 312, ; 277
	i32 244, ; 278
	i32 304, ; 279
	i32 258, ; 280
	i32 289, ; 281
	i32 283, ; 282
	i32 263, ; 283
	i32 2, ; 284
	i32 133, ; 285
	i32 110, ; 286
	i32 187, ; 287
	i32 179, ; 288
	i32 324, ; 289
	i32 213, ; 290
	i32 321, ; 291
	i32 57, ; 292
	i32 94, ; 293
	i32 303, ; 294
	i32 38, ; 295
	i32 224, ; 296
	i32 25, ; 297
	i32 93, ; 298
	i32 88, ; 299
	i32 98, ; 300
	i32 10, ; 301
	i32 0, ; 302
	i32 86, ; 303
	i32 99, ; 304
	i32 270, ; 305
	i32 182, ; 306
	i32 290, ; 307
	i32 215, ; 308
	i32 300, ; 309
	i32 7, ; 310
	i32 255, ; 311
	i32 295, ; 312
	i32 212, ; 313
	i32 87, ; 314
	i32 250, ; 315
	i32 153, ; 316
	i32 299, ; 317
	i32 32, ; 318
	i32 115, ; 319
	i32 81, ; 320
	i32 20, ; 321
	i32 11, ; 322
	i32 161, ; 323
	i32 3, ; 324
	i32 194, ; 325
	i32 307, ; 326
	i32 189, ; 327
	i32 187, ; 328
	i32 83, ; 329
	i32 294, ; 330
	i32 63, ; 331
	i32 309, ; 332
	i32 277, ; 333
	i32 142, ; 334
	i32 259, ; 335
	i32 156, ; 336
	i32 40, ; 337
	i32 116, ; 338
	i32 183, ; 339
	i32 214, ; 340
	i32 303, ; 341
	i32 266, ; 342
	i32 130, ; 343
	i32 74, ; 344
	i32 65, ; 345
	i32 313, ; 346
	i32 171, ; 347
	i32 218, ; 348
	i32 142, ; 349
	i32 174, ; 350
	i32 105, ; 351
	i32 150, ; 352
	i32 69, ; 353
	i32 206, ; 354
	i32 155, ; 355
	i32 182, ; 356
	i32 120, ; 357
	i32 126, ; 358
	i32 308, ; 359
	i32 151, ; 360
	i32 241, ; 361
	i32 140, ; 362
	i32 228, ; 363
	i32 305, ; 364
	i32 20, ; 365
	i32 14, ; 366
	i32 134, ; 367
	i32 74, ; 368
	i32 58, ; 369
	i32 231, ; 370
	i32 166, ; 371
	i32 167, ; 372
	i32 192, ; 373
	i32 15, ; 374
	i32 73, ; 375
	i32 6, ; 376
	i32 23, ; 377
	i32 253, ; 378
	i32 205, ; 379
	i32 212, ; 380
	i32 207, ; 381
	i32 90, ; 382
	i32 306, ; 383
	i32 1, ; 384
	i32 135, ; 385
	i32 179, ; 386
	i32 254, ; 387
	i32 276, ; 388
	i32 133, ; 389
	i32 68, ; 390
	i32 145, ; 391
	i32 315, ; 392
	i32 208, ; 393
	i32 294, ; 394
	i32 207, ; 395
	i32 245, ; 396
	i32 188, ; 397
	i32 87, ; 398
	i32 95, ; 399
	i32 235, ; 400
	i32 240, ; 401
	i32 206, ; 402
	i32 310, ; 403
	i32 30, ; 404
	i32 44, ; 405
	i32 249, ; 406
	i32 214, ; 407
	i32 108, ; 408
	i32 157, ; 409
	i32 34, ; 410
	i32 22, ; 411
	i32 113, ; 412
	i32 56, ; 413
	i32 274, ; 414
	i32 143, ; 415
	i32 117, ; 416
	i32 119, ; 417
	i32 109, ; 418
	i32 216, ; 419
	i32 138, ; 420
	i32 222, ; 421
	i32 53, ; 422
	i32 104, ; 423
	i32 316, ; 424
	i32 199, ; 425
	i32 193, ; 426
	i32 194, ; 427
	i32 132, ; 428
	i32 288, ; 429
	i32 279, ; 430
	i32 267, ; 431
	i32 322, ; 432
	i32 245, ; 433
	i32 203, ; 434
	i32 196, ; 435
	i32 158, ; 436
	i32 301, ; 437
	i32 232, ; 438
	i32 162, ; 439
	i32 131, ; 440
	i32 267, ; 441
	i32 160, ; 442
	i32 314, ; 443
	i32 256, ; 444
	i32 139, ; 445
	i32 279, ; 446
	i32 275, ; 447
	i32 168, ; 448
	i32 195, ; 449
	i32 217, ; 450
	i32 284, ; 451
	i32 39, ; 452
	i32 243, ; 453
	i32 80, ; 454
	i32 55, ; 455
	i32 36, ; 456
	i32 96, ; 457
	i32 165, ; 458
	i32 171, ; 459
	i32 203, ; 460
	i32 280, ; 461
	i32 81, ; 462
	i32 219, ; 463
	i32 97, ; 464
	i32 29, ; 465
	i32 158, ; 466
	i32 18, ; 467
	i32 126, ; 468
	i32 118, ; 469
	i32 239, ; 470
	i32 270, ; 471
	i32 252, ; 472
	i32 272, ; 473
	i32 164, ; 474
	i32 247, ; 475
	i32 329, ; 476
	i32 269, ; 477
	i32 260, ; 478
	i32 169, ; 479
	i32 16, ; 480
	i32 143, ; 481
	i32 307, ; 482
	i32 124, ; 483
	i32 117, ; 484
	i32 37, ; 485
	i32 114, ; 486
	i32 46, ; 487
	i32 141, ; 488
	i32 116, ; 489
	i32 200, ; 490
	i32 33, ; 491
	i32 175, ; 492
	i32 94, ; 493
	i32 52, ; 494
	i32 261, ; 495
	i32 128, ; 496
	i32 152, ; 497
	i32 24, ; 498
	i32 160, ; 499
	i32 238, ; 500
	i32 147, ; 501
	i32 103, ; 502
	i32 88, ; 503
	i32 226, ; 504
	i32 59, ; 505
	i32 141, ; 506
	i32 99, ; 507
	i32 177, ; 508
	i32 5, ; 509
	i32 13, ; 510
	i32 121, ; 511
	i32 134, ; 512
	i32 27, ; 513
	i32 302, ; 514
	i32 71, ; 515
	i32 236, ; 516
	i32 24, ; 517
	i32 201, ; 518
	i32 224, ; 519
	i32 265, ; 520
	i32 262, ; 521
	i32 319, ; 522
	i32 136, ; 523
	i32 217, ; 524
	i32 233, ; 525
	i32 167, ; 526
	i32 266, ; 527
	i32 298, ; 528
	i32 100, ; 529
	i32 122, ; 530
	i32 237, ; 531
	i32 184, ; 532
	i32 162, ; 533
	i32 166, ; 534
	i32 240, ; 535
	i32 38, ; 536
	i32 191, ; 537
	i32 180, ; 538
	i32 306, ; 539
	i32 205, ; 540
	i32 17, ; 541
	i32 204, ; 542
	i32 170, ; 543
	i32 319, ; 544
	i32 318, ; 545
	i32 136, ; 546
	i32 149, ; 547
	i32 229, ; 548
	i32 154, ; 549
	i32 129, ; 550
	i32 19, ; 551
	i32 64, ; 552
	i32 146, ; 553
	i32 46, ; 554
	i32 326, ; 555
	i32 215, ; 556
	i32 78, ; 557
	i32 60, ; 558
	i32 105, ; 559
	i32 264, ; 560
	i32 219, ; 561
	i32 48, ; 562
	i32 250, ; 563
	i32 323, ; 564
	i32 261, ; 565
	i32 14, ; 566
	i32 183, ; 567
	i32 67, ; 568
	i32 170, ; 569
	i32 225, ; 570
	i32 229, ; 571
	i32 328, ; 572
	i32 77, ; 573
	i32 234, ; 574
	i32 178, ; 575
	i32 107, ; 576
	i32 218, ; 577
	i32 260, ; 578
	i32 66, ; 579
	i32 62, ; 580
	i32 210, ; 581
	i32 159, ; 582
	i32 227, ; 583
	i32 10, ; 584
	i32 176, ; 585
	i32 172, ; 586
	i32 191, ; 587
	i32 11, ; 588
	i32 77, ; 589
	i32 125, ; 590
	i32 82, ; 591
	i32 185, ; 592
	i32 65, ; 593
	i32 106, ; 594
	i32 64, ; 595
	i32 127, ; 596
	i32 121, ; 597
	i32 76, ; 598
	i32 275, ; 599
	i32 265, ; 600
	i32 327, ; 601
	i32 8, ; 602
	i32 233, ; 603
	i32 2, ; 604
	i32 43, ; 605
	i32 278, ; 606
	i32 155, ; 607
	i32 127, ; 608
	i32 263, ; 609
	i32 211, ; 610
	i32 23, ; 611
	i32 198, ; 612
	i32 209, ; 613
	i32 132, ; 614
	i32 221, ; 615
	i32 252, ; 616
	i32 322, ; 617
	i32 304, ; 618
	i32 28, ; 619
	i32 176, ; 620
	i32 172, ; 621
	i32 220, ; 622
	i32 181, ; 623
	i32 61, ; 624
	i32 193, ; 625
	i32 89, ; 626
	i32 202, ; 627
	i32 86, ; 628
	i32 147, ; 629
	i32 195, ; 630
	i32 35, ; 631
	i32 85, ; 632
	i32 241, ; 633
	i32 317, ; 634
	i32 312, ; 635
	i32 184, ; 636
	i32 49, ; 637
	i32 6, ; 638
	i32 198, ; 639
	i32 89, ; 640
	i32 324, ; 641
	i32 21, ; 642
	i32 161, ; 643
	i32 95, ; 644
	i32 49, ; 645
	i32 112, ; 646
	i32 257, ; 647
	i32 129, ; 648
	i32 75, ; 649
	i32 210, ; 650
	i32 0, ; 651
	i32 234, ; 652
	i32 256, ; 653
	i32 7, ; 654
	i32 192, ; 655
	i32 173, ; 656
	i32 109, ; 657
	i32 257, ; 658
	i32 243 ; 659
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
