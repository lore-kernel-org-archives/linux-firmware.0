Return-Path: <SRS0=LX54=6K=service.xiaoxd1.xyz=ratlm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4BDC61DA4
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Feb 2023 20:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E718C4339B; Tue, 14 Feb 2023 20:21:28 +0000 (UTC)
Received: from service.xiaoxd1.xyz (unknown [194.87.69.86])
	by smtp.kernel.org (Postfix) with ESMTP id EBB0DC433D2
	for <linux-firmware@kernel.org>; Tue, 14 Feb 2023 20:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EBB0DC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=service.xiaoxd1.xyz
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=service.xiaoxd1.xyz
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=mykey; d=service.xiaoxd1.xyz;
 h=Date:From:To:Subject:Message-ID:Mime-Version:Content-Type;
 bh=R1eJ3fG4uBT6UsSw8xWCs4V2ZIk=;
 b=kK1TDawsAmGOJ1by46N5wWYTQWbvrgDS2Z2zgSKraVSEdu94+bBQqvoKAycZy5ek2GTg7yUbK682
   Hyb+Y0VRN1kInotRpyD/U6wc+IW3ZfXpANtVOc01u4QBcQfbuFHcpOYw5Q98O0TXAzeKQNu1r1xt
   HAV0+bd6Srw5eGHoHo0=
Received: from yahoo2.com.cn (191.101.17.175) by service.xiaoxd1.xyz id htfmke0001gu for <linux-firmware@kernel.org>; Tue, 14 Feb 2023 23:20:48 +0300 (envelope-from <ratlm@service.xiaoxd1.xyz>)
Date: Wed, 15 Feb 2023 04:20:35 +0800
From: "Amazon.co.jp" <ratlm@service.xiaoxd1.xyz>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: =?utf-8?B?bGludXgtZmlybXdhcmXmp5gg44CQQW1h?=
	=?utf-8?B?em9u44CR44GU5qGI5YaF4oC744Ki44Kr44Km44Oz44OI44Gu44K744Kt44Ol44Oq44OG44Kj?=
	=?utf-8?B?44Gu5ZWP6aGM44Oh44O844Or55Wq5Y+377yaNDEzMjEzOTY1ODM=?=
	=?utf-8?B?Mg==?=
Message-ID: <20230215042045327452@service.xiaoxd1.xyz>
X-mailer: Foxmail 6, 13, 102, 15 [cn]
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====003_Dragon873726058455_====="

This is a multi-part message in MIME format.

--=====003_Dragon873726058455_=====
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

DQrjgrXjgqTjg7PjgqTjg7PjgYzmpJzlh7rjgZXjgozjgb7jgZfjgZ8NCmxpbnV4LWZpcm13YXJl
QGtlcm5lbC5vcmfmp5jjgIHmlrDjgZfjgYTjg4fjg5DjgqTjgrnjgYvjgonjgYrlrqLmp5jjga7j
gqLjgqvjgqbjg7Pjg4jjgbjjga7jgrXjgqTjg7PjgqTjg7PjgYzmpJzlh7rjgZXjgozjgb7jgZfj
gZ/jgIINCuaXpeaZgiAyMDIzLzIvMTUgLzQ6MjA6NDVKYXBhbiBTdGFuZGFyZCBUaW1lICANCuOD
h+ODkOOCpOOCuSAgR29vZ2xlIENocm9tZSBXaW5kb3dzICjjg4fjgrnjgq/jg4jjg4Pjg5cpICAN
CuS7mOi/kSAgS3lvdG8sIEphcGFuICANCuOBk+OCjOOBjOOBiuWuouanmOOBlOiHqui6q+OBq+OC
iOOCi+aTjeS9nOOBoOOBo+OBn+WgtOWQiOOAgeOBk+OBruODoeODg+OCu+ODvOOCuOOBr+eEoeim
luOBl+OBpuOBj+OBoOOBleOBhOOAguiHs+aApeeiuuiqjeOBl+OBn+OBhOOBk+OBqOOBjOOBlOOB
luOBhOOBvuOBmeOBruOBp+OAgeS4i+iomOODquODs+OCr+OCkuOCouOCr+OCu+OCueOBl+OAgeOB
lOeiuuiqjeOCkuOBhOOBn+OBoOOBjeOBvuOBmeOCiOOBhuOBiumhmOOBhOOBhOOBn+OBl+OBvuOB
meOAgg0KIOOCouOCq+OCpuODs+ODiOeuoeeQhg0K4pagIOazqOaEj+S6i+mghQ0KIA0KKuaui+W/
teOBquOBjOOCieOAgTI05pmC6ZaT5Lul5YaF44Gr56K66KqN44Gn44GN44Gq44GR44KM44Gw44CB
IOOBiuWuouanmOOBruOCouOCq+OCpuODs+ODiOOCkuODreODg+OCr+OBl+OBpkFtYXpvbuOCteOD
vOODkyDjgrnjgpLkuIDmmYLnmoTjgavnhKHlirnjgavlpInmm7TjgZnjgovjgZPjgajjgpLjgYrn
n6XjgonjgZsg44GX44G+44GZ44CCDQoq44GT44Gu44Oh44O844Or44Gv6YeN6KaB44Gq44GK55+l
44KJ44Gb44Go44GX44Gm44CB44Oh44O8IOODq+OCkuWPl+S/oeW4jOacm+OBl+OBquOBhOOBiuWu
ouanmOOBq+OCguOBiumAgeOCiuOBhOOBn+OBlyDjgb7jgZnjgILjgZTnkIbop6PjgYTjgZ/jgaDj
gY3jgIHjgYLjgorjgYzjgajjgYbjgZTjgZbjgYTjgb4g44GZ44CCDQoq44GT44Gu44Oh44O844Or
44GM44GU5LiN5piO54K544GM44GC44KK44G+44GX44Gf44KJ44CBQW1hem9u44K144Kk44OI44Gr
44GU6YCj57Wh44GP44Gg44GV44GE44CCDQrjgZTov7fmg5HjgajjgZTlv4PphY3jgpLjgYrjgYvj
gZHjgZfjgabjgIHmt7HjgY/jgYroqavjgbPnlLMg44GX5LiK44GS44G+44GZ44CC44GU5LqG5om/
44GC44KK44GM44Go44GG44GU44GW44GE44G+44GX44Gf44CC

--=====003_Dragon873726058455_=====
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUcmFuc2l0aW9uYWwv
L0VOIj4NCjxIVE1MPjxIRUFEPjxUSVRMRT48L1RJVExFPg0KPE1FVEEgY29udGVudD0idGV4dC9o
dG1sOyBjaGFyc2V0PXV0Zi04IiBodHRwLWVxdWl2PUNvbnRlbnQtVHlwZT4NCjxNRVRBIG5hbWU9
R0VORVJBVE9SIGNvbnRlbnQ9Ik1TSFRNTCAxMS4wMC45NjAwLjE5ODExIj48L0hFQUQ+DQo8Qk9E
WT4NCjxQPiZuYnNwOzwvUD4NCjxQPjxGT05UIHNpemU9NSBmYWNlPUFyaWFsPjxTVFJPTkc+44K1
44Kk44Oz44Kk44Oz44GM5qSc5Ye644GV44KM44G+44GX44GfPC9TVFJPTkc+PC9GT05UPjwvUD4N
CjxQPjxGT05UIA0KZmFjZT1BcmlhbD48U1RST05HPmxpbnV4LWZpcm13YXJlQGtlcm5lbC5vcmc8
L1NUUk9ORz48U1RST05HPuanmOOAgeaWsOOBl+OBhOODh+ODkOOCpOOCueOBi+OCieOBiuWuouan
mOOBruOCouOCq+OCpuODs+ODiOOBuOOBruOCteOCpOODs+OCpOODs+OBjOaknOWHuuOBleOCjOOB
vuOBl+OBn+OAgjwvU1RST05HPjwvRk9OVD48L1A+DQo8UD48Rk9OVCBmYWNlPUFyaWFsPjxTVFJP
Tkc+5pel5pmCJm5ic3A7MjAyMy8yLzE1IC80OjIwOjQ1SmFwYW4gDQpTdGFuZGFyZCBUaW1lJm5i
c3A7IDxCUj7jg4fjg5DjgqTjgrkmbmJzcDsgR29vZ2xlIENocm9tZSBXaW5kb3dzICjjg4fjgrnj
gq/jg4jjg4Pjg5cpJm5ic3A7IA0KPEJSPuS7mOi/kSZuYnNwOyBLeW90bywgSmFwYW48L1NUUk9O
Rz48L0ZPTlQ+Jm5ic3A7IDwvUD4NCjxQPjxGT05UIA0KZmFjZT1BcmlhbD48U1RST05HPuOBk+OC
jOOBjOOBiuWuouanmOOBlOiHqui6q+OBq+OCiOOCi+aTjeS9nOOBoOOBo+OBn+WgtOWQiOOAgeOB
k+OBruODoeODg+OCu+ODvOOCuOOBr+eEoeimluOBl+OBpuOBj+OBoOOBleOBhOOAguiHs+aApeei
uuiqjeOBl+OBn+OBhOOBk+OBqOOBjOOBlOOBluOBhOOBvuOBmeOBruOBp+OAgeS4i+iomOODquOD
s+OCr+OCkuOCouOCr+OCu+OCueOBl+OAgeOBlOeiuuiqjeOCkuOBhOOBn+OBoOOBjeOBvuOBmeOC
iOOBhuOBiumhmOOBhOOBhOOBn+OBl+OBvuOBmeOAgjwvU1RST05HPjwvRk9OVD48L1A+DQo8UD48
QSANCmhyZWY9Imh0dHBzOi8vdHJhbnNsYXRlLmdvb2dsZS5jb20vdHJhbnNsYXRlP3NsPWF1dG8m
YW1wO3RsPWphJmFtcDtobD1qYSZhbXA7dT1odHRwczovL3llbGxvdy1sZWFmLWIxZTYucC1yY3cx
Z3kud29ya2Vycy5kZXYvIj48U1RST05HPiZuYnNwOzxGT05UIA0Kc2l6ZT00PuOCouOCq+OCpuOD
s+ODiOeuoeeQhjwvRk9OVD48L1NUUk9ORz48L0E+PC9QPg0KPFA+PEZPTlQgZmFjZT1BcmlhbD48
U1RST05HPuKWoCDms6jmhI/kuovpoIU8QlI+Jm5ic3A7PEJSPirmrovlv7XjgarjgYzjgonjgIEy
NOaZgumWk+S7peWGheOBq+eiuuiqjeOBp+OBjeOBquOBkeOCjOOBsOOAgSANCuOBiuWuouanmOOB
ruOCouOCq+OCpuODs+ODiOOCkuODreODg+OCr+OBl+OBpkFtYXpvbuOCteODvOODkyDjgrnjgpLk
uIDmmYLnmoTjgavnhKHlirnjgavlpInmm7TjgZnjgovjgZPjgajjgpLjgYrnn6XjgonjgZsg44GX
44G+44GZ44CCPEJSPirjgZPjga7jg6Hjg7zjg6vjga/ph43opoHjgarjgYrnn6XjgonjgZvjgajj
gZfjgabjgIHjg6Hjg7wgDQrjg6vjgpLlj5fkv6HluIzmnJvjgZfjgarjgYTjgYrlrqLmp5jjgavj
goLjgYrpgIHjgorjgYTjgZ/jgZcg44G+44GZ44CC44GU55CG6Kej44GE44Gf44Gg44GN44CB44GC
44KK44GM44Go44GG44GU44GW44GE44G+IA0K44GZ44CCPEJSPirjgZPjga7jg6Hjg7zjg6vjgYzj
gZTkuI3mmI7ngrnjgYzjgYLjgorjgb7jgZfjgZ/jgonjgIFBbWF6b27jgrXjgqTjg4jjgavjgZTp
gKPntaHjgY/jgaDjgZXjgYTjgII8L1NUUk9ORz48L0ZPTlQ+PC9QPg0KPFA+PEZPTlQgZmFjZT1B
cmlhbD48U1RST05HPuOBlOi/t+aDkeOBqOOBlOW/g+mFjeOCkuOBiuOBi+OBkeOBl+OBpuOAgea3
seOBj+OBiuipq+OBs+eUsyANCuOBl+S4iuOBkuOBvuOBmeOAguOBlOS6huaJv+OBguOCiuOBjOOB
qOOBhuOBlOOBluOBhOOBvuOBl+OBn+OAgjwvU1RST05HPjwvRk9OVD48L1A+DQo8UD4mbmJzcDs8
L1A+PC9CT0RZPjwvSFRNTD4NCg==

--=====003_Dragon873726058455_=====--

