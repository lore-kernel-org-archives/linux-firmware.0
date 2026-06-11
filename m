Return-Path: <SRS0=6PId=EH=realtek.com=jeff_hung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA392CD98C7
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Jun 2026 09:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CAE2B1F00898; Thu, 11 Jun 2026 09:15:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781169323;
	b=CqLza0EsYv7MjPthUTI01cDx8e9WZNa3VxudiHZQ7ArXPItgvEUpjfzsD8mWOd+qxOeG
	 bc6orj+am3Dl3s/HbnUyaVhO01RhrYJ8cDUWmn8rQh4lluuPgTy/GzEXPIyCiVSRO/pql
	 wJ8ucY766KOX5YYiLKoLB6S4f9BsTssHr4XiN2jv4yLIRDx9iy7CDLVB+2PiJqS7S+s3X
	 xVWv/0Sz+fGxdIkqsSOv0rlttETlLcBasVtXRfzqAvlCd1siG0voCLmRQlOuRcUCan647
	 GTY3T1VWCuscja/POk+9xTNjUyCH79vpEs91tOYOuGgX90HQMOeZ8tR1nIHbs7h9XFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781169323;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:List-Id:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4oftlbcwz/UYJFq7NhfHemRgdTcfRoXqQv4BpVcJW5U=;
	b=tQxKdQ8oHmk0QnrhqSRJx5MTrNVB1bZfORsvhwqQ1bXmf35wX7yKDEJtJl5GdqCXCvly
	 jqcBpjuu0RV9N/ssZvRl99GxaMkjYOCMivmE3OxiHlE93kyZ+p7pAOJb7G6pmnJSr6Cqs
	 WDz7f1aQ1Nsvla6VhfIs9WIUuDUYbLSGzxVL/gAGtaLeafGwqYZ1loBBPvfoLBixEuEk5
	 ME5Li7YkPUBw5fRxv/z0/P38zQm9/zjo0Du8jA+bnS+fhggAJcR9rNtFw7JLEOS/rd4Zy
	 IkwA/o9B6fO/G/SaPdzlx+tzCyD2vcacHtX9bA7w4Fqq0IIX4d5YCIeAJkUzVGc976Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=HOo8GYIk;
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDA381F00893;
	Thu, 11 Jun 2026 09:15:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=HOo8GYIk
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DDA381F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65B9F0Ri81826144, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781169300; bh=4oftlbcwz/UYJFq7NhfHemRgdTcfRoXqQv4BpVcJW5U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=HOo8GYIkRjgkhqA2MUWCsIlesyUSgJxQiAfqPHMMA1MGQNJKFSPCJVzOl5cAvmymG
	 ZGhBpOfArC94NPGZKavbvVb9u3ERic5S0cKI3zR7Ldu9eoB8cgz9rQU7YxjKMxPFPu
	 lJhz7YFFVNIRCqBm/l1X+tX2yHce6VKI9Q8iN3/ly1oRw59ufdtkLLqkY0R7HeS6Sm
	 eLKpTYiVKH2xyYaOBD17Rphc+LfuSiKBJc0SFiDba2znApe68jKOZXr0+vPfYEw+p9
	 91ZTah8/bE5ZkpJPRtxjPUKJgAa/7u4SOPtTYWXZkxIc0yWqC8nbpdV3t7h6mqNPaF
	 Ds0FQjZMD+KnA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65B9F0Ri81826144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jun 2026 17:15:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Jun 2026 17:15:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Jun 2026 17:15:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 11 Jun 2026 17:15:00 +0800
From: Jeff_Hung <jeff_hung@realtek.com>
To: Hau <hau@realtek.com>, Johan Alvarado <contact@c127.dev>,
	=?utf-8?B?U0MuQ2hhbmcgKOW8temghuWCkSk=?= <sc.chang@realtek.com>,
	switch.unmanaged <switch.unmanaged@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linusw@kernel.org" <linusw@kernel.org>, "alsi@bang-olufsen.dk"
	<alsi@bang-olufsen.dk>, "dmitry.baryshkov@oss.qualcomm.com"
	<dmitry.baryshkov@oss.qualcomm.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, Pro_switch_support
	<Pro_switch_support@realtek.com>
Subject: RE: RTL8367S DW8051 SerDes firmware: license clarification for
 linux-firmware inclusion
Thread-Topic: RTL8367S DW8051 SerDes firmware: license clarification for
 linux-firmware inclusion
Thread-Index: AQHc+PxCKB91F16lEkKnJqssE19q77Y5AvsggAAQVQA=
Date: Thu, 11 Jun 2026 09:15:00 +0000
Message-ID: <59d763f53097490a9d7d02c2dc5884f1@realtek.com>
References: <0100019eb284f2f3-52c3f99b-b3bf-41a1-87aa-50966385d0b3-000000@email.amazonses.com>
 <b1a0625c970a4e98bfd3fdb27d7dfe5c@realtek.com>
In-Reply-To: <b1a0625c970a4e98bfd3fdb27d7dfe5c@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

K1BNIFNDDQoNCg0KDQotSmVmZg0KDQoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKg0KRW1haWzlhaflrrnmiJblhbbmiYDpmYTkuYvos4fmlpnmiJbmqpTmoYjvvIzl
g4Xkv4Lmj5Dkvpvlj4PogIPkuYvnlKjvvIzosrTlhazlj7jku43mh4npqZforYnnhKHoqqTlvozv
vIznlLHosrTlhazlj7jmsbrlrprmmK/lkKbmjqHnlKgNCkFubmV4ZWQgdG8gdGhlIGFib3ZlLW1l
bnRpb25lZCBkYXRhIG9yIGZpbGVzLCBpdCBqdXN0IHByb3ZpZGVzIHJlZmVyZW5jZSBwdXJwb3Nl
cyBvbmx5IGFuZCB5b3VyIGNvbXBhbnkgDQpzaG91bGQgZGVjaWRlIHdoZXRoZXIgdG8gYWRvcHQg
YWZ0ZXIgdmVyaWZpY2F0aW9uIG9mIHlvdXIgY29tcGFueQ0KKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogSGF1IDxoYXVAcmVhbHRlay5jb20+IA0KU2VudDogVGh1cnNkYXksIEp1bmUgMTEsIDIw
MjYgNDoxNyBQTQ0KVG86IEpvaGFuIEFsdmFyYWRvIDxjb250YWN0QGMxMjcuZGV2PjsgU3dpdGNo
ZmFlIDxTd2l0Y2hmYWVAcmVhbHRlay5jb20+DQpDYzogbGludXN3QGtlcm5lbC5vcmc7IGFsc2lA
YmFuZy1vbHVmc2VuLmRrOyBkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb207IGxpbnV4
LWZpcm13YXJlQGtlcm5lbC5vcmcNClN1YmplY3Q6IFJFOiBSVEw4MzY3UyBEVzgwNTEgU2VyRGVz
IGZpcm13YXJlOiBsaWNlbnNlIGNsYXJpZmljYXRpb24gZm9yIGxpbnV4LWZpcm13YXJlIGluY2x1
c2lvbg0KDQorIFN3aXRjaCBUZWFtIEZBRQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IEpvaGFuIEFsdmFyYWRvIDxjb250YWN0QGMxMjcuZGV2Pg0KPiBTZW50OiBUaHVy
c2RheSwgSnVuZSAxMSwgMjAyNiAxOjEyIEFNDQo+IFRvOiBuaWNfc3dzZCA8bmljX3N3c2RAcmVh
bHRlay5jb20+DQo+IENjOiBsaW51c3dAa2VybmVsLm9yZzsgYWxzaUBiYW5nLW9sdWZzZW4uZGs7
IA0KPiBkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb207IGxpbnV4LWZpcm13YXJlQGtl
cm5lbC5vcmcNCj4gU3ViamVjdDogUlRMODM2N1MgRFc4MDUxIFNlckRlcyBmaXJtd2FyZTogbGlj
ZW5zZSBjbGFyaWZpY2F0aW9uIGZvciANCj4gbGludXgtZmlybXdhcmUgaW5jbHVzaW9uDQo+IA0K
PiANCj4gRXh0ZXJuYWwgbWFpbCA6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUg
dGhlIG9yZ2FuaXphdGlvbi4gDQo+IERvIG5vdCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4g
YXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgDQo+IHRoZSBzZW5kZXIgYW5kIGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gSGVsbG8sDQo+IA0KPiBJIGFtIHRo
ZSBhdXRob3Igb2YgYSBwYXRjaCBzZXJpZXMgY3VycmVudGx5IHVuZGVyIHJldmlldyBvbiBuZXRk
ZXYsIA0KPiBhZGRpbmcgU0dNSUkvSFNHTUlJIHN1cHBvcnQgZm9yIHRoZSBSVEw4MzY3UyBzd2l0
Y2ggdG8gdGhlIG1haW5saW5lIA0KPiBMaW51eCBydGw4MzY1bWIgRFNBIGRyaXZlcjoNCj4gDQo+
IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvMDEwMDAxOWViMGIxODIyZS1mZmM1
NjI2Yy0xYjlmLTRjOGEtOGExDQo+IGEtNzU5YTllNjY1ZjRmLTAwMDAwMEBlbWFpbC5hbWF6b25z
ZXMuY29tLw0KPiANCj4gQnJpbmdpbmcgdXAgdGhlIFNlckRlcyBvbiB0aGlzIGNoaXAgcmVxdWly
ZXMgbG9hZGluZyBhIHNtYWxsIGZpcm13YXJlIA0KPiBibG9iDQo+ICgxMjMzIGJ5dGVzKSBpbnRv
IHRoZSBlbWJlZGRlZCBEVzgwNTEgbWljcm9jb250cm9sbGVyLiBUaGUgZHJpdmVyIA0KPiByZXF1
ZXN0cyBpdCB2aWEgdGhlIGtlcm5lbCBmaXJtd2FyZSBBUEkgYXMgcmVhbHRlay9ydGw4MzY3cy1z
Z21paS5iaW4uDQo+IA0KPiBUaGUgb25seSBwdWJsaWMgc291cmNlIG9mIHRoaXMgYmxvYiBpcyB0
aGUgcnRsODM2N2MgdmVuZG9yIFNESyBhcyANCj4gZGlzdHJpYnV0ZWQgaW4gR1BMIHNvdXJjZSBj
b2RlIHJlbGVhc2VzIGJ5IFJlYWx0ZWsncyBjdXN0b21lcnMgKGluIG15IA0KPiBjYXNlIHRoZSBN
ZXJjdXN5cyBNUjgwWCB2MiBHUEwgY29kZSBkcm9wKSwgd2hlcmUgaXQgaXMgZW1iZWRkZWQgYXMg
YSANCj4gYnl0ZSBhcnJheSAoU2dtaWlfSW5pdFtdIGluIHJ0bDgzNjdjX2FzaWNkcnZfcG9ydC5j
KS4NCj4gDQo+IEkgc3VibWl0dGVkIHRoZSBibG9iIHRvIGxpbnV4LWZpcm13YXJlOg0KPiANCj4g
DQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9rZXJuZWwtZmlybXdhcmUvbGludXgtZmlybXdhcmUvLS9t
ZXJnZV9yZXF1ZXN0cy8xMDkNCj4gMg0KPiANCj4gYnV0IGl0IGNhbm5vdCBiZSBhY2NlcHRlZCBp
biBpdHMgY3VycmVudCBzdGF0ZTogdGhlIHN1cnJvdW5kaW5nIFNESyANCj4gY29kZSBpcyBHUEwt
bGljZW5zZWQsIHlldCB0aGUgYWN0dWFsIHNvdXJjZSBjb2RlIG9mIHRoZSA4MDUxIG1pY3JvY29k
ZSANCj4gaGFzIG5ldmVyIGJlZW4gcHVibGlzaGVkLCBzbyB0aGUgZWZmZWN0aXZlIGxpY2Vuc2Ug
b2YgdGhlIGJsb2IgaXMgDQo+IHVuY2xlYXIgYW5kIEdQTCBjb21wbGlhbmNlIGNhbm5vdCBiZSBt
ZXQgYnkgcmVkaXN0cmlidXRpbmcgaXQgKHNlZSANCj4gcmV2aWV3IGJ5IERtaXRyeSBCYXJ5c2hr
b3YgaW4gdGhlIE1SIGFib3ZlKS4NCj4gDQo+IE1heSBJIGFzayBSZWFsdGVrIGZvciBvbmUgb2Yg
dGhlIGZvbGxvd2luZzoNCj4gDQo+ICAgMS4gU3VibWl0IHRoZSBmaXJtd2FyZSB0byBsaW51eC1m
aXJtd2FyZSBkaXJlY3RseSwgd2l0aCBhbg0KPiAgICAgIGFwcHJvcHJpYXRlIHJlZGlzdHJpYnV0
aW9uIGxpY2Vuc2UsIGFzIHRoZSBSZWFsdGVrIE5JQyB0ZWFtDQo+ICAgICAgYWxyZWFkeSBkb2Vz
IGZvciB0aGUgcnRsX25pYyBmaXJtd2FyZSBmaWxlczsgb3INCj4gDQo+ICAgMi4gUHJvdmlkZSBh
biBleHBsaWNpdCBsaWNlbnNlIHN0YXRlbWVudCBwZXJtaXR0aW5nIHJlZGlzdHJpYnV0aW9uDQo+
ICAgICAgb2YgdGhpcyBmaXJtd2FyZSB2aWEgbGludXgtZmlybXdhcmUsIGFuZCBBQ0sgdGhlIG1l
cmdlIHJlcXVlc3QNCj4gICAgICBhYm92ZS4NCj4gDQo+IElmIHRoaXMgbWFpbGJveCBpcyBub3Qg
dGhlIHJpZ2h0IGNvbnRhY3QgZm9yIHRoZSBzd2l0Y2ggcHJvZHVjdCBsaW5lLCANCj4gSSB3b3Vs
ZCBiZSB2ZXJ5IGdyYXRlZnVsIGlmIHlvdSBjb3VsZCBmb3J3YXJkIHRoaXMgcmVxdWVzdCB0byB0
aGUgdGVhbSANCj4gcmVzcG9uc2libGUgZm9yIHRoZSBSVEw4MzY3UyAvIHJ0bDgzNjdjIFNESywg
b3IgcG9pbnQgbWUgdG8gdGhlIHJpZ2h0IGNvbnRhY3QuDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlv
dXIgdGltZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gSm9oYW4gQWx2YXJhZG8gPGNvbnRhY3RA
YzEyNy5kZXY+DQo=
